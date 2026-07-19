module alu_control(
    input [1:0] alu_op,
    input [2:0] funct3,
    input funct7,
    output reg [3:0] alu_control
);
    always @(*) begin
        case(alu_op)
            2'b00: alu_control = 4'b0000;
            2'b01: alu_control = 4'b0001;
            2'b10: begin
                case(funct3)
                3'b000: alu_control = funct7 ? 4'b0001 : 4'b0000; //SUB:ADD
                3'b111: alu_control = 4'b0010; //AND
                3'b110: alu_control = 4'b0011; //OR
                3'b100: alu_control = 4'b0100; //XOR
                3'b010: alu_control = 4'b0101; //SLT
                default: alu_control = 4'b0000; 
                endcase
            end
            default: alu_control = 4'b0000;
        endcase
    end
endmodule