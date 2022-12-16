`include "DFF.v"
`include "../Ch1/MUX_DMUX_tr.v"

module Bit(input in,clock,load, output out);
  wire out1;
  Mux g1(out, in, load, out1);
  DFF g2(out1, clock, out);
endmodule