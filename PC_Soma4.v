module PC_Soma4(
    input wire [31:0] A, // Entrada para o novo valor do PC
    output wire [31:0] Y // Saída do valor atual do PC
);

	assign Y = A+1;

endmodule
