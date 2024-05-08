`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 02:09:10 PM
// Design Name: 
// Module Name: illegal_move_detect
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module illegal_move_detect(
    input [1:0] pos1,
    input [1:0] pos2,
    input [1:0] pos3,
    input [1:0] pos4,
    input [1:0] pos5,
    input [1:0] pos6,
    input [1:0] pos7,
    input [1:0] pos8,
    input [1:0] pos9,
    input [8:0] PL1_en,
    input [8:0] PL2_en,
    output wire illegal_move
    );
    wire temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9; 
    wire temp10, temp11, temp12, temp13, temp14, thep15, temp16, temp17, temp18; 
    wire temp19, temp20;
    //Player 1: Illegal move
    assign temp1 = (pos1[1] | pos1[0]) & PL1_en[0]; 
    assign temp2 = (pos2[1] | pos2[0]) & PL1_en[1]; 
    assign temp3 = (pos3[1] | pos3[0]) & PL1_en[2]; 
    assign temp4 = (pos4[1] | pos4[0]) & PL1_en[3]; 
    assign temp5 = (pos5[1] | pos5[0]) & PL1_en[4]; 
    assign temp6 = (pos6[1] | pos6[0]) & PL1_en[5]; 
    assign temp7 = (pos7[1] | pos7[0]) & PL1_en[6]; 
    assign temp8 = (pos8[1] | pos8[0]) & PL1_en[7]; 
    assign temp9 = (pos9[1] | pos9[0]) & PL1_en[8]; 
    
    //Player 2: Illegal move 
    assign temp10 = (pos1[1] | pos1[0]) & PL2_en[0]; 
    assign temp11 = (pos2[1] | pos2[0]) & PL2_en[1]; 
    assign temp12 = (pos3[1] | pos3[0]) & PL2_en[2]; 
    assign temp13 = (pos4[1] | pos4[0]) & PL2_en[3]; 
    assign temp14 = (pos5[1] | pos5[0]) & PL2_en[4]; 
    assign temp15 = (pos6[1] | pos6[0]) & PL2_en[5]; 
    assign temp16 = (pos7[1] | pos7[0]) & PL2_en[6]; 
    assign temp17 = (pos8[1] | pos8[0]) & PL2_en[7]; 
    assign temp18 = (pos9[1] | pos9[0]) & PL2_en[8]; 
    
    //Intermediate Signals 
    assign temp19 = (temp1 | temp2 | temp3 | temp4 | temp5 | temp6 | temp7 | temp8 | temp9);
    assign temp20 = (temp10 | temp11 | temp12 | temp13 | temp14 | temp15 | temp16 | temp17 | temp18);
    
    // output illegal move
    assign illegal_move = temp19 | temp20; 
  
endmodule
