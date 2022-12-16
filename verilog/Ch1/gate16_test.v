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
  $monitor("a    =%b\nb    =%b\nbnot =%b\nanot =%b\naandb=%b\naorb =%b", a, b,bnot, anot, aandb, aorb);
  a  = 16'b011;
  b  = 16'b101;
  $finish;
end

endmodule

