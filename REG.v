`timescale 1ns / 1ps

module REG( 
    input CLK,
    input [5:0]R_SEL,
    input [7:0]R1_IN,
    input [7:0]R2_IN,
    input [7:0]R3_IN,
    output reg[7:0]R1_OUT,
    output reg[7:0]R2_OUT,
    output reg[7:0]R3_OUT,
    output [7:0]R1,R2,R3,R4
    );
    reg[7:0]R[3:0];
    always @(*)begin
    R1_OUT=R1_IN;
    R2_OUT=R2_IN;
    R3_OUT=R3_IN;
    R[R_SEL[5:4]]=R1_IN;
    R[R_SEL[3:2]]=R2_IN;
    R[R_SEL[1:0]]=R3_IN;
    end
    assign R1=R[0];
    assign R2=R[1];
    assign R3=R[2];
    assign R4=R[3];
    
endmodule
