module ULA (
  input [3:0] codigo_controle, // Entrada de código de controle
  input [31:0] operando_A,     // Entrada do operando A
  input [31:0] operando_B,     // Entrada do operando B
  output reg [31:0] resultado, // Saída do resultado
  output reg zero_flag      // Saída do flag de zero
  
);
	
	 
  always @(*) begin
	
	zero_flag = 0;
    case (codigo_controle)
	
      4'b0000:begin
		 resultado = operando_A + operando_B;   // add
	      	end

      4'b0001:begin
		 resultado = operando_A - operando_B;   // sub
		end

      4'b0010:begin
		 resultado = operando_A & operando_B;   // and
		end
		
      4'b0011:begin 
		 resultado = operando_A | operando_B;   // or
		end

      4'b0100:begin
		resultado = (operando_A[31] == 1 && operando_B[31] == 0) ? 1 :		//slt
           	(operando_A[31] == 0 && operando_B[31] == 1) ? 0 :
           	(operando_A < operando_B) ? 1 : 0;
		end

      4'b0101:begin 
		 resultado = operando_A ^ operando_B;   // xor
		end

      4'b0110:begin
		 resultado = ~(operando_A | operando_B); // nor
		end

      4'b0111:begin
		 resultado = operando_A << operando_B;  // sll
		end

      4'b1000:begin
		 resultado = operando_A >> operando_B;  // srl
		end

      4'b1001:begin
		 resultado = operando_A >> operando_B; // sra 
		
		end

      4'b1010:begin
		 resultado = (operando_A < operando_B) ? 1'b1 : 1'b0; // sltu
		end
      
      4'b1011:begin
		 zero_flag = 1'b1;               // jr
		end

      4'b1100:begin
		 resultado = 0;
		zero_flag = (operando_A == operando_B) ? 1'b1: 1'b0; //BEQ
		end

      4'b1101:begin
		 zero_flag = 1'b1;               // jal 
    		end

       4'b1110:begin
		 zero_flag = (operando_A != operando_B) ? 1'b1 : 1'b0;	//BNE
		end

      4'b1111:begin
		 resultado = {operando_A[15:0], 16'b0};// lui
		end

      default:begin
		 resultado = 32'bz;  //operacao indefinida
		end
    endcase

    
    
  end

endmodule