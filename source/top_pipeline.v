module top_pipeline(
    input clk,
    input rst
);

//IF
wire [31:0] if_pc_out, if_instruction, if_pc_plus4;
if_stage if_stage_inst(
    .clk(clk),
    .rst(rst),
    .pc_next(if_pc_plus4),
    .pc_out(if_pc_out),
    .instruction(if_instruction),
    .pc_plus4(if_pc_plus4)
);

//IF/ID
wire [31:0] id_pc, id_instruction;
if_id if_id_inst(
    
)

//ID
wire reg_write, alu_src, mem_write, mem_to_reg, branch, mem_read;
wire [1:0] alu_op;
wire [31:0] read_data1, read_data2, imm_out;
wire [4:0] rs1, rs2, rd;
wire [2:0] funct3;
wire funct7;
wire is_rtype;


endmodule