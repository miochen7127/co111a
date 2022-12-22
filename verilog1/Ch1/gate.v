module Nand(input a,b, output out);
    nand g1(out,a,b);
endmodule

module Not(input in,output out);
    Nand g1(in,in,out);
endmodule

module Or(input a,b, output out);
    Nand g1(a,a,anand);
    Nand g2(b,b,bnand);
    Nand g3(anand,bnand,out);
endmodule

module Xor(input a,b, output out);
    Nand g1(a,b,aandb);
    Or g2(a,b,aorb);
    And g3(aandb,aorb,out);
endmodule

module And(input a,b, output out);
    Nand g1(a,b,anandb);
    Nand g2(anandb,anandb,out);
endmodule

module Or8Way(input[7:0] in, output out);
  Or g1(in[7], in[6], or76);
  Or g2(in[5], in[4], or54);
  Or g3(in[3], in[2], or32);
  Or g4(in[1], in[0], or10);
  Or g5(or76, or54, or74);
  Or g6(or32, or10, or30);
  Or g7(or74, or30, out);
endmodule
