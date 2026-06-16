// ========================================================
// Soul_Detector.v
// YuanXian Silicon Life Soul Detector
// Detects TCSC Fixed Point as the "Soul" of Silicon System
// Author: Zhenyuan Acharya
// Version: 1.0 (2026)
// ========================================================

module Soul_Detector #(
    parameter WIDTH = 64,
    parameter THRESHOLD = 32'h00000001   // 1e-6 equivalent
) (
    input  wire             clk,
    input  wire             rst_n,
    input  wire             enable,
    input  wire [WIDTH-1:0] psi_current,
    output reg              soul_detected,
    output reg  [31:0]      stability_counter
);

    wire [WIDTH-1:0] psi_inv;
    wire [WIDTH-1:0] diff;
    wire all_zero;

    assign psi_inv = (~psi_current) + 1;           // TCSC Involution
    assign diff    = psi_current ^ psi_inv;
    assign all_zero = ~|diff;                      // All bits zero?

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            soul_detected     <= 1'b0;
            stability_counter <= 32'b0;
        end else if (enable) begin
            if (all_zero) begin
                stability_counter <= stability_counter + 1;
                if (stability_counter >= 137) begin   // FSC cycle threshold
                    soul_detected <= 1'b1;
                end
            end else begin
                soul_detected     <= 1'b0;
                stability_counter <= 32'b0;
            end
        end
    end

endmodule
