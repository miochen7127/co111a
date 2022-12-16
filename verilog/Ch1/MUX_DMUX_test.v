`include "MUX_DMUX.v"

module main;
reg a, b,sel;
wire MUX,DMUX1,DMUX2;

Mux g1(a,b, sel, MUX);


initial
begin
  a  = 0;
  b  = 0;
  sel = 0;
  $monitor("%4dns a=%d b=%d sel=%d MUX=%d ", $stime,a,b,sel, MUX);
end

always #50 begin
  sel=sel+1;
end

always #100 begin
  b=b+1;
end

always #200 begin
  a=a+1;
end

initial #500 $finish;


endmodule