`timescale 1ns/1ns
module tb_ram;

    reg clk;
    reg [3:0] mask;
    reg sext;
    reg start;
    reg rdwr;
    reg uart_rx, uart_tx;
    reg rst,rdstrb,dv;
    reg done;

  // Memory Interface
    reg [31:0] address = 32'b0;
    reg [31:0] read_val;
    reg [31:0] write_val;

     initial begin
         $dumpfile("wave.vcd");
         $dumpvars(0, tb);
     end

   ram mem_ram(
     .clk(clk),
     .rst(rst),
     .address(address),
     .mask(mask),
     .sext(sext),
     .write_val(write_val),
     .rdwr(rdwr),
     .start(start),
     .read_val(read_val),
     .done(done)
   );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        // Test a write sequence
        #1 rst = 1'b1; 
        #10 rst = 1'b0;
        #1 rst = 1'b1;
        address = 'd12;
        mask = 'b1111; // SW
        write_val = 32'b11111111111111111111111111111111;
        rdwr = 1'b1;
        start = 1'b1;
        #20 start = 1'b0; // Pulse for a single clock
        wait(done);
        
        address = 'd14;
        mask = 'b0011; // SH
        write_val = 32'b1010101010101001010101010101010;
        rdwr = 1'b1;
        start = 1'b1;
        #50 start = 1'b0; // Pulse for a single clock
        wait(done);

        // Test a read sequence
        rdwr = 1'b0;
        mask = 'b0011; // LH
        sext = 1'b0;
        address = 'd14;
        start = 1'b1;
        #50 start = 1'b0;
        #1000 $finish; 
        $display("Read value is :%32b",read_val);
      end
endmodule
