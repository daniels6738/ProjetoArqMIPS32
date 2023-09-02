module regfile(
input wire [4:0] ReadAddr1,
input wire [4:0] ReadAddr2,
output reg [31:0] ReadData1,
output reg [31:0] ReadData2,
input wire clk,
input wire [4:0] WriteAddr,
input wire [31:0] WriteData,
input wire RegWrite,
input wire Reset
);

reg [31:0] regMem [0:31];

initial begin
regMem[0] = 32'b00000000000000000000000000000000;
end

integer i;

always @(posedge clk or posedge Reset)
	begin
	if(Reset == 1)
		begin
			for(i = 0; i < 32; i = i + 1) begin
			regMem[i] = 0;
			end
		end
		
	else if(RegWrite == 1 && WriteAddr != 0) begin
		regMem[WriteAddr] = WriteData;
		
		end
	end

always @(ReadAddr1 or ReadAddr2) begin

	ReadData1 = regMem[ReadAddr1];
	ReadData2 = regMem[ReadAddr2];
		
	end
endmodule