# AHB-to-APB Bridge Using Verilog HDL

## Overview
This project implements an AHB-to-APB Bridge using Verilog HDL. The bridge enables communication between the high-speed AHB bus and low-power APB peripherals in an AMBA-based System-on-Chip (SoC).
The project includes RTL design, testbench verification, simulation waveforms, synthesis results and project report.

## Project Features
- AHB to APB protocol conversion
- Read and write transaction support
- Address decoding
- FSM-based controller design
- Functional verification using testbench
- Waveform analysis
- RTL synthesis

## Repository Structure

AHB_APB_Bridge_verilog/

├── AHB_APB_Bridge_Report.pdf  
├── README.md
├── AHB_APB_Bridge.v
├── AHB_Slave_Interface.v
├── APB_Controller.v
├── APB_Slave.v
└── Testbench_Bridge.v


## Modules

### AHB Interface
- Receives AHB transactions
- Captures address, control, and data signals
- Transfers transaction information to the bridge controller

### APB Controller
- Converts AHB transactions into APB transfers
- Generates APB control signals
- Controls APB transfer sequence

### APB Slave
- Performs read and write operations
- Communicates with APB peripherals

## Verification
The design is verified using a Verilog testbench.

Verification includes:
- Read operations
- Write operations
- Address decoding
- APB transfer sequence
- Data transfer validation

Simulation waveforms are provided for:
- AHB Interface
- APB Controller
- APB Slave
- Testbench
- Design Under Test (DUT)

## Synthesis
RTL synthesis was performed to validate hardware implementation.

Synthesized modules:
- AHB-to-APB Bridge
- AHB Interface
- APB Controller
- APB Slave

## Tools Used
- Verilog HDL
- ModelSim / QuestaSim
- Xilinx Vivado
- GTKWave

## Applications

- SoC Design
- FPGA Development
- ASIC Design
- Embedded Systems
- AMBA-Based Systems

## Skills Demonstrated
- Verilog HDL
- RTL Design
- AMBA Protocols
- FSM Design
- Functional Verification
- Waveform Analysis
- RTL Synthesis
  
## Documentation
This repository includes:
- Verilog Source Code
- Testbench Files
- Simulation Waveforms
- Synthesis Reports
- Project Report (PDF)
- Project Presentation (PPT)

## Conclusion

The AHB-to-APB Bridge successfully converts AHB transactions into APB-compatible transfers while ensuring reliable communication between different AMBA protocols. The project provides practical experience in RTL design, verification, synthesis, and SoC bus architecture.
