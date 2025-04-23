module detector_borda (
    input clk,
    input rst,
    input [1:0] entrada,
    output reg[1:0] detector
);

reg [1:0] entrada_anterior;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        entrada_anterior <= 2'b00;
        detector <= 2'b00;
    end else begin
        if (entrada == 2'b11 && entrada_anterior == 2'b00) begin
            detector <= 2'b11; // Detecta borda de subida em ambos os bits
        end else if (entrada[0] == 1'b1 && entrada_anterior[0] == 1'b0 && entrada[1] == entrada_anterior[1]) begin
            detector <= {1'b1, 1'b0}; // Detecta borda de subida no bit 0
        end else if (entrada[1] == 1'b1 && entrada_anterior[1] == 1'b0 && entrada[0] == entrada_anterior[0]) begin
            detector <= {1'b0, 1'b1}; // Detecta borda de subida no bit 1
        end else begin
            detector <= 2'b00;
        end
        entrada_anterior <= entrada;
    end
end
endmodule