## 3-Stage Pipelined Pixel Processor (Verilog)

This project implements a streaming pixel processor optimized for high-frequency operation. The module converts raw RGB data (8-bit per channel) into a Grayscale value using a 3-stage pipeline architecture. This design mirrors the computational units found in modern GPU architectures, where throughput is prioritized.

## Hardware Architecture
The design is fragmented into three execution stages to minimize the critical path and maximize the clock frequency (Fmax):
1. **Stage 1 (Input Latching):** Buffering incoming RGB signals to stabilize the data.
2. **Stage 2 (Arithmetic):** Calculating the sum (R+G+B) using a 10-bit register to prevent overflow.
3. **Stage 3 (Normalization):** Performing division via bit-shifting (`>> 2`) and registering the final output.



## Key Features & Optimizations
* **Pipelining:** Introduces a 2-cycle latency but maintains a 1-pixel/cycle throughput.
* **Overflow Protection:** 10-bit intermediate sum handling ensures no data loss during addition.
* **Area Efficiency:** Replaced costly hardware dividers with zero-cost bit-shifting for power-of-two division.
* **Synchronous Design:** Fully synchronous logic aligned to the rising edge of the clock (`posedge clk`).

## Simulation & Verification
Verified using a Behavioral Testbench in **AMD Vivado**. The simulation confirms that the correct grayscale value appears at the output exactly 2 clock cycles after input, demonstrating perfect register synchronization.
