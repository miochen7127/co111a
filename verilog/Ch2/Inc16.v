`include "Add16.v"

module Inc16(input[15:0] in,output[15:0] out);
    Add16(in, true, out);
endmodule