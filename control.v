module control(i_opcode, o_memto_reg, o_mem_write, o_mem_read, o_branch_beq, o_branch_bne, o_jump, o_alu_src, o_reg_dst, o_reg_write); //, o_alu_op

input [5:0] i_opcode;
output reg o_memto_reg;
output reg o_mem_write;
output reg o_mem_read;
output reg o_branch_beq;
output reg o_branch_bne;
output reg o_jump;
output reg o_alu_src;
output reg o_reg_dst;
output reg o_reg_write;
//output wire [3:0] o_alu_op;

always @(i_opcode) begin
	
	o_reg_write = 1'bx;
	o_reg_dst = 1'bx;
	o_alu_src = 1'bx;
	o_branch_beq = 1'bx;
	o_branch_bne = 1'bx;
	o_mem_write = 1'bx;
	o_mem_read = 1'bx;
	o_memto_reg = 1'bx;
	o_jump = 1'bx;
	//o_alu_op = 4'bxxxx;

	casez(i_opcode)
		6'b000000:	//Instrucoes R: ADD, SUB, AND, OR, SLT, XOR, NOR, [Added]: SLL, SRL, SRA, ROR, ROL
			begin
				o_reg_write = 1'b1;	
				o_reg_dst = 1'b1;
				o_alu_src = 1'b0;
				o_branch_beq = 1'b0;
				o_branch_bne = 1'b0;
				o_mem_write = 1'b0;
				o_mem_read = 1'b0;
				o_memto_reg = 1'b0;
				o_jump = 1'b0;
				//o_alu_op = 4'b0000;	
			end
		6'b100011:				// LW
			begin
				o_reg_write = 1'b1;
				o_reg_dst = 1'b0;
				o_alu_src = 1'b1;
				o_branch_beq = 1'b0;
				o_branch_bne = 1'b0;
				o_mem_write = 1'b0;
				o_mem_read = 1'b1;
				o_memto_reg = 1'b1;
				o_jump = 1'b0;
				//o_alu_op = 4'b0011;
			end
		6'b101011:				// SW
			begin
				o_reg_write = 1'b0;
				o_reg_dst = 1'bx;
				o_alu_src = 1'b1;
				o_branch_beq = 1'b0;
				o_branch_bne = 1'b0;
				o_mem_write = 1'b1;
				o_mem_read = 1'b0;
				o_memto_reg = 1'bx;
				o_jump = 1'b0;
				//o_alu_op = 2'b00;
			end
		6'b000100:				// BEQ
			begin
				o_reg_write = 1'b0;
				o_reg_dst = 1'bx;
				o_alu_src = 1'b0;
				o_branch_beq = 1'b1;
				o_branch_bne = 1'b0;
				o_mem_write = 1'b0;
				o_mem_read = 1'b0;
				o_memto_reg = 1'bx;
				o_jump = 1'b0;
				//o_alu_op = 2'b01;
			end
		6'b000101:				// BNE
			begin
				o_reg_write = 1'b0;
				o_reg_dst = 1'bx;
				o_alu_src = 1'b0;
				o_branch_beq = 1'b0;
				o_branch_bne = 1'b1;
				o_mem_write = 1'b0;
				o_mem_read = 1'b0;
				o_memto_reg = 1'bx;
				o_jump = 1'b0;
				//o_alu_op = 2'b01;
			end
		6'b001000:				// ADDI
			begin
				o_reg_write = 1'b1;
				o_reg_dst = 1'b0;
				o_alu_src = 1'b1;
				o_branch_beq = 1'b0;
				o_branch_bne = 1'b0;
				o_mem_write = 1'b0;
				o_mem_read = 1'b0;
				o_memto_reg = 1'b0;
				o_jump = 1'b0;
				//o_alu_op = 2'b00;	
			end
		6'b001010:				// SLTI
			begin
				o_reg_write = 1'b1;	
				o_reg_dst = 1'b0;	
				o_alu_src = 1'b1;
				o_branch_beq = 1'b0;	
				o_branch_bne = 1'b0;
				o_mem_write = 1'b0;	
				o_mem_read = 1'b0;
				o_memto_reg = 1'b0;	
				o_jump = 1'b0;
			end
		6'b001100:				// ANDI
			begin
				o_reg_write = 1'b1;
				o_reg_dst = 1'b0;
				o_alu_src = 1'b1;
				o_branch_beq = 1'b0;
				o_branch_bne = 1'b0;
				o_mem_write = 1'b0;
				o_mem_read = 1'b0;
				o_memto_reg = 1'b0;
				o_jump = 1'b0;
			end
		6'b001101:				// ORI
			begin
				o_reg_write = 1'b1;
				o_reg_dst = 1'b0;
				o_alu_src = 1'b1;
				o_branch_beq = 1'b0;
				o_branch_bne = 1'b0;
				o_mem_write = 1'b0;
				o_mem_read = 1'b0;
				o_memto_reg = 1'b0;
				o_jump = 1'b0;
			end
		6'b001110:				// XORI
			begin
				o_reg_write = 1'b1;
				o_reg_dst = 1'b0;
				o_alu_src = 1'b1;
				o_branch_beq = 1'b0;
				o_branch_bne = 1'b0;
				o_mem_write = 1'b0;
				o_mem_read = 1'b0;
				o_memto_reg = 1'b0;
				o_jump = 1'b0;
			end
		6'b000010:				// J
			begin
				o_reg_write = 1'b0;
				o_reg_dst = 1'bx;
				o_alu_src = 1'bx;
				o_branch_beq = 1'bx;
				o_branch_bne = 1'bx;
				o_mem_write = 1'b0;
				o_mem_read = 1'b0;
				o_memto_reg = 1'bx;
				o_jump = 1'b1;
				//o_alu_op = 2'bxx;
			end
			
		6'b001011 :		//STLIU
			begin
				o_reg_write = 1'b1;	
				o_reg_dst = 1'b0;	
				o_alu_src = 1'b1;
				o_branch_beq = 1'b0;	
				o_branch_bne = 1'b0;
				o_mem_write = 1'b0;	
				o_mem_read = 1'b0;
				o_memto_reg = 1'b0;	
				o_jump = 1'b0;
			end
			
		6'b001111:   //LUI
			begin
				o_reg_write = 1'b1;	
				o_reg_dst = 1'b0;	
				o_alu_src = 1'b1;
				o_branch_beq = 1'b0;	
				o_branch_bne = 1'b0;
				o_mem_write = 1'b0;	
				o_mem_read = 1'b0;
				o_memto_reg = 1'b0;	
				o_jump = 1'b0;
			end
		
		6'b000011:   //JAL
			begin
				o_reg_write = 1'b1;
				o_reg_dst = 1'bx;
				o_alu_src = 1'bx;
				o_branch_beq = 1'bx;
				o_branch_bne = 1'bx;
				o_mem_write = 1'b0;
				o_mem_read = 1'b0;
				o_memto_reg = 1'bx;
				o_jump = 1'b1;
			end
			
		default:	
			begin
				o_reg_write = 1'bx;
				o_reg_dst = 1'bx;
				o_alu_src = 1'bx;
				o_branch_beq = 1'bx;
				o_branch_bne = 1'bx;
				o_mem_write = 1'bx;
				o_mem_read = 1'b0;
				o_memto_reg = 1'bx;
				o_jump = 1'bx;
				//o_alu_op = 2'bxx;	
			end
	endcase
end
endmodule
