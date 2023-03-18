// Generating waveform for the signal clk with phase difference: 8,  tON: 3,  tOFF: 10
                                                
`timescale 1ns/1ps

module clock_generator3();
    reg clk=0;    // reference clk with 100MHz
    reg clk1=0;   // generated clk

always #5 clk=~clk;

task clkgen(input real phase, input real ton, input real toff);
 begin
    #phase;
    forever 
    begin
        clk1=1;
        #ton;
        clk1=0;
        #toff;
    end
 end
endtask

initial begin
    clkgen(8,3,10);
end

initial begin 
  $dumpfile("dump.vcd");
  $dumvars;
  
  #200; $finish(); 
end

endmodule
