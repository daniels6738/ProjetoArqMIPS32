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
				4'b0000: result = In1 & In2; // OP == 0000 -> AND
				4'b0001: result = In1 | In2; // OP == 0001 -> OR
				4'b0010: result = In1 + In2; // OP == 0010 -> +
				4'b0110: result = In1 - In2; // OP == 0110 -> -
				4'b0111: result = (In1 < In2)? 32'b1:32'b0;  // OP == 0111 -> SLT
				4'b1100: result = ~(In1 & In2); // OP == 1100 -> NOR
            
            default: result = 32'b0; // Default case
        endcase
		  if(result == 32'b0) begin
				
			end
    end

endmodule