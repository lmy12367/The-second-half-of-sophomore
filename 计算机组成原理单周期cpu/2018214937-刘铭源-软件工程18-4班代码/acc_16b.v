module acc_16b(
  input wire clk,
  input wire [15:0] in,
  input wire wr_en,
  input wire rst,
  output wire [15:0] out
);
  reg [15:0] data;
  initial begin
    data = 0;
  end
  assign out = data;
  
  always @(negedge clk) begin
    case (rst)
      1'b1: data = 0;
      1'b0:
      begin
        case (wr_en)
          1'b1: data = in;
        endcase
      end
    endcase
  end
endmodule