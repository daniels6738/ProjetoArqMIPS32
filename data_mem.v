module data_mem #(
parameter mem_size = 32

)
(
  input wire [31:0] address,
  input wire [31:0] data_in,
  input wire write_enable,
  input wire read_enable,
  output reg [31:0] data_out
);
  reg [31:0] memory [0:mem_size - 1];

  always @(*) begin
    if (write_enable) begin
      memory[address] <= data_in;
    end
    else if (read_enable) begin
      data_out <= memory[address];
    end
  end

endmodule