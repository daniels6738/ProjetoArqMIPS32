module Top_Level(
	 //RegistradorPC
	 //input wire [31:0] A, // Entrada para o novo valor do PC
    input wire Clk,     // Sinal de clock
    input wire Rst,     // Sinal de reset
    output wire [31:0] Y, // Saída do valor atual do PC
	 //PC_Soma4
	 //input wire [31:0] Soma4_A, // Entrada para o novo valor do PC
    output wire [31:0] Soma4_Y, // Saída do valor atual do PC
	 //PC_SomaDesvio
	 //input [31:0] pcAtual,     // Valor atual do contador de programa
	 //input [31:0] valorDesvio, // Valor de desvio
    //output reg [31:0] novoPC  // Novo valor do contador de programa
	 //i_mem
	 output wire [31:0] i_out,
	 //control
	 //input wire [5:0] i_opcode,
	 output wire o_memto_reg,
	 output wire o_mem_write,
	 output wire o_branch_beq,
	 output wire o_branch_bne,
	 output wire o_jump,
	 output wire o_alu_src,
	 output wire o_reg_dst,
	 output wire o_reg_write,
	 //Mux2x1_5bits
	 //input [4:0] Mux_5bits_A,
	 //input [4:0] Mux_5bits_B,
	 //input Mux_5bits_S, 
	 output [4:0] Mux_5bits_Y,
	 //regfile
	 //input wire [4:0] ReadAddr1,
	 //input wire [4:0] ReadAddr2,
	 output wire [31:0] ReadData1,
	 output wire [31:0] ReadData2,
	 //input wire clk, ja tem clk
	 //input wire [4:0] WriteAddr,
	 input wire [31:0] WriteData,
	 //input wire RegWrite,
	 input wire Reset
);

	PC_Soma4 u_PC_Soma4 (
    .A(Y),
    .Y(Soma4_Y)
   );
  
	RegistradorPC u_RegistradorPC (
    .A(Soma4_Y),
    .Clk(Clk),
    .Rst(Rst),
	 .Y(Y)
   );
   
	i_mem u_i_mem (
	.address(Y),
	.i_out(i_out)
	);
	
	control u_control(
	.i_opcode(i_out[31:26]),
	.o_memto_reg(o_memto_reg),
	.o_mem_write(o_mem_write),
	.o_branch_beq(o_branch_beq),
	.o_branch_bne(o_branch_bne),
	.o_jump(o_jump),
	.o_alu_src(o_alu_src),
	.o_reg_dst(o_reg_dst),
	.o_reg_write(o_reg_write)
	);
	
	Mux2x1_5bits u_Mux2x1_5bits(
	.A(i_out[20:16]),
	.B(i_out[15:11]),
	.S(o_reg_dst),
	.Y(Mux_5bits_Y),
	);
	
	
	regfile u_regfile(
	.ReadAddr1(i_out[25:21]),
	.ReadAddr2(i_out[20:16]),
	.ReadData1(ReadData1),
	.ReadData2(ReadData2),
	.clk(Clk),
	.WriteAddr(Mux_5bits_Y),
	.WriteData(WriteData), //A ligar depois
	.RegWrite(o_reg_write),
	.Reset(Reset)
	);

endmodule 