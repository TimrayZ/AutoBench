`timescale 1ns / 1ps

module tb_top_module;

    // Parameters
    reg [6:1] y;  // Input to DUT
    reg w;        // Input to DUT
    wire Y2;     // Output from DUT
    wire Y4;     // Output from DUT

    // Instantiate the DUT
    top_module dut (
        .y(y),
        .w(w),
        .Y2(Y2),
        .Y4(Y4)
    );

    // File handling
    integer file;

    initial begin
        // Open file for writing
        file = $fopen("TBout.txt", "w");

        // Scenario 1: Reset the DUT to state A at time 0.
        y = 6'b000001; 
        w = 0; 
        #10;
        $fdisplay(file, "scenario: 1, y = %b, w = %b, Y2 = %b, Y4 = %b", y, w, Y2, Y4);
        
        // Scenario 2: Apply input w = 1 while remaining in state A.
        w = 1; 
        #10; 
        $fdisplay(file, "scenario: 2, y = %b, w = %b, Y2 = %b, Y4 = %b", y, w, Y2, Y4);
        
        // Scenario 3: Apply input w = 0 while in state A to transition to B.
        w = 0; 
        #10; 
        y = 6'b000010; // Set to state B
        $fdisplay(file, "scenario: 3, y = %b, w = %b, Y2 = %b, Y4 = %b", y, w, Y2, Y4);
        
        // Scenario 4: In state B, apply w = 0 to transition to C.
        w = 0; 
        #10; 
        y = 6'b000100; // Set to state C
        $fdisplay(file, "scenario: 4, y = %b, w = %b, Y2 = %b, Y4 = %b", y, w, Y2, Y4);
        
        // Scenario 5: In state B, apply w = 1 to transition to D.
        w = 1; 
        #10; 
        y = 6'b001000; // Set to state D
        $fdisplay(file, "scenario: 5, y = %b, w = %b, Y2 = %b, Y4 = %b", y, w, Y2, Y4);

        // Setup for next scenarios
        y = 6'b000100; // Set to state C

        // Scenario 6: In state C, apply w = 0 to transition to E.
        w = 0; 
        #10; 
        y = 6'b010000; // Set to state E
        $fdisplay(file, "scenario: 6, y = %b, w = %b, Y2 = %b, Y4 = %b", y, w, Y2, Y4);

        // Scenario 7: In state C, apply w = 1 to observe transition to D.
        w = 1; 
        #10; 
        y = 6'b001000; // Set to state D
        $fdisplay(file, "scenario: 7, y = %b, w = %b, Y2 = %b, Y4 = %b", y, w, Y2, Y4);

        // Setup for next scenarios
        y = 6'b001000; // Set to state D

        // Scenario 8: In state D, apply w = 0 to transition to F.
        w = 0; 
        #10; 
        y = 6'b100000; // Set to state F
        $fdisplay(file, "scenario: 8, y = %b, w = %b, Y2 = %b, Y4 = %b", y, w, Y2, Y4);

        // Scenario 9: In state D, apply w = 1 to transition back to A.
        w = 1; 
        #10; 
        y = 6'b000001; // Set to state A
        $fdisplay(file, "scenario: 9, y = %b, w = %b, Y2 = %b, Y4 = %b", y, w, Y2, Y4);

        // Setup for next scenarios
        y = 6'b010000; // Set to state E

        // Scenario 10: In state E, apply w = 0 to remain in E.
        w = 0; 
        #10; 
        $fdisplay(file, "scenario: 10, y = %b, w = %b, Y2 = %b, Y4 = %b", y, w, Y2, Y4);

        // Scenario 11: In state E, apply w = 1 to transition to D.
        w = 1; 
        #10; 
        y = 6'b001000; // Set to state D
        $fdisplay(file, "scenario: 11, y = %b, w = %b, Y2 = %b, Y4 = %b", y, w, Y2, Y4);

        // Setup for next scenarios
        y = 6'b100000; // Set to state F

        // Scenario 12: In state F, apply w = 0 to transition to C.
        w = 0; 
        #10; 
        y = 6'b000100; // Set to state C
        $fdisplay(file, "scenario: 12, y = %b, w = %b, Y2 = %b, Y4 = %b", y, w, Y2, Y4);

        // Scenario 13: In state F, apply w = 1 to transition to D.
        w = 1; 
        #10; 
        y = 6'b001000; // Set to state D
        $fdisplay(file, "scenario: 13, y = %b, w = %b, Y2 = %b, Y4 = %b", y, w, Y2, Y4);

        // Close the file
        $fclose(file);
        $finish;
    end

endmodule
