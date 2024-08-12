`timescale 1ns / 1ps

module tb_top_module;

    // Inputs
    reg do_sub;
    reg [7:0] a;
    reg [7:0] b;

    // Outputs
    wire [7:0] out;
    wire result_is_zero;

    // Instantiate the DUT
    top_module DUT (
        .do_sub(do_sub),
        .a(a),
        .b(b),
        .out(out),
        .result_is_zero(result_is_zero)
    );

    // File for output signals
    integer file;

    initial begin
        // Open the file
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        do_sub = 0; a = 8'h01; b = 8'h01;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 1, do_sub = %d, a = %d, b = %d, out = %d, result_is_zero = %d", do_sub, a, b, out, result_is_zero);

        // Scenario 2
        do_sub = 0; a = 8'hFF; b = 8'h01;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 2, do_sub = %d, a = %d, b = %d, out = %d, result_is_zero = %d", do_sub, a, b, out, result_is_zero);

        // Scenario 3
        do_sub = 0; a = 8'h00; b = 8'h00;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 3, do_sub = %d, a = %d, b = %d, out = %d, result_is_zero = %d", do_sub, a, b, out, result_is_zero);

        // Scenario 4
        do_sub = 1; a = 8'h02; b = 8'h01;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 4, do_sub = %d, a = %d, b = %d, out = %d, result_is_zero = %d", do_sub, a, b, out, result_is_zero);

        // Scenario 5
        do_sub = 1; a = 8'h01; b = 8'hFF;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 5, do_sub = %d, a = %d, b = %d, out = %d, result_is_zero = %d", do_sub, a, b, out, result_is_zero);

        // Scenario 6
        do_sub = 1; a = 8'h00; b = 8'h00;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 6, do_sub = %d, a = %d, b = %d, out = %d, result_is_zero = %d", do_sub, a, b, out, result_is_zero);

        // Scenario 7
        do_sub = 0; a = 8'h7F; b = 8'h80;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 7, do_sub = %d, a = %d, b = %d, out = %d, result_is_zero = %d", do_sub, a, b, out, result_is_zero);

        // Scenario 8
        do_sub = 1; a = 8'h80; b = 8'h7F;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 8, do_sub = %d, a = %d, b = %d, out = %d, result_is_zero = %d", do_sub, a, b, out, result_is_zero);

        // Scenario 9
        do_sub = 0; a = 8'hAA; b = 8'h55;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 9, do_sub = %d, a = %d, b = %d, out = %d, result_is_zero = %d", do_sub, a, b, out, result_is_zero);

        // Scenario 10
        do_sub = 1; a = 8'h55; b = 8'hAA;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 10, do_sub = %d, a = %d, b = %d, out = %d, result_is_zero = %d", do_sub, a, b, out, result_is_zero);

        // Close the file
        $fclose(file);
        $finish; // End simulation
    end

endmodule
