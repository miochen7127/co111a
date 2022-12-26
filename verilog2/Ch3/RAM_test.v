`include "Memory.v"

module main;
reg[15:0] in;
reg       load, clock;
reg[13:0] address;
wire[15:0] out;

RAM16K m(in, clock, load, address, out);

initial
begin
  clock=0;
  $monitor("%4dns in=%d clock=%d load=%d address=%d out=%d", $stime, in, clock, load, address, out);
  in=0; load=0; address=0;
  load=0; 
end

always #1 begin
  clock=~clock;
end

always #2 begin
  load=load + 1;
end

always #3 begin
  in = {$random} % 21845;
end

always #4 begin
  address = {$random} % 16383;
end

initial #50 $finish;

endmodule
