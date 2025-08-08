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

#### Reset 
<img width="1153" height="465" alt="image" src="https://github.com/user-attachments/assets/6676acfe-90ad-4cc1-a657-55d1109a3f4f" />

#### Backdoor Acsess
<img width="1108" height="487" alt="image" src="https://github.com/user-attachments/assets/7f15fe3a-aa06-4da7-9d4f-4d1e93d8b9b0" />

#### Regression Test
<img width="1143" height="464" alt="image" src="https://github.com/user-attachments/assets/960a0499-400f-426e-8310-671eb7b7ec20" />

### Coverage Report
<img width="835" height="496" alt="image" src="https://github.com/user-attachments/assets/0438814d-202d-42cd-ac69-6c5d15528ecf" />




