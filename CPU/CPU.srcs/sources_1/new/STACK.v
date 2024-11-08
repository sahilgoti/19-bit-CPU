`timescale 1ns / 1ps

module STACK(
    input CLK,
    input RW,
    input [7:0]DATA_IN,
    input [3:0]ADDR,
    output reg [7:0]DATA_OUT
    );
    reg [7:0]R[0:15];
    always @(*)
    begin
    if(RW)
      R[ADDR] = DATA_IN;
    else
      DATA_OUT = R[ADDR];
    end
endmodule
