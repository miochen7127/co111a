`include "../Ch1/gate.v"

module HalfAdder(input a, b, output carry,sum);
  Xor g1(a,b,sum);
  And g2(a,b,carry);
endmodule

module FullAdder(input a, b,c, output carry,sum);
  Xor g1(a , b , xab);
  Xor g2(xab , c , sum);
  And g3(a , b , ab);
  And g4(a , c , ac);
  And g5(b , c , bc);
  Or  g6(ab , ac , abac);
  Or  g7(abac , bc , carry);
endmodule