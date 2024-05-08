`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2021 01:32:10 PM
// Design Name: 
// Module Name: fsm_turns
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


module fsm_turns(
    input clk,
    input reset,
    input p1,
    input p2,
    input move_check,
    input no_space,
    input winner,
    output reg p1_en,
    output reg p2_en
    );
    
    localparam IDLE = 2'b00, 
               Player1 = 2'b01,
               Player2 = 2'b10,
               GAME_OVER = 2'b11;
               
    reg [1:0]current_state, next_state; 
    
    always @(posedge clk, posedge reset) begin
        if (reset)
            current_state <= IDLE; 
        else
            current_state <= next_state; 
    end
    
    always @(*) begin 
        case(current_state)
        IDLE: begin
            if (reset == 1'b0 && p1 == 1'b1) begin
                next_state <= Player1;
            end
            else begin 
                next_state <= IDLE;
            end
            p1_en <= 1'b0;
            p2_en <= 1'b0; 
        end 
        
        Player1: begin 
            p1_en <= 1'b1;
            p2_en <= 1'b0; 
            if (move_check == 1'b0) begin 
                next_state <= Player2; 
            end
            else begin 
                next_state <= IDLE; 
            end
        end
        Player2: begin 
            p1_en <= 1'b0;
            p2_en <= 1'b1; 
            if (move_check == 1'b1) begin 
                next_state <= Player2; 
            end
            else if (winner == 1'b0 && no_space == 1'b0) begin
                next_state <= IDLE;
            end
            else if (no_space || winner) begin
                next_state <= GAME_OVER;
                p2_en <= 1'b1; 
            end     
        end
        GAME_OVER: begin
            p1_en <= 1'b0;
            p2_en <= 1'b0;
            if (reset) 
                next_state <= IDLE; 
            else
                next_state <= GAME_OVER; 
        end
        default: next_state <= IDLE;
        endcase   
    end
    
endmodule
