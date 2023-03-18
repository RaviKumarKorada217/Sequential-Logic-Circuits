/* Generating waveforms for the signal clk with frequencies 100MHz, 50MHz and 25MHz */

`timescale 1ns/1ps

module clock_generator1();

    reg clk1, clk2, clk3;
    
    initial begin
        clk1=0;
        clk2=0;
        clk3=0;
    end
    
    always #5 clk1=~clk1;   // f=100MHz --> t=10ns --> t/2=5ns
    always #10 clk2=~clk2;  // f=50MHz  --> t=20ns --> t/2=10ns
    always #20 clk3=~clk3;  // f=25MHz  --> t=40ns --> t/2=20ns
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        
        #200; $finish();
    end
endmodule
