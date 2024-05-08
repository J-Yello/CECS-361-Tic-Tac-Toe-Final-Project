`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2021 03:25:52 PM
// Design Name: 
// Module Name: tik_tac_toe
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


module tik_tac_toe(
    input clk,
    input reset,
    input p1, //selcts player 1 to play 
    input p2, //selects player 2 to play 
    input [3:0] p1_pos,
    input [3:0] p2_pos,
    
    //positions to play
    output [1:0] pos0,
    output [1:0] pos1,
    output [1:0] pos2,
    output [1:0] pos3,
    output [1:0] pos4,
    output [1:0] pos5,
    output [1:0] pos6,
    output [1:0] pos7,
    output [1:0] pos8,
    
    //who the winner is 01: P1, 10: P2
    output [1:0] winner
    );
    wire [8:0] p1_en; //allows p1 play signal 
    wire [8:0] p2_en; //allows p2 play singnal
    wire move_check; //prevents illegal moves
    wire win;  //tells who wins 
    wire space; //no more space detector 
    wire p1_play; 
    wire p2_play; 
    
    //used to invert bit logic 
    wire [1:0] connect0, connect1, connect2, connect3, connect4, connect5, connect6, connect7, connect8;
    
    position_tracker pos_track(.clk(clk), .reset(reset), .move_check(move_check), .p1_en(p1_en[8:0]), .p2_en(p2_en[8:0]),
                               .pos0(pos0), .pos1(pos1), .pos2(pos2), .pos3(pos3), .pos4(pos4), .pos5(pos5), .pos6(pos6),
                               .pos7(pos7), .pos8(pos8), .place0(connect0), .place1(connect1), .place2(connect2),
                               .place3(connect3), .place4(connect4), .place5(connect5), .place6(connect6),
                               .place7(connect7), .place8(connect8));
    
   winner_detector whoWins(.pos1(connect0), .pos2(connect1), .pos3(connect2), .pos4(connect3), 
                           .pos5(connect4), .pos6(connect5), .pos7(connect6), .pos8(connect7), 
                            .pos9(connect8), .win(win), .who(winner));
                            
   position_dec P1_pos_dec(.in(p1_pos), .enable(p1_play), .out_en(p1_en));
   
   position_dec P2_pos_dec(.in(p2_pos), .enable(p2_play), .out_en(p2_en));
   
   illegal_move_detect check_move(.pos1(connect0), .pos2(connect1), .pos3(connect2), .pos4(connect3), .pos5(connect4), 
                                  .pos6(connect5), .pos7(connect6), .pos8(connect7), .pos9(connect8), .PL1_en(p1_en [8:0]), 
                                   .PL2_en(p2_en [8:0]), .illegal_move(move_check) );
   
   noSpace_detect noSpace(.pos1(connect0), .pos2(connect1), .pos3(connect2), .pos4(connect3), .pos5(connect4), .pos6(connect5), .pos7(connect6),
                          .pos8(connect7), .pos9(connect8), .no_space(space) );
                          
   fsm_turns turn_tracker(.clk(clk), .reset(reset), .p1(p1), .p2(p2), .move_check(move_check), .no_space(space), .winner(win), 
                          .p1_en(p1_play), .p2_en(p2_play) );
                            
endmodule
