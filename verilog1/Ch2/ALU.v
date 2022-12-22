`include "../Ch1/MUX_DMUX_tr.v"

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

module Add16(input[15:0] a, b, output[15:0] sum);
    HalfAdder g0(a[0], b[0], sum[0], carry1);
    FullAdder g1(a[1], b[1], carry1, sum[1], carry2);
    FullAdder g2(a[2], b[2], carry2, sum[2], carry3);
    FullAdder g3(a[3], b[3], carry3, sum[3], carry4);
    FullAdder g4(a[4], b[4], carry4, sum[4], carry5);
    FullAdder g5(a[5], b[5], carry5, sum[5], carry6);
    FullAdder g6(a[6], b[6], carry6, sum[6], carry7);
    FullAdder g7(a[7], b[7], carry7, sum[7], carry8);
    FullAdder g8(a[8], b[8], carry8, sum[8], carry9);
    FullAdder g9(a[9], b[9], carry9, sum[9], carry10);
    FullAdder g10(a[10], b[10], carry10, sum[10], carry11);
    FullAdder g11(a[11], b[11], carry11, sum[11], carry12);
    FullAdder g12(a[12], b[12], carry12, sum[12], carry13);
    FullAdder g13(a[13], b[13], carry13, sum[13], carry14);
    FullAdder g14(a[14], b[14], carry14, sum[14], carry15);
    FullAdder g15(a[15], b[15], carry15, sum[15], carry16);
endmodule

module Inc16(input[15:0] in, output[15:0] out);
  Add16 g1(in, 16'h1, out);
endmodule

module ALU(input[15:0] x, y, input zx,nx,zy,ny,f,no, output[15:0] out, output zr, ng);

  wire[15:0] ozx, nnx, exx, ozy, nny, exy, andxy, addxy, fxy, nfxy, o2;
  wire ret0is0, ret1is0, yzr;

    // if (zx == 1) set x = 0        // 16-bit constant
    Mux16 g1(x, 16'b0,zx,ozx);

    // if (nx == 1) set x = !x       // bitwise not
    Not16 g2(ozx,nnx);
    Mux16 g3(ozx, nnx,nx,exx);

    // if (zy == 1) set y = 0        // 16-bit constant
    Mux16 g4(y, 16'b0 ,zy,ozy);

    // if (ny == 1) set y = !y       // bitwise not
    Not16 g5(ozy, nny);
    Mux16 g6(ozy, nny, ny, exy);

    // if (f == 1)  set out = x + y  // integer 2's complement addition
    // if (f == 0)  set out = x & y  // bitwise and
    Add16 g7(exx,exy, addxy);
    And16 g8(exx,exy,andxy);
    Mux16 g9(andxy,addxy, f,fxy);

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