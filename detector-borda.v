module detector_borda (
    input clk,
    input rst,
    input [1:0] entrada,
    output reg[1:0] detector
);

always @(posedge clk or posedge rst) begin
    if(rst) 
    begin
        detector = 2'b00;
    end 
    else 
    begin
    if(entrada == 2'b00)
        detector = 2'b00;
    else if(entrada == 2'b01)
        detector = 2'b01;
    else if(entrada == 2'b10)
        detector = 2'b10;
    else if(entrada == 2'b11)
        detector = 2'b11;
    end
end

endmodule