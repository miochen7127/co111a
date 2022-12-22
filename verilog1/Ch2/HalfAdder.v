`include "../Ch1/gate.v"

module HalfAdder(input a, b, output carry,sum);
  Xor g1(a,b,sum);
  And g2(a,b,carry);
endmodule