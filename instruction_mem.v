module instruction_mem
(
  input wire [31:0] address,
  output reg [31:0] data_out
);

  parameter mem_size = 32;
  reg [31:0] mem [0:mem_size-1];

  initial begin
    $readmemh ("instruction.list", mem);
  end

  assign data_out = mem[address];

endmodule
