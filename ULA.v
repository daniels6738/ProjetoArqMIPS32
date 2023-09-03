module ULA (
  input [3:0] codigo_controle, // Entrada de código de controle
  input [31:0] operando_A,     // Entrada do operando A
  input [31:0] operando_B,     // Entrada do operando B
  output reg [31:0] resultado, // Saída do resultado
  output reg zero_flag      // Saída do flag de zero
  
);

  always @(*) begin
    case (codigo_controle)
      4'b0000: resultado = operando_A + operando_B;   // add

      4'b0001: resultado = operando_A - operando_B;   // sub

      4'b0010: resultado = operando_A & operando_B;   // and

      4'b0011: resultado = operando_A | operando_B;   // or

      4'b0100: resultado = (operando_A < operando_B) ? 32'b1 : 32'b0; // slt

      4'b0101: resultado = operando_A ^ operando_B;   // xor

      4'b0110: resultado = ~(operando_A | operando_B); // nor

      4'b0111: resultado = operando_A << operando_B;  // sll

      4'b1000: resultado = operando_A >> operando_B;  // srl

      4'b1001: resultado = operando_A >>> operando_B; // sra 

      4'b1010: resultado = ($unsigned(operando_A) < $unsigned(operando_B)) ? 32'b1 : 32'b0; // sltu

      4'b1100: zero_flag = (operando_A == operando_B) ? 1'b1 : 1'b0; //BEQ

      4'b1110: zero_flag = (operando_A != operando_B) ? 1'b1 : 1'b0;	//BNE
      
      4'b1011: resultado = operando_A;               // jr

      4'b1101: resultado = operando_A;               // jal 

      4'b1111: resultado = {16'b0, operando_A[15:0]}; // lui

      default: resultado = 32'b0;                    // Operação indefinida (xxxx)
    endcase

    zero_flag = (resultado == 32'b0) ? 1'b1 : 1'b0;  // Define o flag de zero
    
  end

endmodule