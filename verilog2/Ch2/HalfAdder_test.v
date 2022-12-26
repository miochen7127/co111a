`include "ALU.v"

module main;
reg  a,b;
wire sum,carry;

HalfAdder g1(a,b,carry,sum);

initial
begin
  $monitor("a = %b b = %b carry = %b sum = %b\n", a, b,carry, sum);
  a  = 0;
  b  = 0;
end

always #50 begin
  b = b+1;
end

always #100 begin
  a = a+1;
end

initial #200 $finish;

endmodule