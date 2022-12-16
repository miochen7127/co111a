`include "../Ch4/Register.v"
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