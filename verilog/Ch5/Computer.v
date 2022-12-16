`include "Memory.v"
module Memory(input[15:0] in, input clock, load, input[14:0] address, output[15:0] out);
  wire[15:0] ramO, scrO, keyO;

  DMux4Way g1(load,address[14:13],ram0,ram1,scr,key);
  Or g2(ram0,ram1,rload);
  
  RAM16K ram16k(in, clock, rload, address[13:0], ramO);
  RAM8K  screen(in, clock, scr, address[12:0], scrO);
  Register keyboard(16'h0F0F, clock, 1'b0, keyO);
  Mux4Way16 g3(ramO,ramO,scrO,keyO,address[14:13],out);
endmodule

module CPU(input[15:0] inM, instruction, input clock, reset, output[15:0] outM, output writeM, output[14:0] addressM, pc);
  wire[15:0] Arin, Arout,inM,ALUb,ALUa,pcout;
    // Put your code here:
    Mux16 m1(instruction , back , instruction[15] , Arin);
    
    // A register
    Mux m2(0 , 1 ,instruction[15] ,isC);
    Not g1(isC ,isA); //不是A指令，就是C指令
    And g2(isC ,instruction[5] , oALUtoA); //給A的load
    Or g3(isA ,ALUtoA ,Aload); //給A的load

    Register ARegister(Arin ,clock, Aload ,Arout);
    assign addressM = Arout[14:0];
    Mux16 m3(Arout ,inM ,instruction[12] , ALUb);
    And g4(instruction[4] , instruction[15] ,Dload);
    Register DRegister(back ,clock,Dload , ALUa);
    ALU ALU(ALUa , ALUb ,instruction[11] , instruction[10] , instruction[9] , instruction[8] , instruction[7] , instruction[6] ,back , zr ,ng);
    assign outM = back;
    
    //JUMP
    Mux m4(0,1,instruction[2],j1);
    Mux m5(0,1,instruction[1],j2);
    Mux m6(0,1,instruction[0],j3);
    
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

    Or g13(JMP, EQ, orJE);
    Or g14(LT, GT, orLG);
    Or g15(orJE, orLG, pcload0);
    And g16(instruction[15],pcload0,pcload);
    And g17(instruction[3],instruction[15],writeM);
    PC pc(Arout,clock,pcload,reset,1,pcout);
    assign pc = pcout;
endmodule

module Computer(input clock, reset);
  wire[15:0] inM, outM, instruction;
  wire[14:0] addressM, pc;
  
  Memory ram(outM, !clock, loadM, addressM, inM);
  ROM32K rom(pc, instruction);
  CPU    cpu(inM, I, clock, reset, inM, loadM, addressM, pc);	
endmodule

/*
CHIP Computer {

    IN reset;

    PARTS:
    // Put your code here:
    ROM32K(address=pc,out=instruction);
	CPU(inM=inM,instruction=instruction,reset=reset,outM=outM,writeM=writeM,addressM=addressM,pc=pc);
	Memory(in=outM,load=writeM,address=addressM,out=inM);
    //將暫存器、處理器、記憶體合在一起
}
*/