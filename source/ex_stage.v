module ex_stage(
    input [31:0] pc,
    input [31:0] read_data1,
    input [31:0] read_data2,
    input [31:0] imm_out,
    input [1:0] alu_op,
    input alu_src,
    input [2:0] funct3,
    input funct7,
    input is_rtype,

    output [31:0] alu_result,
    output zero,
    output [31:0] branch_target
);

    //alu input mux
    wire [31:0] alu_b;
    assign alu_b = alu_src ? imm_out : read_data2;

    //alu_control
    wire [3:0] alu_control_signal;
    alu_control alu_control_inst(
        .alu_op(alu_op),
        .funct3(funct3),
        .funct7(funct7),
        .is_rtype(is_rtype),
        .alu_control(alu_control_signal)
    );

    //alu 
    alu alu_inst(
        .a(read_data1),
        .b(alu_b),
        .alu_control(alu_control_signal),
        .result(alu_result),
        .zero(zero)
    );

    assign branch_target = pc + imm_out;
endmodule