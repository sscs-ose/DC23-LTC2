drc off

load_layout $env(LAYOUT) $env(TOP)
generate_lvs_spice $env(TOP)

quit -noprompt