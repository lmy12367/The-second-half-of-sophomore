module IRStorage_16b(
  input wire [7:0] addr,
  output wire [15:0] out
);
  reg [15:0] data [1023:0];
  initial begin
    data[0] = 16'b0010000000000001;  // LDA 00000 00001
    data[1] = 16'b0010000000000010;  // LDA 00000 00010
    data[2] = 16'b0001110000000100;  // STA 00000 00100
    data[3] = 16'b0010000000000001;  // LDA 00000 00001
    data[4] = 16'b0010000000000100;  // LDA 00000 00100
    data[5] = 16'b0000010000000000;  // CLA
    data[6] = 16'b0010000000000100;  // LDA 00000 00100
    data[7] = 16'b0000100000000000;  // COM
    data[8] = 16'b0000110000000000;  // SHR
    data[9] = 16'b0001000000000000;  // CSL
    data[10]= 16'b0010000000000001;  // LDA 00000 00001
    data[11]= 16'b0001100000000010;  // ADD
    data[12]= 16'b0010010000001110;  // JMP
    data[13]= 16'b0010000000000001;  // LDA 00000 00001
    data[14]= 16'b0010000000000010;  // LDA 00000 00010
    data[15]= 16'b0000100000000000;  // COM
    data[16]= 16'b0010000000000010;  // BAN 00000 00010
    data[17]= 16'b0010000000000001;  // LDA 00000 00001
    data[18]= 16'b0010000000000100;  // LDA 00000 00100
    
  end
  assign out = data[addr];
endmodule

