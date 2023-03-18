// Generating waveform for the signal clk with time period: 40 nsec, duty cycle: 0.4 and phase difference: 0

`timescale 1ns/1ps

module clock_generator4();
    reg clk=0;    // reference clk with 100MHz
    reg clk1=0;   // generated clk

always #5 clk=~clk;

task calculation( input real phase, input real period, input real dutycycle,
                  output real pout, output real ton, output real toff);
 begin
    pout=phase;    
    ton= dutycycle*period;    
    toff=period-ton;
 end
endtask

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

real phase, ton, toff;

initial begin
    calculation(0,40,0.4,phase,ton,toff);
    clkgen(phase,ton,toff);
end

initial begin #200; $finish(); end

endmodule
