`include "gate16.v"

module Mux(input a, b, sel, output out);
  Not g1(sel, notsel);
  And g2(a,notsel, sela);
  And g3(b,sel,selb);
  Or  g4(sela, selb, out);
endmodule

module DMux(input in, sel, output a, b);
  Not g1(sel, nsel);
  And g2(sel, in, b);
  And g3(nsel,  in, a);
endmodule

module Mux16(input[15:0] a, b, input sel, output[15:0] out);
  Mux g1(a[0], b[0], sel, out[0]);
  Mux g2(a[1], b[1], sel, out[1]);
  Mux g3(a[2], b[2], sel, out[2]);
  Mux g4(a[3], b[3], sel, out[3]);
  Mux g5(a[4], b[4], sel, out[4]);
  Mux g6(a[5], b[5], sel, out[5]);
  Mux g7(a[6], b[6], sel, out[6]);
  Mux g8(a[7], b[7], sel, out[7]);
  Mux g9(a[8], b[8], sel, out[8]);
  Mux g10(a[9], b[9], sel, out[9]);
  Mux g11(a[10], b[10], sel, out[10]);
  Mux g12(a[11], b[11], sel, out[11]);
  Mux g13(a[12], b[12], sel, out[12]);
  Mux g14(a[13], b[13], sel, out[13]);
  Mux g15(a[14], b[14], sel, out[14]);
  Mux g16(a[15], b[15], sel, out[15]);
endmodule

module Mux4Way16(input[15:0] a,b,c,d, input[1:0] sel, output[15:0] out);
  wire [15:0] outab, outcd;
  Mux16 g1(a, b, sel[0], outab);
  Mux16 g2(c, d, sel[0], outcd);
  Mux16 g3(outab, outcd, sel[1], out);
endmodule

module Mux8Way16(input[15:0] a,b,c,d,e,f,g,h, input[2:0] sel, output[15:0] out);
  wire [15:0] outadcd, outefgh;
  Mux4Way16 g1(a, b, c, d, sel[1:0], outadcd);
  Mux4Way16 g2(e, f, g, h, sel[1:0], outefgh);
  Mux16     g3(outadcd, outefgh, sel[2], out);
endmodule

module DMux4Way(input in, input[1:0] sel, output a,b,c,d);
  DMux g1(in,sel[0],ac,bd);
  DMux g2(ac,sel[1],a, c);
  DMux g3(bd,sel[1],b,d);
endmodule

module DMux8Way(input in, input[2:0] sel, output a,b,c,d,e,f,g,h);
    DMux g1(in,sel[0],aceg,bdfh);
    DMux g2(aceg,sel[1],ae,cg);
    DMux g3(bdfh,sel[1],bf,dh);
    DMux g4(ae,sel[2],a,e);
    DMux g5(cg,sel[2],c,g);
    DMux g6(bf,sel[2],b,f);
    DMux g7(dh,sel[2],d,h);
endmodule
