module instruction_memory (
    input [31:0] addr,
    
    output wire [31:0] instruction
);

    reg [31:0] mem [0:63];

     initial begin
    mem[0] = 32'h00500093; // addi x1, x0, 5
    mem[1] = 32'h00A00113; // addi x2, x0, 10
    mem[2] = 32'h002081B3; // add  x3, x1, x2
    mem[3] = 32'h00302023; // sw   x3, 0(x0)
    mem[4] = 32'h00002203; // lw   x4, 0(x0)
    mem[5] = 32'h00418463; // beq  x3, x4, +8
    mem[6] = 32'h3E700293; // addi x5, x0, 999 (должна пропуститься)
    mem[7] = 32'h00100313; // addi x6, x0, 1   (сюда прыгаем)
    end

    // addr приходит в байтах (0, 4, 8, 12...), но память индексируется словами
    // поэтому делим на 4, то есть сдвигаем на 2 бита вправо
    assign instruction = mem[addr[31:2]];

endmodule
