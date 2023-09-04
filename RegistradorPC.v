module RegistradorPC(
    input wire [31:0] A, // Entrada para o novo valor do PC
    input wire Clk,     // Sinal de clock
    output wire [31:0] Y // Saída do valor atual do PC
);

    reg [31:0] pc_reg; // Registrador para armazenar o valor do PC

    always @(posedge Clk) begin
        pc_reg <= A; // Atualiza o valor do PC com a entrada A na borda de subida do clock
    end

    assign Y = pc_reg; // Saída Y é o valor do registrador pc_reg

endmodule