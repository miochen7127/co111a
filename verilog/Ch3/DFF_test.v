`include "DFF.v"

module main;
reg in,clock;
wire out ;

DFF g1(in,clock,out);

initial begin
    clock = 0;
    in = 0;
    $monitor("in = %b,clock = %b, out = %b", in,clock, out);
  end
  always #1 begin
  clock = ~clock;
  end
  always #2 begin
  in = in + 1;
  end

initial #10 $finish;

endmodule