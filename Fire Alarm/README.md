# 🔥 Fire Alarm System using Verilog

## 📌 Project Description

This project implements a simple Fire Alarm System using Verilog HDL.

The system monitors smoke and temperature sensors.

If smoke is detected or the temperature becomes high, the alarm
and warning indicators are activated.

When the environment returns to normal, the alarm and warning
indicators are turned OFF.

## ⚙️ Features

- Smoke detection
- High-temperature detection
- Automatic alarm activation
- Warning indicator
- Reset functionality
- Verilog testbench
- VCD waveform generation
- Icarus Verilog simulation
- GTKWave waveform analysis

## 🔥 Input Signals

| Input | Value | Meaning |
|---|---|---|
| Smoke | 0 | No smoke |
| Smoke | 1 | Smoke detected |
| High Temperature | 0 | Normal |
| High Temperature | 1 | High temperature |

## 🚨 Output Signals

| Condition | Alarm | Warning |
|---|---:|---:|
| No smoke + Normal temperature | 0 | 0 |
| Smoke detected | 1 | 1 |
| High temperature | 1 | 1 |
| Smoke + High temperature | 1 | 1 |

## 📂 Project Structure

```text
fire-alarm-verilog/
│
├── fire_alarm.v
├── fire_alarm_tb.v
└── README.md
