module if_id (
    input clk,
    input rst,
    input [31:0] pc_plus4_in,
    input [31:0] instruction_in,

    output reg [31:0] pc_plus4_out,
    output reg [31:0] instruction_out
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pc_plus4_out <= 32'b0;
            instruction_out <= 32'b0;
        end
        else begin
            pc_plus4_out <= pc_plus4_in;
            instruction_out <= instruction_in;
        end
    end
endmodule