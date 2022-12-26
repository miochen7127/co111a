`include "computer.v"

module CPU_test;
reg[15:0] inM, instruction;
reg clock, reset;
wire[15:0] outM;
wire writeM;
wire[14:0] addressM, pc;

CPU cpu(inM, instruction,clock, reset,outM,writeM,addressM, pc);

initial
begin
    inM=0;instruction=0;clock=0;reset=0;
    $monitor("%4dns inM=%d instruction=%b clock=%b reset=%b outM=%d addressM=%d pc=%d", $stime, inM, instruction, clock, reset, outM, addressM, pc);
    #4 instruction=16'B0011000000111001;//@12345
    #4 instruction=16'B1110110000010000;//D=A
    #4 instruction=16'B0101101110100000;//@23456
    #4 instruction=16'B1110000111010000;//D=A-D
end
initial
begin
    #8 inM=11111;
end

always #1 begin
    clock=~clock;
end

always #2 begin
    reset=reset+1;
end


initial #16 $finish;
endmodule