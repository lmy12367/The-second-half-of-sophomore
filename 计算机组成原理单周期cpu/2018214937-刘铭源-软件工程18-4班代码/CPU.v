module CPU(
  input wire clk,
  input wire rst
);
  // PC
  wire [7:0] pc_out;
  wire pc_wr_en;
  wire pc_run;
  wire pc_rst;
  
  // IR
  wire [15:0] IR;
  
  // MM
  wire [15:0] mm_out;
  wire mm_wr_en;
  
  // ALU
  wire [15:0] alu_out;
  wire [2:0] alu_op;
  wire alu_carry_in;  // Not used, should be initialized in CPU start
  wire alu_carry_out;  // Not uesd, should be initialized in CPU start
  
  
  // ACC
  wire [15:0] acc_out;
  wire acc_wr_en;
  wire acc_rst;
  
  // MUX_4_1
  wire [1:0] mux1_select;
  wire [1:0] mux2_select;
  wire [1:0] mux3_select;
  wire [1:0] mux4_select;
  wire [15:0] mux1_out;
  wire [15:0] mux2_out;
  wire [15:0] mux3_out;
  wire [15:0] mux4_out;
  
  /**
  module CU(
  input wire [5:0] IR,
  output reg acc_wr_en,
  output reg acc_rst,
  output reg pc_rst,
  output reg pc_run,
  output reg pc_wr_en,
  output reg [2:0] alu_op,
  output reg mm_wr_en,
  output reg [1:0] mux1_select,
  output reg [1:0] mux2_select,
  output reg [1:0] mux3_select,
  output reg [1:0] mux4_select
  );
  */
  CU cu_obj(
    .IR(IR[15:10]),
    .acc_wr_en(acc_wr_en),
    .acc_rst(acc_rst),
    .pc_rst(pc_rst),
    .pc_run(pc_run),
    .pc_wr_en(pc_wr_en),
    .alu_op(alu_op),
    .mm_wr_en(mm_wr_en),
    .alu_carry_in(alu_carry_in),
    .alu_carry_out(alu_carry_in),
    .mux1_select(mux1_select),
    .mux2_select(mux2_select),
    .mux3_select(mux3_select),
    .mux4_select(mux4_select)
  );
  
  /**
  module pc_8b(
  input wire clk, rst, run, wr_en,
  input wire [7:0] in,
  output wire [7:0] out
  );
  */
  // Notice: pc_rst pc_run pc_wr_en should be initialized
  pc_8b pc_obj(
    .clk(clk), .rst(pc_rst), .run(pc_run), .wr_en(pc_wr_en),
    .in(mux4_out[7:0]),
    .out(pc_out)
  );
  
  /**
  module IRStorage_16b(
  input wire [7:0] addr,
  output wire [15:0] out
  );
  */
  IRStorage_16b IRStorage_obj(
    .addr(pc_out),
    .out(IR)
  );
  
  /**
  module alu_16b(
  input wire [15:0] in1, in2,
  input wire carry_in,
  input wire [2:0] op,
  output reg [15:0] out,
  output reg carry_out
  );
  */
  alu_16b alu_obj(
    .in1(mux2_out), .in2(mux3_out),
    .carry_in(alu_carry_in),
    .op(alu_op),
    .out(alu_out),
    .carry_out(alu_carry_out)
  );
  
  /**
  module acc_16b(
  input wire clk,
  input wire [15:0] in,
  input wire wr_en,
  input wire rst,
  output wire [15:0] out
  );
  */
  acc_16b acc_obj(
    .clk(clk),
    .in(mux1_out),
    .wr_en(acc_wr_en),
    .rst(acc_rst),
    .out(acc_out)
  );
  
  /**
  module memory_16b(
  input wire [9:0] addr,
  input wire wr_en, clk,
  input wire [15:0] in,
  output wire [15:0] out
  );
  */
  memory_16b mm_obj(
    .clk(clk),
    .wr_en(mm_wr_en),
    .addr(IR[9:0]),
    .in(acc_out),
    .out(mm_out)
  );
  
  /**
  module mux_41_16b(
  input wire [15:0] in1, in2, in3, in4,
  output reg [15:0] out,
  input wire [1:0] select
  );
  */
  mux_41_16b mux1(
    .select(mux1_select),
    .in1(mm_out),
    .in2(alu_out),
    .out(mux1_out)
  );
  mux_41_16b mux2(
    .select(mux2_select),
    .in1({8'b0, IR[7:0]}),
    .in2(acc_out),
    .out(mux2_out)
  );
  mux_41_16b mux3(
    .select(mux3_select),
    .in1(mm_out),
    .in2({8'b0, pc_out}),
    .out(mux3_out)
  );
  mux_41_16b mux4(
    .select(mux4_select),
    .in1({8'b0, IR[7:0]}),
    .in2(alu_out),
    .out(mux4_out)
  );

endmodule

