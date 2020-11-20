module CU(
  input wire [5:0] IR,
  output reg acc_wr_en,
  output reg acc_rst,
  // Notice: pc_rst pc_run pc_wr_en should be initialized
  output reg pc_rst,
  output reg pc_run,
  output reg pc_wr_en,
  output reg [2:0] alu_op,
  output reg mm_wr_en,
  output reg alu_carry_in,
  output reg alu_carry_out,
  output reg [1:0] mux1_select,
  output reg [1:0] mux2_select,
  output reg [1:0] mux3_select,
  output reg [1:0] mux4_select
);
  /**
  acc_wr_en
  acc_rst
  pc_rst
  pc_run
  pc_wr_en
  alu_op
  mm_wr_en
  mux1_select
  mux2_select
  mux3_select
  mux4_select
  */
  initial begin
    pc_rst = 0;
    pc_run = 1;
    pc_wr_en = 0;
    alu_carry_in = 0;
    alu_carry_out = 0;
  end
  always@(IR) begin
    case(IR)
      6'b000001:    // CLA
      begin
        acc_wr_en = 0;
        acc_rst = 1;
        pc_rst = 0;
        pc_run = 1;
        pc_wr_en = 0;
        alu_op = 0;
        mm_wr_en = 0;
        mux1_select = 2'b00;
        mux2_select = 2'b00;
        mux3_select = 2'b00;
        mux4_select = 2'b00;
      end
      6'b000010:    // COM
      begin
        acc_wr_en = 1;
        acc_rst = 0;
        pc_rst = 0;
        pc_run = 1;
        pc_wr_en = 0;
        alu_op = 3'b110;
        mm_wr_en = 0;
        mux1_select = 2'b01;
        mux2_select = 2'b01;
        mux3_select = 2'b00;
        mux4_select = 2'b00;
      end
      6'b000011:    // SHR
      begin
        acc_wr_en = 1;
        acc_rst = 0;
        pc_rst = 0;
        pc_run = 1;
        pc_wr_en = 0;
        alu_op = 3'b101;
        mm_wr_en = 0;
        mux1_select = 2'b01;
        mux2_select = 2'b01;
        mux3_select = 2'b00;
        mux4_select = 2'b00;
      end
      6'b000100:    // CSL
      begin
        acc_wr_en = 1;
        acc_rst = 0;
        pc_rst = 0;
        pc_run = 1;
        pc_wr_en = 0;
        alu_op = 3'b100;
        mm_wr_en = 0;
        mux1_select = 2'b01;
        mux2_select = 2'b01;
        mux3_select = 2'b00;
        mux4_select = 2'b00;
      end
      6'b000101:    // STP
      begin
        acc_wr_en = 0;
        acc_rst = 0;
        pc_rst = 1;
        pc_run = 0;
        pc_wr_en = 0;
        alu_op = 3'b000;
        mm_wr_en = 0;
        mux1_select = 2'b00;
        mux2_select = 2'b00;
        mux3_select = 2'b00;
        mux4_select = 2'b00;
      end
      6'b000110:    // ADD
      begin
        acc_wr_en = 1;
        acc_rst = 0;
        pc_rst = 0;
        pc_run = 1;
        pc_wr_en = 0;
        alu_op = 0;
        mm_wr_en = 0;
        mux1_select = 2'b01;
        mux2_select = 2'b01;
        mux3_select = 2'b00;
        mux4_select = 2'b00;
      end
      6'b000111:    // STA
      begin
        acc_wr_en = 0;
        acc_rst = 0;
        pc_rst = 0;
        pc_run = 1;
        pc_wr_en = 0;
        alu_op = 0;
        mm_wr_en = 1;
        mux1_select = 2'b00;
        mux2_select = 2'b00;
        mux3_select = 2'b00;
        mux4_select = 2'b00;
      end
      6'b001000:    // LDA
      begin
        acc_wr_en = 1;
        acc_rst = 0;
        pc_rst = 0;
        pc_run = 1;
        pc_wr_en = 0;
        alu_op = 0;
        mm_wr_en = 0;
        mux1_select = 2'b00;
        mux2_select = 2'b00;
        mux3_select = 2'b00;
        mux4_select = 2'b00;
      end
      6'b001001:    // JMP
      begin
        acc_wr_en = 0;
        acc_rst = 0;
        pc_rst = 0;
        pc_run = 1;
        pc_wr_en = 1;
        alu_op = 0;
        mm_wr_en = 0;
        mux1_select = 2'b00;
        mux2_select = 2'b00;
        mux3_select = 2'b00;
        mux4_select = 2'b00;
      end
      6'b001010:    // BAN
      begin
        acc_wr_en = 0;
        acc_rst = 0;
        pc_rst = 0;
        pc_run = 1;
        pc_wr_en = 1;
        alu_op = 0;
        mm_wr_en = 0;
        mux1_select = 2'b00;
        mux2_select = 2'b00;
        mux3_select = 2'b01;
        mux4_select = 2'b01;
      end
    endcase
  end
endmodule

