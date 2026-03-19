# AXI4-Stream Synchronous FIFO (Infinity Fabric Style)

## Overview
This project implements a Synchronous FIFO (First-In-First-Out) buffer utilizing the industry-standard **AXI4-Stream** protocol. It serves as a fundamental building block for data transport infrastructures, where robust flow control is mandatory.

## Technical Specifications
* **Protocol:** AXI4-Stream (Slave & Master interfaces).
* **Handshaking:** Full implementation of `TVALID` and `TREADY` signals.
* **Storage:** 16-deep circular buffer (parameterized).
* **Target Device:** Xilinx Spartan-7 (XC7S25CSGA324-2).



## Design Highlights
* **Backpressure Management:** The FIFO automatically de-asserts `s_axis_tready` when full, signaling the source to stall and preventing data loss.
* **Circular Buffer Logic:** Managed via read/write pointers with an extra bit for unambiguous Full/Empty state detection.
* **Zero-Latency Ready:** The `tready` signal reacts instantly to the internal state, ensuring maximum bus utilization.

## Testbench Scenarios
The included testbench verifies three critical corner cases:
1. **Backpressure Test:** Writing 16+ values to observe the `tready` drop (Stall condition).
2. **Empty Read:** Attempting to read from an empty FIFO to verify `tvalid` remains low.
3. **Continuous Throughput:** Simultaneous read/write operations at maximum clock speed.
