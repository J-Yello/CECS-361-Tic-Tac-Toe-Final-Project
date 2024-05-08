`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 02:24:33 PM
// Design Name: 
// Module Name: noSpace_detect
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


module noSpace_detect(
    input [1:0] pos1,
    input [1:0] pos2,
    input [1:0] pos3,
    input [1:0] pos4,
    input [1:0] pos5,
    input [1:0] pos6,
    input [1:0] pos7,
    input [1:0] pos8,
    input [1:0] pos9,
    output wire no_space
    );
    wire temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8,temp9;
    
    //detect no more space 
    assign temp1 = pos1[1] | pos1[0];
    assign temp2 = pos2[1] | pos2[0];
    assign temp3 = pos3[1] | pos3[0];
    assign temp4 = pos4[1] | pos4[0];
    assign temp5 = pos5[1] | pos5[0];
    assign temp6 = pos6[1] | pos6[0];
    assign temp7 = pos7[1] | pos7[0];
    assign temp8 = pos8[1] | pos8[0];
    assign temp9 = pos9[1] | pos9[0];
    
    //output 
    assign no_space = (temp1 & temp2 & temp3 & temp4 & temp5 & temp6 & temp7 & temp8 & temp9); 
     
endmodule
