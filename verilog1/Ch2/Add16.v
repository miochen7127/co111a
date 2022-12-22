`include "Half_Full.v"

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