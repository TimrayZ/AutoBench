`timescale 1ns / 1ps

module tb_top_module;

    // Inputs
    reg a;
    reg b;
    reg c;
    reg d;

    // Outputs
    wire out;

    // Instantiate the DUT
    top_module DUT (
        .a(a), 
        .b(b), 
        .c(c), 
        .d(d), 
        .out(out)
    );

    // File descriptor for output
    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        a = 0; b = 0; c = 0; d = 0; 
        #0; // Wait for 0 time unit, C0
        $fdisplay(file, "scenario: 1, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        #1; // Wait for 1 time unit

        // Scenario 2
        a = 0; b = 0; c = 0; d = 1; 
        #1; // Wait for 1 time unit, C1
        $fdisplay(file, "scenario: 2, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Scenario 3
        a = 0; b = 0; c = 1; d = 0; 
        #1; // Wait for 1 time unit, C2
        $fdisplay(file, "scenario: 3, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Scenario 4
        a = 0; b = 0; c = 1; d = 1; 
        #1; // Wait for 1 time unit, C3
        $fdisplay(file, "scenario: 4, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Scenario 5
        a = 0; b = 1; c = 0; d = 0; 
        #1; // Wait for 1 time unit, C4
        $fdisplay(file, "scenario: 5, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Scenario 6
        a = 0; b = 1; c = 0; d = 1; 
        #1; // Wait for 1 time unit, C5
        $fdisplay(file, "scenario: 6, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Scenario 7
        a = 0; b = 1; c = 1; d = 0; 
        #1; // Wait for 1 time unit, C6
        $fdisplay(file, "scenario: 7, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Scenario 8
        a = 0; b = 1; c = 1; d = 1; 
        #1; // Wait for 1 time unit, C7
        $fdisplay(file, "scenario: 8, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Scenario 9
        a = 1; b = 0; c = 0; d = 0; 
        #1; // Wait for 1 time unit, C8
        $fdisplay(file, "scenario: 9, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Scenario 10
        a = 1; b = 0; c = 0; d = 1; 
        #1; // Wait for 1 time unit, C9
        $fdisplay(file, "scenario: 10, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Scenario 11
        a = 1; b = 0; c = 1; d = 0; 
        #1; // Wait for 1 time unit, C10
        $fdisplay(file, "scenario: 11, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Scenario 12
        a = 1; b = 0; c = 1; d = 1; 
        #1; // Wait for 1 time unit, C11
        $fdisplay(file, "scenario: 12, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Scenario 13
        a = 1; b = 1; c = 0; d = 0; 
        #1; // Wait for 1 time unit, C12
        $fdisplay(file, "scenario: 13, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Scenario 14
        a = 1; b = 1; c = 0; d = 1; 
        #1; // Wait for 1 time unit, C13
        $fdisplay(file, "scenario: 14, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Scenario 15
        a = 1; b = 1; c = 1; d = 0; 
        #1; // Wait for 1 time unit, C14
        $fdisplay(file, "scenario: 15, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Scenario 16
        a = 1; b = 1; c = 1; d = 1; 
        #1; // Wait for 1 time unit, C15
        $fdisplay(file, "scenario: 16, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        
        // Close the output file
        $fclose(file);
        $finish; // End of simulation
    end

endmodule
