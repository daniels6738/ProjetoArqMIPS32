module i_mem (
  input wire [31:0] address,
  output wire [31:0] i_out
);
  parameter MEM_WIDTH = 32;
  parameter MEM_DEPTH = 32;
  parameter MEM_FILE = "instruction.list";

  reg [MEM_WIDTH-1:0] mem [0:MEM_DEPTH-1];

  initial begin
    
    $readmemb(MEM_FILE, mem);

  end

  assign i_out = mem[address];

endmodule
