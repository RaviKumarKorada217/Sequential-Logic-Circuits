/* Generating waveforms for the signal clk with frequencies 16MHz and 8MHz 

//Here half time period is in floating pointing values so we need to represent time scale precision upto that floating point value
//`timescale 1ns/1ns  //10^0 --> 0 

*/

`timescale 1ns/1ps  //10^3 --> 3 

module clock_generator2();
    
    reg clk;            // reference clock with 100MHz
    reg clk1, clk2;     // generated clocks
    
    initial begin
        clk=0;
        clk1=0;
        clk2=0;
    end
    
    always #5 clk=~clk;
    always #31.25 clk1=~clk1;   // f=16MHz --> t=62.5ns --> t/2=31.25ns
    always #62.5 clk2=~clk2;    // f=8MHz  --> t=125ns  --> t/2=62.5ns
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        
        #200; $finish();
    end
endmodule
