`timescale 1ns / 1ps

module ALU(
    input CLK,
    input [4:0]SEL,
    input [7:0]A,
    input [7:0]B,
    output reg [7:0]C
    );
    always @(*)
    begin
    case(SEL)
    5'b00000:C = A + B;   //Addition
    5'b00001:C = A - B;   //subtrection
    5'b00010:C = A * B;   //multiplication
    5'b00011:C = A / B;   //division
    5'b00100:C = C + 1;   //increment
    5'b00101:C = C - 1;   //decrement
    5'b00110:C = C << 1;  //shiftleft
    5'b00111:C = C >> 1;  //shiftright
    5'b01000:C = A & B;   //logic AND
    5'b01001:C = A | B;   //logic OR
    5'b01010:C = A ^ B;   //logic XOR
    5'b01011:C = ~ C;     //logic NOT
    5'b01100:C = ~(A & B);   //logic NAND
    5'b01101:C = ~(A | B);   //logic NOR
    5'b01110:C = ~(A ^ B);  //logic XNOR
    5'b01111:C = (A < B)?8'b00000001:8'b00000000;  //Comparison
    endcase
    end
endmodule
