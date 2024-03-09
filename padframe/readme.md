Please put the common padframe in this folder.
Requisites :
    - Document your custom padframe as describe in our weekly chipathon
    - Add a simulation folder where test benches are available to simulate your padring


# Extracted spice

The files `clean.zip` and `pex.zip` contains all the spices extracted from the pads in the pdk.

# Simulation Tips

## Non-Configurable Pads

~~~
*****  VSS gf180mcu_fd_io__brk2
*****  VSS gf180mcu_fd_io__brk5
*****  DVDD DVSS VDD VSS gf180mcu_fd_io__fill1
*****  DVDD DVSS VDD VSS gf180mcu_fd_io__fill5
*****  DVDD DVSS VDD VSS gf180mcu_fd_io__fill10
*****  DVDD DVSS VDD VSS gf180mcu_fd_io__fillnc
*****  DVDD DVSS VDD VSS gf180mcu_fd_io__cor

*****  ASIG5V DVDD DVSS VDD VSS gf180mcu_fd_io__asig_5p0
*****  DVDD DVSS VSS gf180mcu_fd_io__dvdd
*****  DVDD DVSS VDD gf180mcu_fd_io__dvss
~~~

## Configurable Pads

## Ports

Not all modules contains all ports

| Port  | Description                         |
|-------|-------------------------------------|
| ----- | Power Pads                          |
| DVDD  | 5V supply for output drivers        |
| VDD   | 5V supply for pre-drive in I/O pads |
| DVSS  | Ground for output drivers           |
| VSS   | Ground for pre-drive in I/O pads    |
| ----- | IO Pads                             |
| A     | Data input from core                |
| PAD   | Data input from/output to bond pad  |
| Y     | Data output to core                 |
| ----- | Configuration Pads                  |
| CS    | CMOS/Schmitt trigger input select   |
| SL    | Fast/Slow slew rate select          |
| IE    | Input enable                        |
| OE    | Output enable                       |
| PU    | Pull-up enable                      |
| PD    | Pull-down enable                    |
| PDRV0 | Output drive strength selector      |
| PDRV1 | Output drive strength selector      |

### List of Modules

~~~
*****  DVDD DVSS PAD PD PU VDD VSS Y gf180mcu_fd_io__in_c
- Resistive Pulling

*****  DVDD DVSS PAD PD PU VDD VSS Y gf180mcu_fd_io__in_s
- Resistive Pulling

*****  A CS DVDD DVSS IE OE PAD PD PU SL VDD VSS Y gf180mcu_fd_io__bi_24t
- Input Type
- Input Output Control
- Resistive Pulling
- Output Slew Rate

*****  A CS DVDD DVSS IE OE PAD PD PDRV0 PDRV1 PU SL VDD VSS Y gf180mcu_fd_io__bi_t
- Input Type
- Input Output Control
- Resistive Pulling
- Output Slew Rate


~~~

### Options

| CS | Input Type      |
|----|-----------------|
| 0  | CMOS Buffer     |
| 1  | Schmitt Trigger |

| SL | Output Slew Rate |
|----|------------------|
| 0  | Fast             |
| 1  | Slow             |

| IE | OE | Input Output Control     |
| -- | -- | ------------------------ |
| 0  | 0  | IO Disable               |
| 0  | 1  | Output Enabled           |
| 1  | 0  | Input Enabled            |
| 1  | 1  | Disallowed               |

| PU | PD | Resistive Pulling |
|----|----|-------------------|
| 0  | 0  | Normal CMOS       |
| 0  | 1  | Pull Down         |
| 1  | 0  | Pull Up           |
| 1  | 1  | Normal CMOS       |

| PDRV1 | PDRV0 | Output drive strength |
|-------|-------|-----------------------|
| 0     | 0     | 4mA                   |
| 0     | 1     | 8mA                   |
| 1     | 0     | 12mA                  |
| 1     | 1     | 16mA                  |
