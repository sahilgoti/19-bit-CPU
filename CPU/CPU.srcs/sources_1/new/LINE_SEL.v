`timescale 1ns / 1ps

module LINE_SEL(
    input [4:0] SEL,
    input [7:0] R1_WRITE1, R1_WRITE2, R1_WRITE3, RAM_DATA_IN1, RAM_DATA_IN2, ADDR1, ADDR2,
    input RW1, RW2,
    output reg [7:0] R1_WRITE, RAM_DATA_IN, ADDR,
    output reg RW, EN 
);
    always @(*) begin
        // Set default values for all outputs to avoid latches
        R1_WRITE = 8'b0;
        RAM_DATA_IN = 8'b0;
        ADDR = 8'b0;
        RW = 1'b0;
        EN = 1'b0;
        
        if (SEL <= 5'b01111) begin
            R1_WRITE = R1_WRITE1;
            ADDR = ADDR2;
            EN = 0;
        end
        else if (SEL == 5'b10000 | SEL == 5'b10001) begin
            R1_WRITE = R1_WRITE3;
            RAM_DATA_IN = RAM_DATA_IN2;
            RW = RW2;
            ADDR = ADDR2;
            EN = 0;
        end
        else if (SEL >= 5'b10010 && SEL <= 5'b10111) begin  // Adjusted upper limit to avoid overlap
            R1_WRITE = R1_WRITE2;
            RAM_DATA_IN = RAM_DATA_IN1;
            RW = RW1;
            ADDR = ADDR1;
            EN = 0;
        end
        else if (SEL >= 5'b11000 && SEL <= 5'b11111) begin
            ADDR = ADDR2;
            EN = 1;
        end
    end
    
endmodule
