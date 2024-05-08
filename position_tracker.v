`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2021 03:47:38 PM
// Design Name: 
// Module Name: position_tracker
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


module position_tracker(
    input clk,
    input reset,
    input move_check, 
    input [8:0] p1_en,
    input [8:0] p2_en,
    output reg[1:0] pos0, //stores the mark that was placed there 
    output reg[1:0] pos1,
    output reg[1:0] pos2,
    output reg[1:0] pos3,
    output reg[1:0] pos4,
    output reg[1:0] pos5,
    output reg[1:0] pos6,
    output reg[1:0] pos7,
    output reg[1:0] pos8,
    output reg[1:0] place0, //stores the mark that was placed there 
    output reg[1:0] place1,
    output reg[1:0] place2,
    output reg[1:0] place3,
    output reg[1:0] place4,
    output reg[1:0] place5,
    output reg[1:0] place6,
    output reg[1:0] place7,
    output reg[1:0] place8
    );
    always @ (posedge clk, posedge reset) begin 
         //reset the board 
        if (reset) begin
            pos0 <= 2'b11;
            pos1 <= 2'b11;
            pos2 <= 2'b11;
            pos3 <= 2'b11;
            pos4 <= 2'b11;
            pos5 <= 2'b11;
            pos6 <= 2'b11;
            pos7 <= 2'b11;
            pos8 <= 2'b11;
            place0 <= 2'b00;
            place1 <= 2'b00;
            place2 <= 2'b00;
            place3 <= 2'b00;
            place4 <= 2'b00;
            place5 <= 2'b00;
            place6 <= 2'b00;
            place7 <= 2'b00;
            place8 <= 2'b00;
            
        end
        //saves position of moves if someone tries to place a mark on a location with a mark already 
        else if (move_check) begin 
            pos0 <= pos0;
            pos1 <= pos1;
            pos2 <= pos2;
            pos3 <= pos3;
            pos4 <= pos4;
            pos5 <= pos5;
            pos6 <= pos6;
            pos7 <= pos7;
            pos8 <= pos8;
            place0 <= place0;
            place1 <= place1;
            place2 <= place2;
            place3 <= place3;
            place4 <= place4;
            place5 <= place5;
            place6 <= place6;
            place7 <= place7;
            place8 <= place8;          
            
        end
        //position 0 
        else if (p1_en[0] == 1'b1) begin 
            pos0 <= 2'b01; //player 1 mark        
            place0 <= 2'b01; 
        end
        else if (p2_en[0] == 1'b1) begin 
            pos0 <= 2'b10; //player 2 mark
            place0 <= 2'b10; 
        end
        //position 1
        else if (p1_en[1] == 1'b1) begin 
            pos1 <= 2'b01;
            place1 <= 2'b01; 
        end
        else if (p2_en[1] == 1'b1) begin 
            pos1 <= 2'b10;
            place1 <= 2'b10; 
        end
        //positin 2
        else if (p1_en[2] == 1'b1) begin 
            pos2 <= 2'b01;
            place2 <= 2'b01; 
        end
        else if (p2_en[2] == 1'b1) begin 
            pos2 <= 2'b10;
            place2 <= 2'b10; 
        end
        //position 3
        else if (p1_en[3] == 1'b1) begin 
            pos3 <= 2'b01;
            place3 <= 2'b01; 
        end
        else if (p2_en[3] == 1'b1) begin 
            pos3 <= 2'b10;
            place3 <= 2'b10; 
        end
        //position 4  
        else if (p1_en[4] == 1'b1) begin 
            pos4 <= 2'b01;
            place4 <= 2'b01; 
        end
        else if (p2_en[4] == 1'b1) begin 
            pos4 <= 2'b10;
            place4 <= 2'b10; 
        end
        //position 5
        else if (p1_en[5] == 1'b1) begin 
            pos5 <= 2'b01;
            place5 <= 2'b01; 
        end
        else if (p2_en[5] == 1'b1) begin 
            pos5 <= 2'b10;
            place5 <= 2'b10; 
        end
        //position 6
         else if (p1_en[6] == 1'b1) begin 
            pos6 <= 2'b01;
            place6 <= 2'b01; 
        end
        else if (p2_en[6] == 1'b1) begin 
            pos6 <= 2'b10;
            place6 <= 2'b10; 
        end
        //position 7 
        else if (p1_en[7] == 1'b1) begin 
            pos7 <= 2'b01;
            place7 <= 2'b01; 
        end
        else if (p2_en[7] == 1'b1) begin 
            pos7 <= 2'b10;
            place7 <= 2'b10; 
        end
        //position 8 
        else if (p1_en[8] == 1'b1) begin 
            pos8 <= 2'b01;
            place8 <= 2'b01; 
        end
        else if (p2_en[8] == 1'b1) begin 
            pos8 <= 2'b10;
            place8 <= 2'b10; 
        end
        else begin 
            pos0 <= pos0;
            pos1 <= pos1;
            pos2 <= pos2;
            pos3 <= pos3;
            pos4 <= pos4;
            pos5 <= pos5;
            pos6 <= pos6;
            pos7 <= pos7;
            pos8 <= pos8;
            place0 <= place0;
            place1 <= place1;
            place2 <= place2;
            place3 <= place3;
            place4 <= place4;
            place5 <= place5;
            place6 <= place6;
            place7 <= place7;
            place8 <= place8; 
        end 
 end
endmodule
