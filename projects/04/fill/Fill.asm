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

@KBD
D=A-1 // = SCREEN+8K-1 = 24575 (the end of screen memory map)
@R1
M=D

(Main)
    @SCREEN
    D=A
    @R0
    M=D-1 // initialize R0 = SCREEN-1

    @KBD
    D=M
    @FillWhite
    D;JEQ // no key was pressed
    @FillBlack
    0;JMP

(FillWhite)
    @R0 // R0 = Current address of SCREEN
    MD=M+1
    A=D
    M=0 // fill 0

    @R1
    D=D-M
    @Main
    D;JEQ // reached end

    @FillWhite
    0;JMP

(FillBlack)
    @R0
    MD=M+1
    A=D
    M=0
    M=!M // fill 1

    @R1
    D=D-M
    @Main
    D;JEQ

    @FillBlack
    0;JMP
