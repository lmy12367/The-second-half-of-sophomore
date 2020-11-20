module pc_8b(
  input wire clk, rst, run, wr_en,
  input wire [7:0] in,
  output wire [7:0] out
);
  reg [7:0] pc;
  initial begin
    pc = 8'b00000000;
  end
  assign out = pc;
  
  always@ (negedge clk) begin
    case (rst)
      1'b0:
      begin
        case (wr_en)
          1'b0: pc = pc + run;
          1'b1: pc = in;
        endcase
      end
      0'b1: pc = 0;
      default: pc = 0;
    endcase
  end
endmodule

