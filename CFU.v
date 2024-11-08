`timescale 1ns / 1ps

module CFU( // Control Flow Instructions
    input CLK,      
    input [4:0]SEL,
    input [7:0]R1_READ,
    input [7:0]R2_READ,
    input [7:0]ADDR,
    input [7:0]DATA_READ_FROM_STACK,
    output reg [7:0]DATA_WRITE_TO_STACK,
    output [4:0]pc,
    output reg [3:0]SP,
    output reg RW
    );
    
    integer i;
    reg [4:0]PC;
    
    always @(*)begin
    SP=15;
    case(SEL)
    5'b11000:begin
               PC = ADDR;
             end
    5'b11001:begin
             if(R1_READ == R2_READ)
               PC = ADDR;
             end
    5'b11010:begin 
             if(R1_READ != R2_READ)
               PC = ADDR;                         
             end
    5'b11011:begin  
             if(R1_READ > R2_READ)
               PC = ADDR;
             end
    5'b11100:begin
             if(R1_READ < R2_READ)
               PC = ADDR;
             end 
    5'b11101:begin 
             if(R1_READ == 0)
               PC = ADDR;
             end 
    5'b11110:begin 
             RW=1;
             DATA_WRITE_TO_STACK = PC+1;
             #5;
             SP=SP-1;
             PC = ADDR;
              end
    5'b11111:begin  
             RW=0;
             SP=SP+1;
             PC = DATA_READ_FROM_STACK;
              end 
    endcase
    end
    assign pc=PC;
endmodule
