`include "Memory.v"

module main;
reg[15:0] in;
reg load, inc, reset, clock;
wire[15:0] out;

PC pc(in, clock, load, inc, reset, out);

initial
begin
  clock = 0;
  $monitor("%4dns clock=%d in=%d reset=%d inc=%d load=%d out=%d", $stime, clock, in, reset, inc, load, out);
  inc = 0; load = 0; reset=0; in=0;
end

always #1 begin
  clock = clock + 1;
end
always #2 begin
  inc = inc + 1;
end
always #3 begin
  load = load + 1;
end
always #4 begin
  reset = reset + 1;
end
always #5 begin
  in = {$random} % 32123;
end

initial #100 $finish;

endmodule