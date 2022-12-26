`include "Memory.v"

module main;
reg in,load,clock;
wire out ;

Bit g1(in,clock,load,out);

initial begin
    load = 0;
    in = 0;
    clock = 0 ;
    $monitor("in = %b,clock = %b,load = %b, out = %b", in,clock,load, out);
  end
  always #1 begin
  clock = ~clock;
  end
  always #2 begin
  load = load + 1;
  end
  always #3 begin
  in = in + 1;
  end

initial #20 $finish;

endmodule