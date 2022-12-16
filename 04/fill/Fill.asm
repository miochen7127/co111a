// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
//24576-16384 = 8192 

(LOOP)
@8191
D = A
@i
M = D //i=8191
@24576
D=M
@BLACK
D;JNE
@WHITE
D;JEQ
@LOOP
0;JMP

(BLACK)
@i
D = M // D = i = 8191
@16384
A = A + D
M = -1
@i
M = M - 1
D = M
@BLACK
D;JGE
@LOOP
D;JLT

(WHITE)
@i
D = M // D = i = 8191
@16384
A = A + D
M = 0
@i
M = M - 1
D = M
@WHITE
D;JGE
@LOOP
D;JLT



// for(int i = 16384 ; i < 24576 ; i++){
//    
//    M = -1
//    M = M + 1
//    D = i
// }
// if(24576 != 0) goto black