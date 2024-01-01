module ff_code_R (
    input S , rst, D, clk,
    output reg q
);

always @(posedge rst or posedge S or posedge clk) begin
  if (rst) begin
     q <= 0;
  end else if (S) begin 
    q <= 1;
  end 
  else q <= D;   
end

endmodule

module ff_code_s (
    input S , rst ,
    output reg q
);

always @(posedge rst or posedge S) begin
  if (rst) q <= 0;
  else q <= 1;
 
end

endmodule
