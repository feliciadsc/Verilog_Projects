`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2026 02:09:19 AM
// Design Name: 
// Module Name: pixel_proc_tb
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


module pixel_proc_tb();

    // Semnale pentru conectarea la modul
    reg clk;
    reg reset;
    reg [7:0] r_in, g_in, b_in;
    wire [7:0] gray_out;

    // Instantierea modulului (Unit Under Test - UUT)
    pixel_proc uut (
        .clk(clk),
        .reset(reset),
        .r_in(r_in),
        .g_in(g_in),
        .b_in(b_in),
        .gray_out(gray_out)
    );

    // Generarea ceasului: Perioada de 10ns
    always #5 clk = ~clk;

    initial begin
        // Initializare
        clk = 0;
        reset = 1;
        r_in = 0; g_in = 0; b_in = 0;

        // Eliberam reset-ul dupa 20ns
        #20 reset = 0;

        // Trimitem valori de test
        #10 r_in = 8'd255; g_in = 8'd255; b_in = 8'd255;
        
        // Pixel 2: Rosu pur (255, 0, 0) -> Rezultat asteptat: 63
        #10 r_in = 8'd255; g_in = 8'd0;   b_in = 8'd0;
        
        // Pixel 3: Verde (0, 255, 0) -> -> Rezultat asteptat: 63
        #10 r_in = 8'd0;   g_in = 8'd255; b_in = 8'd0;

        // Golim datele de intrare ca sa vedem golirea pipeline-ului
        #10 r_in = 0; g_in = 0; b_in = 0;
        
        #50 $stop; // Oprim simularea
    end
endmodule
