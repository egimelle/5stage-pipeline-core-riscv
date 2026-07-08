module instruction_memory (
    input [31:0] addr,
    
    output wire [31:0] instruction
);

    reg [31:0] mem [0:63];

    initial begin
        mem[0] = 32'h00000013; // nop (addi x0, x0, 0) — заглушка
        mem[1] = 32'h00100093; // addi x1, x0, 1
        mem[2] = 32'h00200113; // addi x2, x0, 2
        mem[3] = 32'h00300193; // addi x3, x0, 3
    end

    // addr приходит в байтах (0, 4, 8, 12...), но память индексируется словами
    // поэтому делим на 4, то есть сдвигаем на 2 бита вправо
    assign instruction = mem[addr[31:2]];

endmodule
