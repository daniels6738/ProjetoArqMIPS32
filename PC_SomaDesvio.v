module PC_SomaDesvio (
  input [31:0] pcAtual,     // Valor atual do contador de programa
  input [31:0] valorDesvio, // Valor de desvio
  output wire [31:0] novoPC  // Novo valor do contador de programa
);


   assign novoPC = pcAtual + valorDesvio;


endmodule