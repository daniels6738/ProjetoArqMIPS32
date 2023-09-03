module ULA (
    input wire [31:0] In1,
    input wire [31:0] In2,
    input wire [3:0] OP,
    output reg [31:0] result,
	 output wire zeroFlag
);

	 assign zeroFlag = (result == 0)? 32'b1:32'b0;
    always @(*) begin
        case (OP)
				4'b0000: result = In1 + In2; // OP == 0000 -> add
				
				4'b0001: result = In1 - In2; // OP == 0001 -> sub
				
				4'b0010: result = In1 + In2; // OP == 0010 -> mult
				
				4'b0011: result = In1 / In2; // OP == 0011 -> div
				
				4'b0100: result = In1<<1; // OP == 0100 -> SLL
				
				4'b0101: result = In1>>1; // OP == 0101 -> SRL
				
				4'b0110: result = In1 & In2; // OP == 0110 -> AND
				
				4'b0111: result = In1 | In2; // OP == 0111 -> OR
				
				4'b1000: result = In1 ^ In2; // OP == 1000 -> XOR
				
				4'b1001: result = ~(In1 & In2); // OP == 1001 -> NAND
				
				4'b1010: result = ~(In1 | In2); // OP == 1010 -> NOR
				
				4'b1011: result = (In1 > In2 | In1 == In2)? 32'b0:32'b1; // OP == 1011 -> SLT
				
				4'b1100: result = (In1 < In2 | In1 == In2)? 32'b0:32'b1;  // OP == 1100 -> SGT
				
				4'b1101: result = (In1 == In2)? 32'b1:32'b0; // OP == 1101 -> comparacao de igualdade (beq)
            
            default: result = 32'b0; // Default case
        endcase
    end

endmodule