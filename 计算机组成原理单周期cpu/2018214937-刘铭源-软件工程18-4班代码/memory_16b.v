module memory_16b(
  input wire [9:0] addr,
  input wire wr_en, clk,
  input wire [15:0] in,
  output wire [15:0] out
);
  reg [15:0] data [1023:0];
  
  initial begin
    data[10'b0000000000] = 16'h0004;
    data[10'b0000000001] = 16'h0015;
    data[10'b0000000010] = 16'h0016;
  end
  
  assign out = data[addr];
  always @ (negedge clk) begin
    if(wr_en)
      data[addr] = in;
  end
endmodule

