`include "../Ch1/gate.v"

module Not16(input[15:0] in, output[15:0] out);
  Not g0(in[0], out[0]);
  Not g1(in[1], out[1]);
  Not g2(in[2], out[2]);
  Not g3(in[3], out[3]);
  Not g4(in[4], out[4]);
  Not g5(in[5], out[5]);
  Not g6(in[6], out[6]);
  Not g7(in[7], out[7]);
  Not g8(in[8], out[8]);
  Not g9(in[9], out[9]);
  Not g10(in[10], out[10]);
  Not g11(in[11], out[11]);
  Not g12(in[12], out[12]);
  Not g13(in[13], out[13]);
  Not g14(in[14], out[14]);
  Not g15(in[15], out[15]);
endmodule

module And16(input[15:0] a, b, output[15:0] out);
  And g0(a[0], b[0], out[0]);
  And g1(a[1], b[1], out[1]);
  And g2(a[2], b[2], out[2]);
  And g3(a[3], b[3], out[3]);
  And g4(a[4], b[4], out[4]);
  And g5(a[5], b[5], out[5]);
  And g6(a[6], b[6], out[6]);
  And g7(a[7], b[7], out[7]);
  And g8(a[8], b[8], out[8]);
  And g9(a[9], b[9], out[9]);
  And g10(a[10], b[10], out[10]);
  And g11(a[11], b[11], out[11]);
  And g12(a[12], b[12], out[12]);
  And g13(a[13], b[13], out[13]);
  And g14(a[14], b[14], out[14]);
  And g15(a[15], b[15], out[15]);
endmodule

module Or16(input[15:0] a, b, output[15:0] out);
  Or g0(a[0], b[0], out[0]);
  Or g1(a[1], b[1], out[1]);
  Or g2(a[2], b[2], out[2]);
  Or g3(a[3], b[3], out[3]);
  Or g4(a[4], b[4], out[4]);
  Or g5(a[5], b[5], out[5]);
  Or g6(a[6], b[6], out[6]);
  Or g7(a[7], b[7], out[7]);
  Or g8(a[8], b[8], out[8]);
  Or g9(a[9], b[9], out[9]);
  Or g10(a[10], b[10], out[10]);
  Or g11(a[11], b[11], out[11]);
  Or g12(a[12], b[12], out[12]);
  Or g13(a[13], b[13], out[13]);
  Or g14(a[14], b[14], out[14]);
  Or g15(a[15], b[15], out[15]);
endmodule