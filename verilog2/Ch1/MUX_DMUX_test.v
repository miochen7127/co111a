`include "MUX_DMUX.v"

module main;
reg[15:0] a,b,c,d,e,f,g,h;
reg[2:0] sel;
wire[15:0] out;

Mux8Way16 g1(a,b,c,d,e,f,g,h,sel,out);


initial
begin
  $monitor("a=%x b=%x c=%x d=%x e=%x f=%x g=%x h=%x sel=%d out=%x ",a,b,c,d,e,f,g,h,sel, out);
  a  = 16'h0;
  b  = 16'h1;
  c  = 16'h2;
  d  = 16'h3;
  e  = 16'h4;
  f  = 16'h5;
  g  = 16'h6;
  h  = 16'h7;
  sel = 0;
end

always #50 begin
  sel=sel+1;
end

initial #350 $finish;


endmodule