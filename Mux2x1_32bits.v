module Mux2x1_32bits(input [31:0] A, input [31:0] B, input S, output [31:0] Y);
   assign Y = (S==0) ? A:B;
endmodule