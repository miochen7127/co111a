`include "computer.v"

module Memory_test;
reg [15:0] in;
reg[14:0] address;
reg clock, load;
wire[15:0] out;

Memory ram(in, clock,load,address, out);

initial begin
    clock=0;
    load=0;
    in = 0;
    $monitor("%4dns in=%d clock=%d load=%d address=%b = %d out=%d", $stime, in, clock, load, address, address, out);
    #2;
    in=-1;
    address=000000000000000;
    #4;
    in=9999;
    #1;
    address=010000000000000;
    #1;
    address=100000000000000;
    #2 in=2222;
    #18 in =9999;
    #4 in = 1234;
    #5 in =2345;
end

always #1 begin
    clock=~clock;
end
always #2 begin
    load = load+1;
end

initial #40 $finish;

endmodule