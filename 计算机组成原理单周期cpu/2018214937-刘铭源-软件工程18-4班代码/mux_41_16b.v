module mux_41_16b(
  input wire [15:0] in1, in2, in3, in4,
  output reg [15:0] out,
  input wire [1:0] select
);
  always@* begin
    case (select)
      2'b00: out = in1;
      2'b01: out = in2;
      2'b10: out = in3;
      2'b11: out = in4;
      default: out = 4'bx;
    endcase
  end
endmodule

