module CPU_tb;
  reg clk;
  reg reset;
  
  initial begin
    reset = 0;
    clk = 1;
    
    forever #50 clk = ~clk;
    #150 $stop;
  end
  
  CPU cpu_obj(
    .clk(clk), .rst(reset)
  );
  
  
endmodule

