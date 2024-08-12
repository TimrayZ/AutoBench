`timescale 1ns / 1ps

module tb_top_module;
    // Testbench signals
    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] s;
    wire overflow;

    // Instantiate the Device Under Test (DUT)
    top_module DUT (
        .a(a),
        .b(b),
        .s(s),
        .overflow(overflow)
    );

    // File descriptor for exporting signals
    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        a = 8'b00001111; // 15
        b = 8'b00000001; // 1
        #1; // Wait for 1 clock cycle
        $fdisplay(file, "scenario: 1, a = %d, b = %d, s = %d, overflow = %d", a, b, s, overflow);

        // Scenario 2
        a = 8'b01111111; // 127
        b = 8'b00000001; // 1
        #1; // Wait for 1 clock cycle
        $fdisplay(file, "scenario: 2, a = %d, b = %d, s = %d, overflow = %d", a, b, s, overflow);

        // Scenario 3
        a = 8'b10000000; // -128
        b = 8'b11111111; // -1
        #1; // Wait for 1 clock cycle
        $fdisplay(file, "scenario: 3, a = %d, b = %d, s = %d, overflow = %d", a, b, s, overflow);

        // Scenario 4
        a = 8'b01111110; // 126
        b = 8'b00000010; // 2
        #1; // Wait for 1 clock cycle
        $fdisplay(file, "scenario: 4, a = %d, b = %d, s = %d, overflow = %d", a, b, s, overflow);

        // Scenario 5
        a = 8'b01111111; // 127
        b = 8'b11111111; // -1
        #1; // Wait for 1 clock cycle
        $fdisplay(file, "scenario: 5, a = %d, b = %d, s = %d, overflow = %d", a, b, s, overflow);

        // Scenario 6
        a = 8'b10000001; // -127
        b = 8'b10000001; // -127
        #1; // Wait for 1 clock cycle
        $fdisplay(file, "scenario: 6, a = %d, b = %d, s = %d, overflow = %d", a, b, s, overflow);

        // Scenario 7
        a = 8'b10101010; // -86
        b = 8'b10101010; // -86
        #1; // Wait for 1 clock cycle
        $fdisplay(file, "scenario: 7, a = %d, b = %d, s = %d, overflow = %d", a, b, s, overflow);

        // Scenario 8
        a = 8'b00000000; // 0
        b = 8'b00000000; // 0
        #1; // Wait for 1 clock cycle
        $fdisplay(file, "scenario: 8, a = %d, b = %d, s = %d, overflow = %d", a, b, s, overflow);

        // Scenario 9
        a = 8'b11111111; // -1
        b = 8'b11111111; // -1
        #1; // Wait for 1 clock cycle
        $fdisplay(file, "scenario: 9, a = %d, b = %d, s = %d, overflow = %d", a, b, s, overflow);

        // Scenario 10
        a = 8'b00111100; // 60
        b = 8'b11001100; // -52
        #1; // Wait for 1 clock cycle
        $fdisplay(file, "scenario: 10, a = %d, b = %d, s = %d, overflow = %d", a, b, s, overflow);

        // Close the output file
        $fclose(file);

        // End simulation
        $finish;
    end
endmodule
