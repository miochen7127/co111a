module DFF (input in, clock, output out);
  reg q;
  assign out = q;
  always @(posedge clock) begin //posedge正緣觸發，negedge負緣觸發
    q = in;
  end
endmodule

//copy 老師的，忘了assign是甚麼，也有上網查資料確認型式，https://ithelp.ithome.com.tw/articles/10191542