
#!/bin/bash

subckt_file="10bit_Counter.sp"

#Shell script variables
vdd=3.3V 
vss=0V
rt=2 #Rise time
ft=$rt #Fall time
td=10 #Delay time
prd=50 #Period
pw=$((prd/2)) #Pulse width

#Create SPICE netlist file
echo "* 10-bit Counter" > $subckt_file
echo ".SUBCKT 10bit_Counter OUT0 OUT1 OUT2 OUT3 OUT4 OUT5 OUT6 OUT7 OUT8 OUT9" >> $subckt_file

echo "* Output configuration" >> $subckt_file
for i in {1..10}; do
    echo "VPULSE_$((i-1)) OUT$((i-1)) 0 PULSE($vss $vdd $((td+pw*(2**(i-1)-1)))"n" $rt"n" $ft"n" $((prd*(2**(i-1))/2-rt))"n" $((prd*2**(i-1)))"n") " >> $subckt_file
done

#echo "VPULSE_0 OUT0 0 PULSE($vss $vdd $td"n" $rt"n" $ft"n" $((1*pw-rt))"n" $((1*prd))"n") " >> $subckt_file
#echo "VPULSE_1 OUT1 0 PULSE($vss $vdd $((td+(prd/2)))"n" $rt"n" $ft"n" $((2*pw-rt))"n" $((2*prd))"n") " >> $subckt_file
#echo "VPULSE_2 OUT2 0 PULSE($vss $vdd $((td+(1*prd)))"n" $rt"n" $ft"n" $((4*pw-rt))"n" $((4*prd))"n") " >> $subckt_file
#echo "VPULSE_3 OUT3 0 PULSE($vss $vdd $((td+(2*prd)))"n" $rt"n" $ft"n" $((8*pw-rt))"n" $((8*prd))"n") " >> $subckt_file
#echo "VPULSE_4 OUT4 0 PULSE($vss $vdd $((td+(4*prd)))"n" $rt"n" $ft"n" $((16*pw-rt))"n" $((16*prd))"n") " >> $subckt_file
#echo "VPULSE_5 OUT5 0 PULSE($vss $vdd $((td+(8*prd)))"n" $rt"n" $ft"n" $((32*pw-rt))"n" $((32*prd))"n") " >> $subckt_file
#echo "VPULSE_6 OUT6 0 PULSE($vss $vdd $((td+(16*prd)))"n" $rt"n" $ft"n" $((64*pw-rt))"n" $((64*prd))"n") " >> $subckt_file
#echo "VPULSE_7 OUT7 0 PULSE($vss $vdd $((td+(32*prd)))"n" $rt"n" $ft"n" $((128*pw-rt))"n" $((128*prd))"n") " >> $subckt_file
#echo "VPULSE_8 OUT8 0 PULSE($vss $vdd $((td+(64*prd)))"n" $rt"n" $ft"n" $((256*pw-rt))"n" $((256*prd))"n") " >> $subckt_file
#echo "VPULSE_9 OUT9 0 PULSE($vss $vdd $((td+(128*prd)))"n" $rt"n" $ft"n" $((512*pw-rt))"n" $((512*prd))"n") " >> $subckt_file

echo ".ENDS" >> $subckt_file
