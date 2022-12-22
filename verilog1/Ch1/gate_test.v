`include "gate.v"

module main;
reg a, b;
wire abnand, anot, aband, abor, abxor;

Not  g1(a, anot);
Nand g2(a, b, abnand);
And  g3(a, b, aband);
Or   g4(a, b, abor);
Xor  g5(a, b, abxor);

initial
begin
  $monitor("a=%d b=%d anot=%d abnand=%d aband=%d abor=%d abxor=%d", a, b, anot, abnand, aband, abor, abxor);
  a  = 0;
  b  = 0;
end

always #50 begin
  a = a+1;
end

always #100 begin
  b = b+1;
end

initial #500 $finish;

endmodule