`include "Memory.v"

module main;
    reg [15:0] in;
    reg clock, load;
    wire [15:0] out;

    Register g1(in,clock,load,out);

    initial begin
    clock = 0;
    in = 0;
    load = 0;
    $monitor("in = %b,clock = %b,load= %b out = %b", in,clock,load, out);
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

initial #50 $finish;

endmodule