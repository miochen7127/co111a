`include "gate.v"

module main;
reg a, b;
wire anandb, anot, aandb, aorb, axorb;

Not  g1(a, anot);
Nand g2(a, b, anandb);
And  g3(a, b, aandb);
Or   g4(a, b, aorb);
Xor  g5(a, b, axorb);

initial
begin
  $monitor(" a=%d b=%d anot=%d\n anandb=%d\n aandb=%d\n aorb=%d\n axorb=%d\n", a, b, anot, anandb, aandb, aorb, axorb);
  a  = 0;
  b  = 0;
end

always #1 begin
  a = a+1;
end

always #2 begin
  b = b+1;
end

initial #10 $finish;

endmodule