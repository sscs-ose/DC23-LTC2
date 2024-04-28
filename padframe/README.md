# LTC2 Padframe Directory

## Sources

Japan Team on https://github.com/atuchiya/DC23-LTC2/tree/japan-test/TOP/klayout


## Makefile

For now, only drc rules are defined just to evaluate each layout.

To perform deep (per cell) drc on a design
~~~
make GDS=chile/ldo.gds drc
~~~

The offgrid check doesn't require `run_mode=flat`, on most of the cases.

~~~
make GDS=chile/ldo.gds drc-offgrid
make GDS=chile/ldo.gds drc-view
~~~


IMPORTANT: 
- Each design top cell name should be the same of the gds file