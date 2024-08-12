`timescale 1ns/1ps

module tb_top_module;

    // Inputs
    reg a;
    reg b;
    reg sel_b1;
    reg sel_b2;

    // Outputs
    wire out_assign;
    wire out_always;

    // Instantiate the DUT
    top_module DUT (
        .a(a),
        .b(b),
        .sel_b1(sel_b1),
        .sel_b2(sel_b2),
        .out_assign(out_assign),
        .out_always(out_always)
    );

    // File to save output
    integer file;

    initial begin
        // Open the file 
        file = $fopen("TBout.txt", "w");

        // Test scenarios
        // Scenario 1
        a = 0; b = 0; sel_b1 = 0; sel_b2 = 0;
        #1; // Wait for 1 time unit
        $fdisplay(file, "scenario: 1, a = %d, b = %d, sel_b1 = %d, sel_b2 = %d, out_assign = %d, out_always = %d", a, b, sel_b1, sel_b2, out_assign, out_always);

        // Scenario 2
        a = 1; b = 0; sel_b1 = 0; sel_b2 = 0;
        #1;
        $fdisplay(file, "scenario: 2, a = %d, b = %d, sel_b1 = %d, sel_b2 = %d, out_assign = %d, out_always = %d", a, b, sel_b1, sel_b2, out_assign, out_always);

        // Scenario 3
        a = 0; b = 1; sel_b1 = 0; sel_b2 = 0;
        #1;
        $fdisplay(file, "scenario: 3, a = %d, b = %d, sel_b1 = %d, sel_b2 = %d, out_assign = %d, out_always = %d", a, b, sel_b1, sel_b2, out_assign, out_always);

        // Scenario 4
        a = 0; b = 0; sel_b1 = 1; sel_b2 = 0;
        #1;
        $fdisplay(file, "scenario: 4, a = %d, b = %d, sel_b1 = %d, sel_b2 = %d, out_assign = %d, out_always = %d", a, b, sel_b1, sel_b2, out_assign, out_always);

        // Scenario 5
        a = 0; b = 0; sel_b1 = 0; sel_b2 = 1;
        #1;
        $fdisplay(file, "scenario: 5, a = %d, b = %d, sel_b1 = %d, sel_b2 = %d, out_assign = %d, out_always = %d", a, b, sel_b1, sel_b2, out_assign, out_always);

        // Scenario 6
        a = 1; b = 1; sel_b1 = 1; sel_b2 = 1;
        #1;
        $fdisplay(file, "scenario: 6, a = %d, b = %d, sel_b1 = %d, sel_b2 = %d, out_assign = %d, out_always = %d", a, b, sel_b1, sel_b2, out_assign, out_always);

        // Scenario 7
        a = 1; b = 0; sel_b1 = 1; sel_b2 = 1;
        #1;
        $fdisplay(file, "scenario: 7, a = %d, b = %d, sel_b1 = %d, sel_b2 = %d, out_assign = %d, out_always = %d", a, b, sel_b1, sel_b2, out_assign, out_always);

        // Scenario 8
        a = 0; b = 1; sel_b1 = 1; sel_b2 = 1;
        #1;
        $fdisplay(file, "scenario: 8, a = %d, b = %d, sel_b1 = %d, sel_b2 = %d, out_assign = %d, out_always = %d", a, b, sel_b1, sel_b2, out_assign, out_always);

        // Scenario 9
        a = 1; b = 1; sel_b1 = 0; sel_b2 = 0;
        #1;
        $fdisplay(file, "scenario: 9, a = %d, b = %d, sel_b1 = %d, sel_b2 = %d, out_assign = %d, out_always = %d", a, b, sel_b1, sel_b2, out_assign, out_always);

        // Scenario 10
        a = 1; b = 0; sel_b1 = 0; sel_b2 = 1;
        #1;
        $fdisplay(file, "scenario: 10, a = %d, b = %d, sel_b1 = %d, sel_b2 = %d, out_assign = %d, out_always = %d", a, b, sel_b1, sel_b2, out_assign, out_always);

        // Close the file
        $fclose(file);
        $finish;
    end

endmodule
