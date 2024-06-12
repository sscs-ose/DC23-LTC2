#!/bin/bash

NETGEN_RC=$PDK_ROOT/gf180mcuD/libs.tech/netgen/setup.tcl

compare () {
    global NETGEN_RC
    netgen -batch lvs \
        "gf180mcu_fd_io.cdl   $1" \
        "gf180mcu_fd_io.spice $1" \
        $NETGEN_RC \
        comparison_$1.comp
}

test () {
    exit 1
    ./compare.sh gf180mcu_fd_io__asig_5p0  # 
    ./compare.sh gf180mcu_fd_io__bi_24t    #
    ./compare.sh gf180mcu_fd_io__bi_t      #
    ./compare.sh gf180mcu_fd_io__brk2      # No devices
    ./compare.sh gf180mcu_fd_io__brk5      # No devices
    ./compare.sh gf180mcu_fd_io__cor       #
    ./compare.sh gf180mcu_fd_io__dvdd      #
    ./compare.sh gf180mcu_fd_io__dvss      #
    ./compare.sh gf180mcu_fd_io__fill1     # No devices
    ./compare.sh gf180mcu_fd_io__fill5     # No devices
    ./compare.sh gf180mcu_fd_io__fill10    # No match
    ./compare.sh gf180mcu_fd_io__fillnc    # No devices
    ./compare.sh gf180mcu_fd_io__in_c      # No match
    ./compare.sh gf180mcu_fd_io__in_s      # No match

    # Fundamental Difference: One uses the devices as subckts (X), the other as models (D, C, M).
    # The syntaxis of models specification is too much different.
}

compare $@
