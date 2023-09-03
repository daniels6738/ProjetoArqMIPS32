module PC_Soma4(
    input wire [31:0] A, // Entrada para o novo valor do PC
    output reg [31:0] Y // Saída do valor atual do PC
);
always @(*)begin
	Y = A+4;
	end
endmodule