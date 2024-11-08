`timescale 1ns / 1ps

module ID( // instruction Decoder
    input CLK,
    input [0:18]IN,
    output reg [4:0]OPCODE,
    output reg [5:0]R_SEL,
    output reg [7:0]ADDR
    );

    always @(*)begin
    OPCODE = IN[0:4];
    R_SEL =  IN[5:10];
    ADDR = IN[11:18];
    end
    
endmodule
