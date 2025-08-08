# APB RAL
## Project Overview

This project implements a simple APB-based register interface with four 32-bit read/write registers (ctrl, Reg1–Reg4). Each register has a defined offset and reset value. The APB interface uses standard control and data signals.It includes:

- UVM register classes for RW registers

- Sequences for read, write, update, reset

- Field-level functional coverage

- Reset and RTL/RAL consistency checks

## Specifications
[RAL Specification](https://mirafra2-my.sharepoint.com/:w:/g/personal/shreyasb_mirafra2_onmicrosoft_com/EaJ5KQykX4xGpFbweqN0TPABRn_jglwecZ1EimoOWgNttA?wdOrigin=TEAMS-MAGLEV.p2p_ns.rwc&wdExp=TEAMS-TREATMENT&wdhostclicktime=1754633041242&web=1)

## Test Cases
### Test Case 1 : Frontdoor Register Access
Validate that each register supports correct read and write operations using frontdoor access.

### Test Case 2 : Reset Value Verification
Verify that the default reset value of all registers matches the expected specification.

### Test Case 3 : Backdoor Register Access
Verify that all registers can be accessed correctly via backdoor read and write methods.

## Results:
### Waveforms
#### Frontdoor Access
<img width="1163" height="473" alt="image" src="https://github.com/user-attachments/assets/7092688f-9ff2-477c-b00f-1b2718216d0f" />

