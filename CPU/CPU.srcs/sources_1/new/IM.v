`timescale 1ns / 1ps

module IM( // instruction memory
    input CLK,
    input [4:0]ADDR,
    output reg [0:18]DATA_OUT
    );
    reg [0:18]R[0:31];
    initial begin
    R[0] = 'h78602;
    R[1] = 'h046xx;
    R[2] = 'h086xx;
    R[3] = 'h7C601;
    R[4] = 'h106xx;
    R[5] = 'h146xx;
    R[6] = 'h186xx;
    R[7] = 'h1CAxx;
    R[8] = 'h20Axx;
    R[9] = 'h24Axx;
    R[10] = 'h286xx;
    R[11] = 'h2C6xx;
    R[12] = 'h30Axx;
    R[13] = 'h34Axx;
    R[14] = 'h38Axx;
    R[15] = 'h3C6xx;
    R[16] = 'h40605;
    R[17] = 'h44605;
    R[18] = 'h486xx;
    R[19] = 'h4C6xx;
    R[20] = 'h506xx;
    R[21] = 'h546xx;
    R[22] = 'h586xx;
    R[23] = 'h5C6xx;
    R[24] = 'h60601;
    R[25] = 'h64601;
    R[26] = 'h68A01;
    R[27] = 'h6CA01;
    R[28] = 'h70A01;
    R[29] = 'h74601;
    R[30] = 'h78601;
    R[31] = 'h7C601;
    end
    always @(*)
    begin
    DATA_OUT=R[ADDR];
    end
endmodule
