module dac_matrix_decoder(
    input [2:0] b_in,
    output reg [6:0] t_out
);

    always @(*) begin
        case (b_in)
            3'b000: t_out = 7'b0000000; 
            3'b001: t_out = 7'b0000001; 
            3'b010: t_out = 7'b0000011; 
            3'b011: t_out = 7'b0000111; 
            3'b100: t_out = 7'b0001111; 
            3'b101: t_out = 7'b0011111;
            3'b110: t_out = 7'b0111111;
            3'b111: t_out = 7'b1111111;
        endcase
    end

endmodule
