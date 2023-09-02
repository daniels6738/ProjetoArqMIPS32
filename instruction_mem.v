module instruction_mem #(
parameter mem_size = 32

)
(
  input wire [31:0] address,
  output reg [31:0] data_out
);

  reg [31:0] memory [0:mem_size - 1];
// deve-ser feito um jeito de ler um arquivo instructions.list para preencher o array memory
  initial begin
    memory[0] <= 32'b00100000001000000000000000000000;
    // Mais instrucoes aqui
  end

  always @(*) begin
    data_out = memory[address];
  end

endmodule