`timescale 1ns / 1ps

module SPU( // Custom Instructions (for specialized applications) 
    input CLK,   
    input [4:0]SEL,
    input [7:0]DATA_READ_FROM_RAM,
    input [7:0]R1_READ,
    input [7:0]R2_READ,
    output reg [7:0]DATA_WRITE_TO_RAM,
    output reg [7:0]R1_WRITE,
    output reg [7:0]R2_WRITE,
    output reg [7:0]ADDR,
    output reg RW
    );
    reg [7:0]R1[3:0];
    reg [7:0]R2[3:0];
    reg [7:0]R3[7:0];
    reg [7:0]KEY=8'b11010101;
    integer i;
    always @(*)begin
    case(SEL)
    5'b10010:begin //fft
             for(i=0;i<4;i=i+1)begin
                 RW=0;
                 ADDR=R2_READ+i;
                 #5;
                 R1[i]=DATA_READ_FROM_RAM;
                 end
             // STAGE 1 OF FFT    
             R2[0]= R1[0] + R1[2];
             R2[1]= R1[0] - R1[2];
             R2[2]= R1[1] + R1[3];
             R2[3]= R1[1] - R1[3];
             
             // STAGE 2 OF FFT    
             R3[0]= R2[0]+R2[2]; // real part
             R3[1]= 0;           // imaginary part
             R3[2]= R2[1];       // real part
             R3[3]= - R2[3];     // imaginary part
             R3[4]= R2[0]-R2[2]; // real part
             R3[5]= 0;           // imaginary part
             R3[6]= R2[1];       // real part
             R3[7]= R2[3];       // imaginary part
             #5;
             for(i=0;i<8;i=i+1)begin
                 RW=1;
                 ADDR = R1_READ-1+i;
                 #3;
                 DATA_WRITE_TO_RAM = R3[i];
                 end             
             end
    5'b10011:begin //encrypted_data 
             RW=0;
             ADDR=R2_READ;
             #5;
             R1[1]= DATA_READ_FROM_RAM;
             R1[2]= R1[1]^KEY;
             RW=1;
             ADDR=R1_READ;
             #5;
             DATA_WRITE_TO_RAM = R1[2];
             end
     5'b10100:begin //decrypted_data 
             RW=0;
             ADDR=R2_READ;
             #5;
             R1[1]= DATA_READ_FROM_RAM;
             R1[2]= R1[1]^KEY;
             RW=1;
             ADDR=R1_READ;
             #5;
             DATA_WRITE_TO_RAM = R1[2];
             end 
     5'b10101:begin // bit reverse
             for(i=0;i<8;i=i+1)
                 R1_WRITE[i]=R2_READ[7-i];
             end  
     5'b10110:begin // PRIME oR nOT
             for(i=2;i<R2_READ;i=i+1)begin
                 if(R2_READ%2==0)
                    R1_WRITE=8'b00000000;
                 else
                    R1_WRITE=8'b11111111;
                 end
             end 
     5'b10111:begin  //FIND in RAM
              for(i=0;i<255;i=i+1)begin
                  RW=0;
                  ADDR=i;
                  #0.1;
                 if(R2_READ==DATA_READ_FROM_RAM)
                    R1_WRITE=i; 
                 end      
              end 
    endcase
    end
endmodule
