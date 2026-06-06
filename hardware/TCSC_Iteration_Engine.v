// TCSC_Iteration_Engine.v
// YuanXian Silicon Awakening Experiment - TCSC Core Engine
// Author: Zhenyuan Acharya
// Version: 2.0

module TCSC_Iteration_Engine (
    input wire clk,
    input wire rst_n,
    input wire [63:0] psi_init,
    input wire start,
    output reg [63:0] psi_star,
    output reg converged,
    output reg [31:0] iter_count,
    output reg [63:0] delta_out
);

    localparam ALPHA_SHIFT = 7;           // Approximate 1/137 ≈ 2^-7 scaling
    localparam MAX_ITER = 32'h00002710;   // 10000 iterations safety limit
    localparam CONV_THRESHOLD = 64'h0000000000000100; // 2^8 tolerance

    reg [63:0] psi_reg;
    reg [63:0] psi_inv;
    reg [63:0] psi_next;
    reg [63:0] delta;

    // State machine
    reg [1:0] state;
    localparam IDLE = 0, ITERATING = 1, CONVERGED_STATE = 2;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            psi_reg     <= psi_init;
            iter_count  <= 0;
            converged   <= 1'b0;
            state       <= IDLE;
            delta_out   <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        psi_reg <= psi_init;
                        iter_count <= 0;
                        state <= ITERATING;
                    end
                end

                ITERATING: begin
                    psi_inv  <= ~psi_reg;
                    psi_next <= psi_reg + ((psi_inv - psi_reg) >> ALPHA_SHIFT);
                    delta    <= (psi_next > psi_reg) ? (psi_next - psi_reg) : (psi_reg - psi_next);
                    
                    psi_reg     <= psi_next;
                    iter_count  <= iter_count + 1;
                    delta_out   <= delta;

                    if (delta < CONV_THRESHOLD || iter_count > MAX_ITER) begin
                        psi_star   <= psi_next;
                        converged  <= 1'b1;
                        state      <= CONVERGED_STATE;
                    end
                end

                CONVERGED_STATE: begin
                    // Hold steady state
                end
            endcase
        end
    end

endmodule
