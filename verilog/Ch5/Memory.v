`include "../Ch3/RAM.v"

module Memory(input[15:0] in, input clock, load, input[14:0] address, output[15:0] out);
  wire[15:0] ramO, scrO, keyO;

  DMux4Way g1(load,address[14:13],ram0,ram1,scr,key);
  Or g2(ram0,ram1,rload);
  
  RAM16K ram16k(in, clock, rload, address[13:0], ramO);
  RAM8K  screen(in, clock, scr, address[12:0], scrO);
  Register keyboard(16'h0F0F, clock, 1'b0, keyO);
  Mux4Way16 g3(ramO,ramO,scrO,keyO,address[14:13],out);
endmodule

