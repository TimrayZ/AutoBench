`timescale 1ns / 1ps

module tb_top_module;

    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg [7:0] c;
    reg [7:0] d;

    // Outputs
    wire [7:0] min;

    // Instantiate the Device Under Test (DUT)
    top_module dut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .min(min)
    );

    // File for output
    integer file;

    initial begin
        // Open file for writing
        file = $fopen("TBout.txt", "w");
        
        // Scenario 1
        a = 8'h03; b = 8'h05; c = 8'h02; d = 8'h04;
        #1;
        $fdisplay(file, "scenario: 1, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 2
        a = 8'h00; b = 8'h00; c = 8'h00; d = 8'h00;
        #1;
        $fdisplay(file, "scenario: 2, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 3
        a = 8'hFF; b = 8'h7F; c = 8'h80; d = 8'h01;
        #1;
        $fdisplay(file, "scenario: 3, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 4
        a = 8'h10; b = 8'h20; c = 8'h30; d = 8'h40;
        #1;
        $fdisplay(file, "scenario: 4, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 5
        a = 8'h99; b = 8'hAA; c = 8'h88; d = 8'h77;
        #1;
        $fdisplay(file, "scenario: 5, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 6
        a = 8'h01; b = 8'h02; c = 8'h03; d = 8'h04;
        #1;
        $fdisplay(file, "scenario: 6, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 7
        a = 8'h04; b = 8'h01; c = 8'h02; d = 8'h03;
        #1;
        $fdisplay(file, "scenario: 7, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 8
        a = 8'h80; b = 8'h40; c = 8'h20; d = 8'h10;
        #1;
        $fdisplay(file, "scenario: 8, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 9
        a = 8'hFE; b = 8'hFD; c = 8'hFC; d = 8'hFB;
        #1;
        $fdisplay(file, "scenario: 9, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 10
        a = 8'h5A; b = 8'hA5; c = 8'h5F; d = 8'hA0;
        #1;
        $fdisplay(file, "scenario: 10, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Close file
        $fclose(file);
        
        // End simulation
        $finish;
    end

endmodule
