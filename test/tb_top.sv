`timescale 1ns/1ns

module tb;

    reg clk;
    reg uart_rx, uart_tx;
    reg rst;

    top dut (
        .clk(clk),
        .rst(rst),
        .uart_rx(uart_rx),
        .uart_tx(uart_tx)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);
    end

    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    initial begin
        rst = 'b0;
        #1000
        rst = 'b1;
        #100
        rst = 'b0;
        #10000

        $display("Yo can you believe we are done???!!!");
        $finish;
    end

endmodule
