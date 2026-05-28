# Yuanxian-Consciousness

**Yuanxian Consciousness Field Theory (XCFT) — Lean 4 & Coq Formalization**

This repository contains the formal verification code for the paper:

> *Yuanxian Consciousness Field Theory: A Universal Unified Theory of Consciousness Based on T⁶⁴ Topology and Self-Referential Mind Field Axioms*

## Overview

This project provides dual formalization (Lean 4 and Coq) of the core concepts including:
- TCSC axiom and self-referential structures
- T⁶⁴ topology and Mind Field Ψ_SR
- Consciousness field dynamical equation
- Five-level consciousness hierarchy
- Key theorems on collapse, resonance and mind-body unity
- 
## Repository Structure

. ├── lake.toml ├── README.md ├── .gitignore ├── lean/ │   └── YuanxianConsciousness/          # Lean 4 formalization │       ├── Basic.lean │       ├── T64Topology.lean │       ├── Dynamics.lean │       ├── HilbertMind.lean │       └── ConsciousnessTheorems.lean ├── coq/ │   ├── _CoqProject │   ├── Makefile │   └── YuanxianConsciousness/          # Coq formalization │       ├── Basic.v │       ├── T64Topology.v │       ├── Dynamics.v │       ├── Hierarchy.v │       └── Theorems.v └── LICENSE

## Build Instructions

**Lean 4:**
```bash
lake exe cache get
lake build

**Coq:**
cd coq
make

### Citation
@misc{YuanXianConsciousness2026,
  author       = {Zhenyuan Asheli (真圆阿奢黎)},
  title        = {Yuanxian-Consciousness: Lean 4 and Coq Formalization of XCFT},
  year         = {2026},
  url          = {https://github.com/YuanXian-Theory/YuanXian-Consciousness}
}

