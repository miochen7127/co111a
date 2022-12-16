`include "FullAdder.v"

module main;
reg  a,b,c;
wire sum,carry;

FullAdder g1(a,b,c,carry,sum);

initial
begin
  $monitor("a = %b b = %b c = %b carry = %b sum = %b\n", a, b,c,carry, sum);
  a = 0;
  b = 0;
  c = 0;
end

always #50 begin
  c = c+1;
end

always #100 begin
  b = b+1;
end

always #200 begin
  a = a+1;
end

initial #350 $finish;

endmodule