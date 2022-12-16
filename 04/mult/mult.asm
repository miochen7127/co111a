// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
//#include<stdio.h>

//int main(){
//    int R0 = 3;
//    int R1 = 5;
//    int R2 = 0;
@0
D=A
@R2
M=0

//    while(R1 > 0){
//        R2 = R2 + R0;
//        R1--;
//    }
(LOOP)
@R1
D=M
@END
D;JEQ
@R0
D=M
@R2
M=M+D
@R1
M=M-1


@LOOP
D;JGT

(END)
@END
D;JEQ

//if(R1 >= 0) goto 
//    printf("%d",R2);
//}