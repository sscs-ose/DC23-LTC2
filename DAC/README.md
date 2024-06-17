# Team.Korea - Digital-to-Analog Conveter
## Architecture
- segmented current steering DAC
  - 6MSB : thermometer coded
  - 4LSB : binary coded
## Details
- referece current source : 2uA
- nominal current
  - 1x : 10uA
  - 2x : 20uA
  - 4x : 40uA
  - 8x : 80uA
  - 16x : 160uA
## Schematics : Xschem
you should run Xschem in "xschem" folder with xschemrc.  
"10bit_Counter.sh" automatically generates the SPICE code for a 10-bit counter used in simulations. We can configure various options for the counter.
### in "xschem" folder
there are
- "dac_[name].sch" files : schematics 
- "std_cell" folder : symbols for standard cell library of GF180MCU
- "tb" folder : testbenches to simulate each blocks
## Layouts : Klayout
## Digital Synthesis : Openlane
- "src" folder : RTL code of binary-to-thermometer decoder
- "runs" folder : results after synthesizing
- "config.json" file : configure design properly
- "pin_order.cfg" file : configure pin order 
