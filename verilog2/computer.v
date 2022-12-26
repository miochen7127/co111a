`include "Memory.v"

module Memory(input[15:0] in, input clock, load, input[14:0] address, output[15:0] out);
  wire[15:0] ramO, scrO, keyO;
  
    DMux4Way g1(load,address[14:13],ram0,ram1,scr,key); //address[13] = 16383 = RAM , address[14] 一個是鍵盤 一個是螢幕
    Or g2(ram0,ram1,rload);
    RAM16K g3(in,clock,rload,address[13:0],ramO);
    RAM8K Screen(in,clock,scr,address[12:0],scrO); //內建
    Register Keyboard(16'h0F0F,clock,1'b0,keyO); //內建 , 只能讀不能寫,所以沒有in
    Mux4Way16 g6(ramO,ramO,scrO,keyO,address[14:13],out);
endmodule

module CPU(input[15:0] inM, instruction, input clock, reset, output[15:0] outM, output writeM, output[14:0] addressM, pc);
    wire[15:0] back, Arin, ALUa, Arout, ALUb, pcOut, addressMOut;
    Mux16 m1(instruction , back , instruction[15] ,Arin);

    // A register
    Mux m2(1'b0 , 1'b1 ,instruction[15] , isC);
    Not g1(isC , isA); //不是A指令，就是C指令
    And g2(isC ,instruction[5] , ALUtoA); //給A的load
    Or g3(isA , ALUtoA , Aload); //給A的load

    Register A(Arin ,clock,Aload , Arout);
    assign addressM = Arout[14:0];
    Mux16 m3(Arout ,inM ,instruction[12] , ALUb);
    And g4(instruction[4] ,instruction[15] ,Dload);
    Register D(back ,clock, Dload , ALUa);
    ALU a1(ALUa ,ALUb ,instruction[11] , instruction[10] , instruction[9] , instruction[8] , instruction[7] , instruction[6] , back , zr , ng);

    //JUMP
    Mux m4(1'b0,1'b1,instruction[2],j1);
    Mux m5(1'b0,1'b1,instruction[1],j2);
    Mux m6(1'b0,1'b1,instruction[0],j3);

    //JMP
    And g5(j3,j2,jmp0);
    And g6(jmp0,j1,JMP);

    //JEQ
    And g7(j2,zr,EQ);

    //JLT
    And g8(j1,ng,LT);

    //JGT
    Not g9(ng,nng);
    And g10(nng,j3,GT0);
    Not g11(zr,nzr);
    And g12(nzr,GT0,GT);
    Or g13(JMP,EQ,JMPorEQ);
    Or g14(LT,GT,LTorGT);
    Or g15(JMPorEQ,LTorGT,pcload0);

    And g16(instruction[15],pcload0,pcload);
    And g17(instruction[3],instruction[15],writeM);
    PC pc1(Arout,clock,pcload,reset,1'b1,pcOut);
    assign pc = pcOut[14:0];
endmodule

module Computer(input clock, reset);
    wire[15:0] inM, outM, instruction;
    wire[14:0] addressM, pc;
    
    Memory M1(outM,!clock,writeM,addressM,inM);
    ROM32K R1(pc,instruction);
	CPU C1(inM,instruction,clock,reset,outM,writeM,addressM,pc);
	
    //將暫存器、處理器、記憶體合在一起
endmodule
