`include "DFF.v"
`include "../Ch1/MUX_DMUX_tr.v"
module Bit(input in, clock, load, output out);
  wire out1;
  Mux g1(out, in, load, out1);
  DFF g2(out1, clock, out);
endmodule

module Register(input[15:0] in, input clock, load, output[15:0] out);
  Bit g1(in[15], clock, load, out[15]);
  Bit g2(in[14], clock, load, out[14]);
  Bit g3(in[13], clock, load, out[13]);
  Bit g4(in[12], clock, load, out[12]);
  Bit g5(in[11], clock, load, out[11]);
  Bit g6(in[10], clock, load, out[10]);
  Bit g7(in[9],  clock, load, out[9]);
  Bit g8(in[8],  clock, load, out[8]);
  Bit g9(in[7],  clock, load, out[7]);
  Bit g10(in[6],  clock, load, out[6]);
  Bit g11(in[5],  clock, load, out[5]);
  Bit g12(in[4],  clock, load, out[4]);
  Bit g13(in[3],  clock, load, out[3]);
  Bit g14(in[2],  clock, load, out[2]);
  Bit g15(in[1],  clock, load, out[1]);
  Bit g16(in[0],  clock, load, out[0]);
endmodule
