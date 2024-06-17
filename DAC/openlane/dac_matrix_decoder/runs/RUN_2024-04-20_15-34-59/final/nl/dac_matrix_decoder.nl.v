module dac_matrix_decoder (b_in,
    t_out);
 input [2:0] b_in;
 output [6:0] t_out;

 wire _00_;
 wire _01_;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;

 gf180mcu_fd_sc_mcu7t5v0__or2_1 _02_ (.A1(net2),
    .A2(net3),
    .Z(net5));
 gf180mcu_fd_sc_mcu7t5v0__or2_1 _03_ (.A1(net1),
    .A2(net5),
    .Z(net4));
 gf180mcu_fd_sc_mcu7t5v0__aoi21_1 _04_ (.A1(net1),
    .A2(net2),
    .B(net3),
    .ZN(_00_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _05_ (.I(_00_),
    .ZN(net6));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _06_ (.A1(net2),
    .A2(net3),
    .Z(net9));
 gf180mcu_fd_sc_mcu7t5v0__oai21_1 _07_ (.A1(net1),
    .A2(net2),
    .B(net3),
    .ZN(_01_));
 gf180mcu_fd_sc_mcu7t5v0__clkinv_1 _08_ (.I(_01_),
    .ZN(net8));
 gf180mcu_fd_sc_mcu7t5v0__and2_1 _09_ (.A1(net1),
    .A2(net9),
    .Z(net10));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 _10_ (.I(net3),
    .Z(net7));
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_0_Right_0 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_1_Right_1 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_2_Right_2 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_3_Right_3 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_4_Right_4 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_5_Right_5 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_6_Right_6 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_7_Right_7 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_8_Right_8 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_9_Right_9 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_0_Left_10 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_1_Left_11 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_2_Left_12 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_3_Left_13 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_4_Left_14 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_5_Left_15 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_6_Left_16 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_7_Left_17 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_8_Left_18 ();
 gf180mcu_fd_sc_mcu7t5v0__endcap PHY_EDGE_ROW_9_Left_19 ();
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 input1 (.I(b_in[0]),
    .Z(net1));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 input2 (.I(b_in[1]),
    .Z(net2));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_1 input3 (.I(b_in[2]),
    .Z(net3));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output4 (.I(net4),
    .Z(t_out[0]));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output5 (.I(net5),
    .Z(t_out[1]));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output6 (.I(net6),
    .Z(t_out[2]));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output7 (.I(net7),
    .Z(t_out[3]));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output8 (.I(net8),
    .Z(t_out[4]));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output9 (.I(net9),
    .Z(t_out[5]));
 gf180mcu_fd_sc_mcu7t5v0__clkbuf_3 output10 (.I(net10),
    .Z(t_out[6]));
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_0_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_4 FILLER_0_0_10 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_0_14 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_1_8 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_2_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_3_8 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_3_10 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_1 FILLER_0_3_23 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_5_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_7_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fillcap_8 FILLER_0_8_2 ();
 gf180mcu_fd_sc_mcu7t5v0__fill_2 FILLER_0_9_8 ();
endmodule
