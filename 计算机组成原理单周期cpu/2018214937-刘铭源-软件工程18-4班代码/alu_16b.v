module alu_16b(
  input wire [15:0] in1, in2,
  input wire carry_in,
  input wire [2:0] op,
  output reg [15:0] out,
  output reg carry_out
);
  always@* begin
    case (op)
      3'b000: {carry_out, out} = in1 + in2 + carry_in;
      3'b001: {carry_out, out} = in1 - in2 - carry_in;
      3'b010: {carry_out, out} = in1 & in2;
      3'b011: {carry_out, out} = in1 | in2;
      3'b100: 
      begin
        {carry_out, out} = in1 << 1;
        out[0] = carry_out;
      end
      3'b101: {carry_out, out} = in1 >> 1;
      3'b110: out = ~in1;
    endcase
  end
endmodule
