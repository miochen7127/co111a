module Not(input in , output out);
    nand g1(out,in,in);
endmodule


module not_test;
reg a;
wire anot;

Not g(a,anot);

initial
begin
  a = 0;
  $monitor("%4dns monitor: a=%d anot=%d", $stime, a, anot);
end

always #50 begin
  a = a+1;
end


initial #50 $finish;

endmodule