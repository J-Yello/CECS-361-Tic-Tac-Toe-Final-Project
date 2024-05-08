`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2021 02:26:25 PM
// Design Name: 
// Module Name: winner_detector
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


module winner_detector(
    input [1:0] pos1,
    input [1:0] pos2,
    input [1:0] pos3,
    input [1:0] pos4,
    input [1:0] pos5,
    input [1:0] pos6,
    input [1:0] pos7,
    input [1:0] pos8,
    input [1:0] pos9,
    output wire win,
    output wire [1:0] who
    );
    
    wire win1, win2, win3, win4, win5, win6, win7, win8;
    wire [1:0] who1, who2, who3, who4, who5, who6, who7, who8;
    
    //3 in a row - Top Row
    winner_detect row1(.pos0(pos1), .pos1(pos2), .pos2(pos3), .winner(win1), .who(who1)); 
    //3 in a row win - Middle Row
    winner_detect row2(.pos0(pos4), .pos1(pos5), .pos2(pos6), .winner(win2), .who(who2)); 
    //3 in a row win - Bottom Row
    winner_detect row3(.pos0(pos7), .pos1(pos7), .pos2(pos9), .winner(win3), .who(who3)); 
    //3 in a col - Left side 
    winner_detect col1(.pos0(pos1), .pos1(pos4), .pos2(pos7), .winner(win4), .who(who4)); 
    //3 in a col - Middle 
    winner_detect col2(.pos0(pos2), .pos1(pos5), .pos2(pos8), .winner(win5), .who(who5)); 
    //3 in a col - Right side 
    winner_detect col3(.pos0(pos3), .pos1(pos6), .pos2(pos9), .winner(win6), .who(who6)); 
    //diagonal left side 
    winner_detect Diagonal1(.pos0(pos1), .pos1(pos5), .pos2(pos9), .winner(win7), .who(who7)); 
    //diagonal right side
    winner_detect Diagonal2(.pos0(pos3), .pos1(pos5), .pos2(pos6), .winner(win8), .who(who8)); 
    
    assign win = win1 | win2 | win3 | win4 | win5 | win6 | win7 | win8;
    assign who = who1 | who2 | who3 | who4 | who5 | who6 | who7 | who8;
    
endmodule
