module Nand(input a,b, output out);
    nand g(out,a,b);
endmodule

module nand_test;
reg a, b;
wire ab;

Nand g(a,b, ab);

initial
begin
  a = 0;
  b = 0;
  $monitor("%4dns monitor: a=%d b=%d a^b=%d", $stime, a, b, ab);
end

always #50 begin
  a = a+1;
end

always #100 begin
  b = b+1;
end


initial #150 $finish;

endmodule