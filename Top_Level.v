module Top_Level(
	 //RegistradorPC
	 //input wire [31:0] A, // Entrada para o novo valor do PC
    input wire Clk,     // Sinal de clock
    input wire Rst,     // Sinal de reset
    output wire [31:0] Y, // Saída do valor atual do PC
	 //PC_Soma4
	 //input wire [31:0] Soma4_A, // Entrada para o novo valor do PC
    //output wire [31:0] Soma4_Y, // Saída do valor atual do PC
	 //PC_SomaDesvio
	 //input [31:0] pcAtual,     // Valor atual do contador de programa
	 //input [31:0] valorDesvio, // Valor de desvio
    //output reg [31:0] novoPC  // Novo valor do contador de programa
	 //i_mem
	 //output wire [31:0] i_out,
	 //control
	 //input wire [5:0] i_opcode,
	 //output wire o_memto_reg,
	 //output wire o_mem_write,
	 //output wire o_mem_read,
	 //output wire o_branch_beq,
	 //output wire o_branch_bne,
	 //output wire o_jump,
	 //output wire o_alu_src,
	 //output wire o_reg_dst,
	 //output wire o_reg_write,
	 //Mux2x1_5bits
	 //input [4:0] Mux_5bits_A,
	 //input [4:0] Mux_5bits_B,
	 //input Mux_5bits_S, 
	 //output wire [4:0] Mux_5bits_Y,
	 //regfile
	 //input wire [4:0] ReadAddr1,
	 //input wire [4:0] ReadAddr2,
	 //output wire [31:0] ReadData1,
	 //output wire [31:0] ReadData2,
	 //input wire clk, ja tem clk
	 //input wire [4:0] WriteAddr,
	 //input wire [31:0] WriteData,
	 //input wire RegWrite,
	 //alu_decoder
	 //input [5:0] i_opcode,
	 //input [5:0] i_funct,		
	 //output wire [3:0] o_alu_control,
	 //ExtensorSinal
	 //input [15:0] A_Ext,
	 //output wire [31:0]Y_Ext,
	 //ULA
	 //input [3:0] codigo_controle, // Entrada de código de controle
	 //input [31:0] operando_A,     // Entrada do operando A
    //input [31:0] operando_B,     // Entrada do operando B
    output wire [31:0] resultado, // Saída do resultado da ULA
    //output wire zero_flag,      // Saída do flag de zero
	 //output wire Mux_5bits_Y_ULA,
	 //data_mem
	 //input wire [31:0] address,
    //input wire [31:0] data_in,
	 //input wire write_enable,
    //input wire read_enable,
    output wire [31:0] data_out // Saída do resultado da memória de dados
	 //pc soma desvio
	 //output wire [31:0] pc_desvio,
	 //mux32bits para resultado do novo pc
	 //output wire [31:0] Mux2x1_32bits_Y_memOrUla
);

	wire [31:0] Soma4_Y;
	wire [31:0] i_out;
	wire o_memto_reg;
	wire o_mem_read;
	wire o_mem_write;
	wire o_branch_beq;
	wire o_branch_bne;
	wire o_jump;
	wire o_alu_src;
	wire o_reg_dst;
	wire o_reg_write;
	wire [4:0] Mux_5bits_Y;
	wire [31:0] ReadData1;
	wire [31:0] ReadData2;
	wire [3:0] o_alu_control;
	wire [31:0]Y_Ext;
	wire zero_flag;
	wire Mux_32bits_Y_ULA;
	//wire [31:0] data_out;
	wire [31:0] pc_desvio;
	wire [31:0] Mux2x1_32bits_Y_memOrUla;
	

	PC_Soma4(
    .A(Y),
    .Y(Soma4_Y)
   );
  
	RegistradorPC(
    .A(Mux2x1_32bits_Y),
    .Clk(Clk),
	 .Y(Y)
   );
   
	i_mem(
	.address(Y),
	.i_out(i_out)
	);
	
	control(
	.i_opcode(i_out[31:26]),
	.o_memto_reg(o_memto_reg),
	.o_mem_write(o_mem_write),
	.o_mem_read(o_mem_read),
	.o_branch_beq(o_branch_beq),
	.o_branch_bne(o_branch_bne),
	.o_jump(o_jump),
	.o_alu_src(o_alu_src),
	.o_reg_dst(o_reg_dst),
	.o_reg_write(o_reg_write)
	);
	
	Mux2x1_5bits Mux5Bits_para_regfile(
	.A(i_out[15:11]),
	.B(i_out[20:16]),
	.S(o_reg_dst),
	.Y(Mux_5bits_Y)
	);
	
	
	regfile(
	.ReadAddr1(i_out[25:21]),
	.ReadAddr2(i_out[20:16]),
	.ReadData1(ReadData1),
	.ReadData2(ReadData2),
	.clk(Clk),
	.WriteAddr(Mux_5bits_Y),
	.WriteData(Mux2x1_32bits_Y_memOrUla),
	.RegWrite(o_reg_write),
	.Reset(Rst)
	);
	
	alu_decoder(
	.i_opcode(i_out[31:26]),
	.i_funct(i_out[5:0]),
	.o_alu_control(o_alu_control)
	);
	
	ExtensorSinal(
	.A(i_out[15:0]),
	.Y(Y_Ext)
	);
	
	Mux2x1_32bits Mux32Bits_para_ULA(
	.A(Y_Ext),
	.B(ReadData2),
	.S(o_alu_src),
	.Y(Mux_32bits_Y_ULA)
	);
	
	ULA(
	.codigo_controle(o_alu_control),
	.operando_A(ReadData1),
	.operando_B(Mux_32bits_Y_ULA),
	.resultado(resultado),
	.zero_flag(zero_flag)
	);
	
	data_mem(
	.address(resultado),
	.data_in(ReadData2),
	.write_enable(o_mem_write),
	.read_enable(o_mem_read),
	.data_out(data_out)
	);
	
	PC_SomaDesvio(
	.pcAtual(Soma4_Y),
	.valorDesvio(Y_Ext),
	.novoPC(pc_desvio)
	);
	
	Mux2x1_32bits MuxPC(
	.A(pc_desvio),
	.B(Soma4_Y),
	.S((o_branch_beq | o_branch_bne) & zero_flag),
	.Y(Mux2x1_32bits_Y)
	);
	
	Mux2x1_32bits mem_or_ula(
	.A(resultado),
	.B(data_out),
	.S(o_memto_reg),
	.Y(Mux2x1_32bits_Y_memOrUla)
	);
	
	

endmodule 