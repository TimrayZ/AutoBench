`timescale 1ns / 1ps

module tb_top_module;
    reg [5:0] y;
    reg w;
    wire Y1;
    wire Y3;

    // Instantiate DUT
    top_module DUT (
        .y(y),
        .w(w),
        .Y1(Y1),
        .Y3(Y3)
    );

    // File handling
    integer file;
    
    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");

        // Scenario 1: Initialize state to A (y = 6'b000001), set w = 0
        y = 6'b000001; w = 0; #1;
        $fdisplay(file, "scenario: 1, y = %b, w = %b, Y1 = %b, Y3 = %b", y, w, Y1, Y3);

        // Scenario 2: Initialize state to A (y = 6'b000001), set w = 1
        w = 1; #1;
        $fdisplay(file, "scenario: 2, y = %b, w = %b, Y1 = %b, Y3 = %b", y, w, Y1, Y3);

        // Scenario 3: Initialize state to B (y = 6'b000010), set w = 0
        y = 6'b000010; w = 0; #1;
        $fdisplay(file, "scenario: 3, y = %b, w = %b, Y1 = %b, Y3 = %b", y, w, Y1, Y3);

        // Scenario 4: Initialize state to B (y = 6'b000010), set w = 1
        w = 1; #1;
        $fdisplay(file, "scenario: 4, y = %b, w = %b, Y1 = %b, Y3 = %b", y, w, Y1, Y3);

        // Scenario 5: Initialize state to C (y = 6'b000100), set w = 0
        y = 6'b000100; w = 0; #1;
        $fdisplay(file, "scenario: 5, y = %b, w = %b, Y1 = %b, Y3 = %b", y, w, Y1, Y3);

        // Scenario 6: Initialize state to C (y = 6'b000100), set w = 1
        w = 1; #1;
        $fdisplay(file, "scenario: 6, y = %b, w = %b, Y1 = %b, Y3 = %b", y, w, Y1, Y3);

        // Scenario 7: Initialize state to D (y = 6'b001000), set w = 0
        y = 6'b001000; w = 0; #1;
        $fdisplay(file, "scenario: 7, y = %b, w = %b, Y1 = %b, Y3 = %b", y, w, Y1, Y3);

        // Scenario 8: Initialize state to D (y = 6'b001000), set w = 1
        w = 1; #1;
        $fdisplay(file, "scenario: 8, y = %b, w = %b, Y1 = %b, Y3 = %b", y, w, Y1, Y3);

        // Scenario 9: Initialize state to E (y = 6'b010000), set w = 0
        y = 6'b010000; w = 0; #1;
        $fdisplay(file, "scenario: 9, y = %b, w = %b, Y1 = %b, Y3 = %b", y, w, Y1, Y3);

        // Scenario 10: Initialize state to E (y = 6'b010000), set w = 1
        w = 1; #1;
        $fdisplay(file, "scenario: 10, y = %b, w = %b, Y1 = %b, Y3 = %b", y, w, Y1, Y3);

        // Scenario 11: Initialize state to F (y = 6'b100000), set w = 0
        y = 6'b100000; w = 0; #1;
        $fdisplay(file, "scenario: 11, y = %b, w = %b, Y1 = %b, Y3 = %b", y, w, Y1, Y3);

        // Scenario 12: Initialize state to F (y = 6'b100000), set w = 1
        w = 1; #1;
        $fdisplay(file, "scenario: 12, y = %b, w = %b, Y1 = %b, Y3 = %b", y, w, Y1, Y3);

        // Close the output file
        $fclose(file);
        
        // End simulation
        $finish;
    end
endmodule
