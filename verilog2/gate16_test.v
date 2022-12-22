`include "gate16.v"

module main;
reg  [15:0] a,b;
wire [15:0] anot, aandb, aorb,bnot;

Not16  g1(a, anot);
Not16  g2(b, bnot);
And16  g3(a, b, aandb);
Or16   g4(a, b, aorb);

initial
begin
  $monitor("a    =%b\nb    =%b\nanot =%b\nbnot =%b\naandb=%b\naorb =%b\n", a, b,anot, bnot, aandb, aorb);
  a  = 16'b0;
  b  = 16'b0;
end

always #1 begin
  a = a+1;
end

always #2 begin
  b = b+1;
end

initial #30 $finish;

endmodule

