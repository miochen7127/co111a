`include "ALU.v"

module main;
reg  [15:0] a,b;
wire [15:0] sum;

Add16 g1(a, b,sum);

initial
begin
  $monitor("a    =%b\nb    =%b\nAdd16=%b\n", a, b,sum);
  a  = 16'b011;
  b  = 16'b101;
  $finish;
end

endmodule
