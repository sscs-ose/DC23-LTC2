drc off

load_layout $env(LAYOUT) $env(TOP)
generate_parasitic_spice $env(PEX_DIR) $env(TOP)

quit -noprompt