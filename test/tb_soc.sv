`timescale 1ns/1ns
module tb_soc;
    reg clk;
    reg rst;
    reg uart_rx;
    reg led;
    reg uart_tx;

    soc s 
    (
      .clk(clk),
      .rst(rst),

      // Uart lines
      .uart_rx(uart_rx),
      .led(led),
      .uart_tx(uart_tx)
    );

    initial begin
       $dumpfile("wave.vcd");
       $dumpvars(0, tb);
    end

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        // Test a write sequence
        #1 rst = 1'b1; 
        #10 rst = 1'b0;
        #1 rst = 1'b1;

        #10000 $finish; 
      end
endmodule
