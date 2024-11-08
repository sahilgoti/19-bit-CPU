`timescale 1ns / 1ps

module MAU( // memory access unit
    input CLK,
    input [4:0]SEL,
    input [7:0]DATA_READ_FROM_RAM,
    input [7:0]R1_READ,
    output reg [7:0]DATA_WRITE_TO_RAM,
    output reg [7:0]R1_WRITE,
    output reg RW
    );
    always @(*)
    begin
    if(SEL == 5'b10000)begin
      RW = 0;
      R1_WRITE = DATA_READ_FROM_RAM;
      end
    else if(SEL == 5'b10001)begin
      RW = 1;
      DATA_WRITE_TO_RAM = R1_READ;
      end        
  
    end
endmodule
