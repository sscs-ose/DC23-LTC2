module Sequencer_Register #(parameter N_bits=4)(
        input  clk_sar , rst,
        output wire  EOC,
        output wire [N_bits : 0]shift_register_out

    );

    // el numero de register que hay para activar los bits de salida correspondiente  son N_bits + 2 para este sistema funcione bien 

    reg  [N_bits + 1 :0] shift_register;

    always @(posedge clk_sar) begin
        if (rst) begin
            shift_register[N_bits + 1 : 1 ] <= 'd0;
            shift_register[0] <= 'd1;
        end else begin
            shift_register <= { shift_register[N_bits : 0] , shift_register[N_bits + 1] };
        end
  end


  assign EOC = shift_register[N_bits + 1] ; 
  assign shift_register_out = shift_register[N_bits + 1 : 1] ; 

endmodule
