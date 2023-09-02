module ExtensorSinal(input [15:0] A, output [31:0]Y);
   assign Y = (A[15]==1'b1) ? {16'hFFFF,A} : {16'h0000,A}; 
endmodule