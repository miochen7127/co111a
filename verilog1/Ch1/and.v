module And(input a,b, output out);
    nand g1(aandb,a,b);
    nand g2(out,aandb,aandb);
endmodule

module and_test;
reg a, b;
wire aandb;

And g(a,b,aandb);

initial
begin
  a = 0;
  b = 0;
  $monitor("%4dns monitor: a=%d b=%d aandb=%d", $stime, a, b, aandb);
end

always #50 begin
  a = a+1;
end

always #100 begin
  b = b+1;
end


initial #150 $finish;

endmodule