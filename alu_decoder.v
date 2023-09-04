module alu_decoder(i_opcode, i_funct, o_alu_control);

input [5:0] i_opcode;		
input [5:0] i_funct;		

output reg [3:0] o_alu_control;	

always @(*) begin 
	// inicializacao:
	o_alu_control = 4'bxxxx;	
	
	
	casez(i_opcode)
		6'b000000:	//tipo R
			begin
				casez(i_funct)
					6'b100000:	
						begin	
							o_alu_control = 4'b0000; // ADD
							
						end 
					6'b100010:	
						begin	
							o_alu_control = 4'b0001; // SUB
							
						end
					6'b100100:	
						begin
							o_alu_control = 4'b0010; // AND
					
						end
					6'b100101:	
						begin	
							o_alu_control = 4'b0011; // OR 
							
						end
					6'b101010:	
						begin	
							o_alu_control = 4'b0100; // SLT
							
						end
					6'b100110:	
						begin	
							o_alu_control = 4'b0101; // XOR 
						
						end
					6'b100111:	
						begin	
							o_alu_control = 4'b0110; // NOR 
							
						end
					6'b000000:						
						begin
							o_alu_control = 4'b0111; // SLL, Shift Left Logical
							
						end
					6'b000010:
						begin
							o_alu_control = 4'b1000; // SRL, Shift Right Logical
						
						end
					6'b000011:	
						begin
							o_alu_control = 4'b1001; // SRA, Shift Right Arithmetic
						
						end
					6'b000100:	
						begin
							o_alu_control = 4'b0111; // SLLV, 
						
						end
					6'b000110:	
						begin
							o_alu_control = 4'b1000; // SRLV,
					
						end
					
					6'b000111:	
						begin
							o_alu_control = 4'b1001; // SRAV
						
						end
					6'b101011:	
						begin
							o_alu_control = 4'b1010; // SLTU
						
						end
					6'b001000:	
						begin
							o_alu_control = 4'b1011; // JR
					
						end			
					default: 	
						begin
							o_alu_control = 4'bzzzz; //nenhuma operacao encontrada
							
						end
				endcase	
			end


		//tipo I
		6'b100011:	// LW
			begin
				o_alu_control = 4'b0000;	// ADD 
				
			end
		6'b101011:	// SW
			begin
				o_alu_control = 4'b0000;	// ADD 
			
			end
		6'b000100:	// BEQ
			begin
				o_alu_control = 4'b1100;	
				
			end
		6'b000101:	// BNE
			begin
				o_alu_control = 4'b1110;	
			
			end
		6'b001000:	// ADDI
			begin
				o_alu_control = 4'b0000;	// ADD 
			
			end
		6'b001010:	// SLTI
			begin
				o_alu_control = 4'b0100;	// SLT
			
			end
		6'b001100:	// ANDI
			begin
				o_alu_control = 4'b0010;	// AND
				
			end
		6'b001101:	// ORI
			begin
				o_alu_control = 4'b0011;	// OR 
		
			end
		6'b001110:	// XORI
			begin
				o_alu_control = 4'b0101;	// XOR
		
			end
		6'b001011:	// SLTIU   			
			begin
				o_alu_control = 4'b1010;	//SLTU
			
			end
		6'b001111:	// LUI   			
			begin
				o_alu_control = 4'b1111;	
			
			end


		//tipo J
		6'b000010:	// J   				//JR
			begin
				o_alu_control = 4'b1011;	
				
			end
		6'b000011:	// JAL   			
			begin
				o_alu_control = 4'b1101;	
			
			end
		default:	// default state
			begin
				o_alu_control = 4'bzzzz;	
				
			end
	endcase
end
endmodule
