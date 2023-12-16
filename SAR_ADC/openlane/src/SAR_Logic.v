module SAR_Logic(
input wire comparator_out,
input wire clk_sar,
input wire reset,
output wire EOC,
output wire [11:0] data_register_out
);

localparam N_bits = 12;

wire [N_bits:0] shift_register_out;

Sequencer_Register  #(N_bits) seq_sim (
    .clk_sar(clk_sar),
    .rst(reset),
    .EOC(EOC),
    .shift_register_out(shift_register_out) 
);

Code_Register #(N_bits) Code_sim (
        .comparator_out(comparator_out),
        .rst(reset), 
        .shift_register_out(shift_register_out),
        .data_register_out(data_register_out)
    );

endmodule
