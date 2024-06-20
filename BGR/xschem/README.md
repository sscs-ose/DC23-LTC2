# BGR and Current Source : schematic design

## BGR : diode + current mirror

- core schematic file: bgr_diode.sch
- symbol file: bgr_diode.sym
- test bench file: tbdc_bgr_diode.sch
- pin list: vdd (3.3 V supply), vss (ground), vout (voltage output)
- output voltage (target) : 1.2 V

![image](https://github.com/atuchiya/chipathon2023/assets/49263791/84613c58-23aa-4807-87c5-d8d372964450)

Against Vdd variation (3.0 V - 3.3 V), output voltage fluctuation is 43 mV (3.6 %)

![image](https://github.com/atuchiya/chipathon2023/assets/49263791/3cb59360-70e5-423d-8992-43fbc083fabc)

Against temperature variation (-50 deg. - 125 deg.), output voltage fluctuation is 1.2 mV (0.1%)

![image](https://github.com/atuchiya/chipathon2023/assets/49263791/d19f5c41-78d3-44e0-9319-8f65b84ad1bd)

## Current source : Vth referenced current source + current mirror

- core schematic file: cs_vthref.sch
- symbol file: cs_vthref.sym
- test bench file: tbdc_cs_vthref.sch
- pin list: vdd (3.3 V supply), vss (ground), vb (bias voltage for pMOS current mirror)
- current: 20 uA

![image](https://github.com/atuchiya/chipathon2023/assets/49263791/3d4f6082-c33a-4986-9ab0-b2a28a172254)

Against Vdd variation (3.0 V - 3.3 V), current fluctuation is 0.38 uA (1.9%)

![image](https://github.com/atuchiya/chipathon2023/assets/49263791/9ba7c4bc-c648-453e-81b2-08a2b0e945e7)

Against temperature variation (-50 deg. - 125 deg.), current fluctuation is 3.2 uA (16%).
Against variation from 0 deg. to 40 deg., fluctuation is 0.69 uA (3.5%)

![image](https://github.com/atuchiya/chipathon2023/assets/49263791/e4a7ebc7-c91a-4f9a-a9f6-7b5d7dd14e8f)


