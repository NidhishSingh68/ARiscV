`timescale 1ns/1ns

module tb_top_ram;

  reg clk;
  reg uart_rx, uart_tx;
  reg rst;
  
  initial begin
     $dumpfile("wave.vcd");
     $dumpvars(0, tb);
  end

  top top(
    .clk(clk),
    .rst(rst),
    .uart_tx(uart_tx),
    .uart_rx(uart_rx)
  );

  initial begin
      clk = 0;
      forever #10 clk = ~clk;
  end

  initial begin
    rst = 1'b1;
    #150000 $finish; 
  end
endmodule
