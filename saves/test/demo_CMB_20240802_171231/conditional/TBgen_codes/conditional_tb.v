`timescale 1ns/1ps

module testbench;
    reg [7:0] a, b, c, d;
    wire [7:0] min;
    integer file;

    top_module DUT(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .min(min)
    );

    initial begin
        // Open file to record the test outputs
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        a = 100; b = 100; c = 100; d = 100;
        #10 $fdisplay(file, "scenario: 1, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 2
        a = 200; b = 200; c = 50; d = 200;
        #10 $fdisplay(file, "scenario: 2, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 3
        a = 255; b = 255; c = 255; d = 0;
        #10 $fdisplay(file, "scenario: 3, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 4
        a = 0; b = 100; c = 100; d = 100;
        #10 $fdisplay(file, "scenario: 4, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 5
        a = 240; b = 180; c = 120; d = 60;
        #10 $fdisplay(file, "scenario: 5, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 6
        a = 50; b = 100; c = 150; d = 200;
        #10 $fdisplay(file, "scenario: 6, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 7
        a = 130; b = 85; c = 160; d = 90;
        #10 $fdisplay(file, "scenario: 7, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 8
        a = 75; b = 30; c = 30; d = 100;
        #10 $fdisplay(file, "scenario: 8, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 9
        a = 0; b = 0; c = 0; d = 0;
        #10 $fdisplay(file, "scenario: 9, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 10
        a = 150; b = 25; c = 180; d = 255;
        #10 $fdisplay(file, "scenario: 10, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        $fclose(file);
        $finish;
    end
endmodule
