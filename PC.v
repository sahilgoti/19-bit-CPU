`timescale 1ns / 1ps

module PC( 
    input CLK,
    input RESET,
    input [4:0]PC_IN,
    input EN,
    output reg [4:0]PC_OUT
    );
    always @(posedge CLK)begin
    if(RESET)
      PC_OUT=0;
    else begin  
      if(EN)
        PC_OUT=PC_IN;
      else
        PC_OUT=PC_OUT+1; 
    end     
    end
    
    
endmodule
