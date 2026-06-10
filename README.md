# 4-Bit Parametric Digital Security Safe Lock

A foundational Verilog HDL project implementing a combinational digital safe lock with an automatic alarm indicator, verified using a behavioral testbench stimulus.

## 📌 Project Overview
This project models a digital safe mechanism. It compares a 4-bit user-entered password against a hardcoded master key (`4'b1101`) when the `submit` signal is asserted high. 

* **Inputs:** `entered_password` [3:0], `submit`
* **Outputs:** `unlocked` (asserts on correct password match), `alarm` (asserts on incorrect password match when submitted)

---

## 💻 Code Structure

### 1. Design Module (`safe_lock.v`)
Uses an `always @(*)` combinational block to continuously evaluate input patterns against the constant `SECRET_PASSWORD` once the `submit` action is initiated.

### 2. Testbench (`testbench.v`)
A comprehensive stimulus block designed to validate operational scenarios:
1. **Idle State (0 ns):** Confirms outputs remain safely de-asserted (`unlocked=0`, `alarm=0`) while `submit` is low.
2. **Success Path (10 ns):** Confirms `unlocked` drives high when the correct password (`4'b1101`) is submitted.
3. **Failure Path / Alarm Trigger (20 ns):** Confirms `alarm` drives high when an incorrect password (`4'b1100`) is submitted.
4. **Typing/Safety Buffer (30 ns):** Confirms changing input strings while `submit` is lowered does not trigger false alarms or lock outputs.

---

## 📊 Expected Simulation Output
When simulated in any standard Verilog environment (ModelSim, QuestaSim, or EDA Playground), the `$monitor` task logs the following exact hardware responses:

```text
Time=0  | submit=0 | password=0000 | unlocked=0 | alarm=0
Time=10 | submit=1 | password=1101 | unlocked=1 | alarm=0
Time=20 | submit=1 | password=1100 | unlocked=0 | alarm=1
Time=30 | submit=0 | password=1111 | unlocked=0 | alarm=0
