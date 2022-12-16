`include "Register.v"

module RAM8(input[15:0] in, input clock, load, input[2:0] address, output[15:0] out);
  wire[15:0] o0,o1,o2,o3,o4,o5,o6,o7;
  
  DMux8Way g0(load, address, L0, L1, L2, L3, L4, L5, L6, L7);
  
  Register g1(in, clock, L0, o0);
  Register g2(in, clock, L1, o1);
  Register g3(in, clock, L2, o2);
  Register g4(in, clock, L3, o3);
  Register g5(in, clock, L4, o4);
  Register g6(in, clock, L5, o5);
  Register g7(in, clock, L6, o6);
  Register g8(in, clock, L7, o7);
  
  Mux8Way16 g9(o0, o1, o2, o3, o4, o5, o6, o7, address, out);
endmodule

module RAM64(input[15:0] in, input clock, load, input[5:0] address, output[15:0] out);
  wire[15:0] o0,o1,o2,o3,o4,o5,o6,o7;
  
  DMux8Way g0(load, address[5:3], L0, L1, L2, L3, L4, L5, L6, L7);
  
  RAM8 g1(in,  clock, L0, address[2:0], o0);
  RAM8 g2(in,  clock, L1, address[2:0], o1);
  RAM8 g3(in,  clock, L2, address[2:0], o2);
  RAM8 g4(in,  clock, L3, address[2:0], o3);
  RAM8 g5(in,  clock, L4, address[2:0], o4);
  RAM8 g6(in,  clock, L5, address[2:0], o5);
  RAM8 g7(in,  clock, L6, address[2:0], o6);
  RAM8 g8(in,  clock, L7, address[2:0], o7);

  Mux8Way16 g9(o0, o1, o2, o3, o4, o5, o6, o7, address[5:3], out);
endmodule

module RAM512(input[15:0] in, input clock, load, input[8:0] address, output[15:0] out);
  wire[15:0] o0,o1,o2,o3,o4,o5,o6,o7;
  
  DMux8Way g0(load, address[8:6], L0, L1, L2, L3, L4, L5, L6, L7);
  
  RAM64 g1(in,  clock, L0, address[2:0], o0);
  RAM64 g2(in,  clock, L1, address[2:0], o1);
  RAM64 g3(in,  clock, L2, address[2:0], o2);
  RAM64 g4(in,  clock, L3, address[2:0], o3);
  RAM64 g5(in,  clock, L4, address[2:0], o4);
  RAM64 g6(in,  clock, L5, address[2:0], o5);
  RAM64 g7(in,  clock, L6, address[2:0], o6);
  RAM64 g8(in,  clock, L7, address[2:0], o7);

  Mux8Way16 g9(o0, o1, o2, o3, o4, o5, o6, o7, address[8:6], out);
endmodule

module RAM4K(input[15:0] in, input clock, load, input[11:0] address, output[15:0] out);
  wire[15:0] o0,o1,o2,o3,o4,o5,o6,o7;
  
  DMux8Way g0(load, address[11:9], L0, L1, L2, L3, L4, L5, L6, L7);
  
  RAM512 g1(in,  clock, L0, address[5:0], o0);
  RAM512 g2(in,  clock, L1, address[5:0], o1);
  RAM512 g3(in,  clock, L2, address[5:0], o2);
  RAM512 g4(in,  clock, L3, address[5:0], o3);
  RAM512 g5(in,  clock, L4, address[5:0], o4);
  RAM512 g6(in,  clock, L5, address[5:0], o5);
  RAM512 g7(in,  clock, L6, address[5:0], o6);
  RAM512 g8(in,  clock, L7, address[5:0], o7);

  Mux8Way16 g9(o0, o1, o2, o3, o4, o5, o6, o7, address[11:9], out);
endmodule
/*
module RAM16K(input[15:0] in, input clock, load, input[13:0] address, output[15:0] out);
  wire[15:0] o0,o1,o2,o3;
  
  DMux4Way g0(load, address[13:12], L0, L1, L2, L3);
  
  RAM4K g1(in,  clock, L0, address[11:0], o0);
  RAM4K g2(in,  clock, L1, address[11:0], o1);
  RAM4K g3(in,  clock, L2, address[11:0], o2);
  RAM4K g4(in,  clock, L3, address[11:0], o3);

  Mux4Way16 g5(o0, o1, o2, o3, address[13:12], out);
endmodule
這是自己寫的，發現測試檔要跑很久，所以就複製老師的程式碼(以下)理解
*/
module ROM32K(input[14:0] address, output[15:0] out);
  reg[15:0] m[0:2**15-1];
  
  assign out = m[address];
endmodule

module RAM8K(input[15:0] in, input clock, load, input[12:0] address, output[15:0] out);
  reg[15:0] m[0:2**13-1];
  
  assign out = m[address];
  
  always @(posedge clock) begin
    if (load) m[address] = in;
  end
endmodule

module RAM16K(input[15:0] in, input clock, load, input[13:0] address, output[15:0] out);
  reg[15:0] m[0:2**14-1];
  
  assign out = m[address];
  
  always @(posedge clock) begin
    if (load) m[address] = in;
  end
endmodule