`include "../Ch1/MUX_DMUX.v"

module HalfAdder(input a, b, output sum,carry);
  Xor g1(a,b,sum);
  And g2(a,b,carry);
endmodule

module FullAdder(input a, b,c, output sum,carry);
  wire xab,ab,ac,bc,abac;
  Xor g1(a , b , xab);
  Xor g2(xab , c , sum);
  And g3(a , b , ab);
  And g4(a , c , ac);
  And g5(b , c , bc);
  Or  g6(ab , ac , abac);
  Or  g7(abac , bc , carry);
  //wire s1, c1, c2;
  //Xor g1(a,  b,  s1);
  //Xor g2(s1, c,  sum);
  //And g3(a,  b,  c1);
  //And g4(s1, c,  c2);
  //Xor g5(c2, c1, carry);

endmodule

module Add16(input[15:0] a, b, output[15:0] sum);
    wire [15:0] carry;
    HalfAdder g0(a[0], b[0], sum[0], carry[0]);
    FullAdder g1(a[1], b[1], carry[0], sum[1], carry[1]);
    FullAdder g2(a[2], b[2], carry[1], sum[2], carry[2]);
    FullAdder g3(a[3], b[3], carry[2], sum[3], carry[3]);
    FullAdder g4(a[4], b[4], carry[3], sum[4], carry[4]);
    FullAdder g5(a[5], b[5], carry[4], sum[5], carry[5]);
    FullAdder g6(a[6], b[6], carry[5], sum[6], carry[6]);
    FullAdder g7(a[7], b[7], carry[6], sum[7], carry[7]);
    FullAdder g8(a[8], b[8], carry[7], sum[8], carry[8]);
    FullAdder g9(a[9], b[9], carry[8], sum[9], carry[9]);
    FullAdder g10(a[10], b[10], carry[9], sum[10], carry[10]);
    FullAdder g11(a[11], b[11], carry[10], sum[11], carry[11]);
    FullAdder g12(a[12], b[12], carry[11], sum[12], carry[12]);
    FullAdder g13(a[13], b[13], carry[12], sum[13], carry[13]);
    FullAdder g14(a[14], b[14], carry[13], sum[14], carry[14]);
    FullAdder g15(a[15], b[15], carry[14], sum[15], carry[15]);
endmodule

module Inc16(input[15:0] in,output[15:0] out);
    Add16 g1(in,16'h1, out);
endmodule

module ALU(input[15:0] x, y, input zx,nx,zy,ny,f,no, output[15:0] out, output zr, ng);

  wire[15:0] x1, nx1, x2, y1, ny1, y2, xandy, xaddy, fxy, nfxy, o2;
  wire orLow, orHigh, notzr;

    // if (zx == 1) set x = 0        // 16-bit constant
    Mux16 g1(x, 16'b0,zx,x1);

    // if (nx == 1) set x = !x       // bitwise not
    Not16 g2(x1,nx1);
    Mux16 g3(x1,nx1,nx,x2);

    // if (zy == 1) set y = 0        // 16-bit constant
    Mux16 g4(y, 16'b0 ,zy,y1);

    // if (ny == 1) set y = !y       // bitwise not
    Not16 g5(y1,ny1);
    Mux16 g6(y1, ny1, ny, y2);

    // if (f == 1)  set out = x + y  // integer 2's complement addition
    // if (f == 0)  set out = x & y  // bitwise and
    Add16 g7(x2,y2, xaddy);
    And16 g8(x2,y2,xandy);
    Mux16 g9(xandy,xaddy, f,fxy);

    // if (no == 1) set out = !out   // bitwise not
    Not16 g10(fxy, nfxy);
    Mux16 g11(fxy, nfxy, no, o2);

    // if (out == 0) set zr = 1
    //Or8Way g12(out[7:0] , ret0is0);
    //Or8Way g13(out[15:8], ret1is0);

    //Or g14(a = ret0is0, b = ret1is0, yzr);
    //Not g15(in = yzr, out = zr);
    
    // if (out < 0) set ng = 1
    //And(a = retsign, b = true, out = ng);
    //Mux g16(false ,true , retsign ,ng);
    And16 g12(o2, o2, out); 
    Or8Way g13(out[7:0],  orLow);  // orLow = Or(out[0..7]);
    Or8Way g14(out[15:8], orHigh);// orHigh = Or(out[8..15]);
    Or    g15(orLow, orHigh, notzr);  // nzr = Or(out[0..15]);
    Not   g16(notzr, zr);            // zr = !nzr
    And   g17(o2[15], o2[15], ng);   // ng = out[15]
    And16 g18(o2, o2, out);

endmodule