`timescale 1ns / 1ps

module tb_top_module;

    // Inputs
    reg a;
    reg b;
    reg c;
    reg d;
    reg e;

    // Outputs
    wire [24:0] out;

    // Instantiate the DUT
    top_module dut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .out(out)
    );

    integer file;

    // Open the output file
    initial begin
        file = $fopen("TBout.txt", "w");
    end

    // Test scenarios
    initial begin
        // Scenario 1
        a = 0; b = 0; c = 0; d = 0; e = 0;
        #1;
        $fdisplay(file, "scenario: 1, a = %d, b = %d, c = %d, d = %d, e = %d, out = %b", a, b, c, d, e, out);

        // Scenario 2
        a = 1; b = 1; c = 1; d = 1; e = 1;
        #1;
        $fdisplay(file, "scenario: 2, a = %d, b = %d, c = %d, d = %d, e = %d, out = %b", a, b, c, d, e, out);

        // Scenario 3
        a = 1; b = 0; c = 1; d = 0; e = 1;
        #1;
        $fdisplay(file, "scenario: 3, a = %d, b = %d, c = %d, d = %d, e = %d, out = %b", a, b, c, d, e, out);

        // Scenario 4
        a = 0; b = 1; c = 0; d = 1; e = 0;
        #1;
        $fdisplay(file, "scenario: 4, a = %d, b = %d, c = %d, d = %d, e = %d, out = %b", a, b, c, d, e, out);

        // Scenario 5
        a = 0; b = 0; c = 1; d = 1; e = 0;
        #1;
        $fdisplay(file, "scenario: 5, a = %d, b = %d, c = %d, d = %d, e = %d, out = %b", a, b, c, d, e, out);

        // Scenario 6
        a = 0; b = 1; c = 1; d = 0; e = 1;
        #1;
        $fdisplay(file, "scenario: 6, a = %d, b = %d, c = %d, d = %d, e = %d, out = %b", a, b, c, d, e, out);

        // Scenario 7
        a = 1; b = 1; c = 0; d = 0; e = 1;
        #1;
        $fdisplay(file, "scenario: 7, a = %d, b = %d, c = %d, d = %d, e = %d, out = %b", a, b, c, d, e, out);

        // Scenario 8
        a = 1; b = 1; c = 1; d = 0; e = 0;
        #1;
        $fdisplay(file, "scenario: 8, a = %d, b = %d, c = %d, d = %d, e = %d, out = %b", a, b, c, d, e, out);

        // Scenario 9 (Random values)
        a = 1; b = 0; c = 0; d = 1; e = 0;
        #1;
        $fdisplay(file, "scenario: 9, a = %d, b = %d, c = %d, d = %d, e = %d, out = %b", a, b, c, d, e, out);

        // Scenario 10 (Random values)
        a = 0; b = 0; c = 1; d = 1; e = 1;
        #1;
        $fdisplay(file, "scenario: 10, a = %d, b = %d, c = %d, d = %d, e = %d, out = %b", a, b, c, d, e, out);
        
        // Close the output file
        $fclose(file);
        
        // End simulation
        $finish;
    end

endmodule
