module Code_Register #(parameter N_bits=4)(
        input  comparator_out , rst, 
        input [N_bits : 0] shift_register_out,
        output wire [N_bits -1 : 0] data_register_out
    );

    wire [N_bits:0] data_register ; 

    for ( genvar i = 0 ;  i<= N_bits  ; i = i + 1) begin 
        if (i <= N_bits-1 )begin
            ff_code_R ff_code_R_cr (
                .S(shift_register_out[i]),
                .rst(rst),
                .D(comparator_out),
                .clk(data_register[i+1]),
                .q(data_register[i])
            );
         end else begin 
            ff_code_s ff_code_R_s (
                .S(shift_register_out[i]),
                .rst(rst),
                .q(data_register[i])
            );
          end
    end


    assign data_register_out = data_register[N_bits-1:0] ;
    
endmodule
