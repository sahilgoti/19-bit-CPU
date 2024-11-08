`timescale 1ns / 1ps

module RAM(
    input RW,
    input [7:0]DATA_IN,
    input [7:0]ADDR,
    output reg [7:0]DATA_OUT
    );
    reg [7:0]R[0:255]; 
    always @(*)
    begin
    if(RW)
      R[ADDR] = DATA_IN;
    else
      DATA_OUT = R[ADDR];
    end
endmodule
