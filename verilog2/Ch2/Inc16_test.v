`include "Memory.v"

module Inc16(input[15:0] in,output[15:0] out);
    Add16 g1(in, true, out);
endmodule