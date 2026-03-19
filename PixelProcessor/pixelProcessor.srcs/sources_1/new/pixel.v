`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2026 02:06:27 AM
// Design Name: 
// Module Name: pixel_proc
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


module pixel_proc (
    input wire clk,
    input wire reset,
    input wire [7:0] r_in,
    input wire [7:0] g_in,
    input wire [7:0] b_in,
    output reg [7:0] gray_out
);
    reg [7:0] r_s1, g_s1, b_s1;
    reg [9:0] sum_s2;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            r_s1 <= 8'd0; g_s1 <= 8'd0; b_s1 <= 8'd0;
            sum_s2 <= 10'd0;
            gray_out <= 8'd0;
        end else begin
            // Stage 1: Capturarea datelor de intrare
            r_s1 <= r_in;
            g_s1 <= g_in;
            b_s1 <= b_in;

            // Stage 2: Calculul sumei
            sum_s2 <= r_s1 + g_s1 + b_s1;

            // Stage 3: Media
            gray_out <= sum_s2 >> 2;
        end
    end
endmodule
