drc off

load_layout $env(LAYOUT) $env(TOP)
generate_parasitic_spice $env(TOP)

quit -noprompt