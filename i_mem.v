module i_mem (
  input wire [31:0] address,
  output wire [31:0] i_out
);
  parameter MEM_DEPTH = 32;  // Tamanho da memória (número de palavras)
  parameter MEM_FILE = "instruction.list";  // Nome do arquivo de instruções

  reg [31:0] mem [0:MEM_DEPTH-1];

  initial begin
    
    $readmemh(MEM_FILE, mem);

  end

  assign i_out = mem[address];

endmodule
