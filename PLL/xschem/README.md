# gf180_pll
Analog PLL testbench

* input : 8MHz
* output : 48/40MHz
* VDD : 3.3V

# Files
* pll_bench - PLL and its benchmark
* pfd, pfd2 - PFD 
* cp - Charge pump
* lf, lf2 - Loop filter
* ctrlsel - Vctrl selector
  * tmg -Transmission gate
* vco - VCO
  * inv_bias - Special inverter for the ring oscillator
* fdiv - Buffer and Clock divider
* sw - Output switch