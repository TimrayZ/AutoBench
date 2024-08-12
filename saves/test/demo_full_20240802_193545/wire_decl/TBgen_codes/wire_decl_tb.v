`timescale 1ns / 1ps

module tb_top_module;

    // DUT inputs
    reg a;
    reg b;
    reg c;
    reg d;

    // DUT outputs
    wire out;
    wire out_n;

    // Instantiate the DUT
    top_module uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .out(out),
        .out_n(out_n)
    );

    // File descriptor for output
    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        a = 0; b = 0; c = 0; d = 0; #10;
        $fdisplay(file, "scenario: 1, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10; // hold for 10 clock cycles

        // Scenario 2
        a = 0; b = 0; c = 0; d = 1; #10;
        $fdisplay(file, "scenario: 2, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10;

        // Scenario 3
        a = 0; b = 0; c = 1; d = 0; #10;
        $fdisplay(file, "scenario: 3, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10;

        // Scenario 4
        a = 0; b = 0; c = 1; d = 1; #10;
        $fdisplay(file, "scenario: 4, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10;

        // Scenario 5
        a = 0; b = 1; c = 0; d = 0; #10;
        $fdisplay(file, "scenario: 5, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10;

        // Scenario 6
        a = 0; b = 1; c = 0; d = 1; #10;
        $fdisplay(file, "scenario: 6, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10;

        // Scenario 7
        a = 0; b = 1; c = 1; d = 0; #10;
        $fdisplay(file, "scenario: 7, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10;

        // Scenario 8
        a = 0; b = 1; c = 1; d = 1; #10;
        $fdisplay(file, "scenario: 8, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10;

        // Scenario 9
        a = 1; b = 0; c = 0; d = 0; #10;
        $fdisplay(file, "scenario: 9, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10;

        // Scenario 10
        a = 1; b = 0; c = 0; d = 1; #10;
        $fdisplay(file, "scenario: 10, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10;

        // Scenario 11
        a = 1; b = 0; c = 1; d = 0; #10;
        $fdisplay(file, "scenario: 11, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10;

        // Scenario 12
        a = 1; b = 0; c = 1; d = 1; #10;
        $fdisplay(file, "scenario: 12, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10;

        // Scenario 13
        a = 1; b = 1; c = 0; d = 0; #10;
        $fdisplay(file, "scenario: 13, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10;

        // Scenario 14
        a = 1; b = 1; c = 0; d = 1; #10;
        $fdisplay(file, "scenario: 14, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10;

        // Scenario 15
        a = 1; b = 1; c = 1; d = 0; #10;
        $fdisplay(file, "scenario: 15, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10;

        // Scenario 16
        a = 1; b = 1; c = 1; d = 1; #10;
        $fdisplay(file, "scenario: 16, a = %d, b = %d, c = %d, d = %d, out = %d, out_n = %d", a, b, c, d, out, out_n);
        repeat(9) #10;

        // Close the output file
        $fclose(file);
    end
endmodule
