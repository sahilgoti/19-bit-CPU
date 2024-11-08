`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Sahil Goti
// 
// Create Date: 26.10.2024 01:28:36
// Design Name: 
// Module Name: CPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CPU(
    input CLK,
    input RESET,
    output [7:0]R1,R2,R3,R4
    );

wire [4:0]PC_IN;
wire [4:0]PC_OUT;
wire [18:0]INSTRUCTION;
wire [5:0]R_SEL;
wire [7:0]R1_WRITE;
wire [7:0]R2_WRITE;
wire [7:0]R3_WRITE;
wire [4:0]SEL;
wire [7:0]R1_READ;
wire [7:0]R2_READ;
wire [7:0]R3_READ;
wire [7:0]RAM_DATA_OUT,RAM_DATA_IN,ADDR;
wire [7:0]STACK_DATA_IN;
wire [7:0]STACK_DATA_OUT;
wire [4:0]SP;
wire [7:0]R1_WRITE1,R1_WRITE2,R1_WRITE3,RAM_DATA_IN1,RAM_DATA_IN2,ADDR1,ADDR2;
wire RW,EN;
PC PC(CLK,RESET,PC_IN,EN,PC_OUT);
IM IM(CLK,PC_OUT,INSTRUCTION);
ID ID(CLK,INSTRUCTION,SEL,R_SEL,ADDR2);

REG REG(CLK,R_SEL,R1_WRITE,R2_WRITE,R3_WRITE,R1_READ,R2_READ,R3_READ,R1,R2,R3,R4);
RAM RAM(RW,RAM_DATA_IN,ADDR,RAM_DATA_OUT);
ALU ALU(CLK,SEL,R2_READ,R3_READ,R1_WRITE1);
SPU SPU(CLK,SEL,RAM_DATA_OUT,R1_READ,R2_READ,RAM_DATA_IN1,R1_WRITE2,R2_WRITE,ADDR1,RW1);
CFU CFU(CLK,SEL,R1_READ,R2_READ,ADDR,STACK_DATA_OUT,STACK_DATA_IN,PC_IN,SP,SP_RW);
MAU MAU(CLK,SEL,RAM_DATA_OUT,R1_READ,RAM_DATA_IN2,R1_WRITE3,RW2);
STACK STACK(CLK,SP_RW,STACK_DATA_IN,SP,STACK_DATA_OUT);
    
LINE_SEL LINE_SEL(SEL,R1_WRITE1,R1_WRITE2,R1_WRITE3,RAM_DATA_IN1,RAM_DATA_IN2,ADDR1,ADDR2,RW1,RW2,R1_WRITE,RAM_DATA_IN,ADDR,RW,EN);
    
    
endmodule
