typedef enum logic[1:0] { BUSY = 2'd0, EOC = 2'd1, SAMPLING = 2'd2 } state;

module sar #(
    parameter int N_BITS = 12
)(
    input logic clk,
    input logic rst,
    input logic comp,
    output logic[N_BITS-1:0] dtop,
    output logic[N_BITS-1:0] dbot,
    output state current_state
);

localparam COUNT_WIDTH = $clog2(N_BITS);

state next_state;

logic[COUNT_WIDTH-1:0] current_bit;

always_ff @(posedge clk) begin
    if (rst)
        current_state <= SAMPLING;
    else
        current_state <= next_state;
        
    if (current_state == SAMPLING)
        current_bit <= 4'd12;  
    else
        current_bit <= current_bit - 'd1;
        
end

always_comb begin
    case (current_state)
        BUSY: begin
            if (current_bit == 4'd0) next_state = EOC;
            else next_state = BUSY;
        end
        EOC: begin
            next_state = SAMPLING;
        end
        SAMPLING: begin
            next_state = BUSY;
        end
        default: begin
            next_state = BUSY;
        end 
    endcase
end

always_ff @(posedge clk) begin
    case (current_state)
        EOC: begin
            dtop <= {N_BITS{1'b1}};
            dbot <= {N_BITS{1'b1}};
        end
        BUSY: begin
            if (current_bit < 'd12) begin
                dtop[current_bit] <= !comp;
                dbot[current_bit] <= comp;  
            end
        end
    endcase
end

endmodule
