module DFF (input in, clock, output out);
  reg q;
  assign out = q;
  always @(posedge clock) begin
    q = in;
  end
endmodule

//參考/copy 老師的，忘了assign是甚麼，也有上網查資料確認型式，https://ithelp.ithome.com.tw/articles/10191542