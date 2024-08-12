`timescale 1ns/1ps

module tb_top_module;

    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg [7:0] c;
    reg [7:0] d;

    // Outputs
    wire [7:0] min;

    // Instantiate the DUT
    top_module uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .min(min)
    );

    // File handle
    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        a = 8'h00; b = 8'h10; c = 8'h20; d = 8'h30;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 1, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 2
        a = 8'hFF; b = 8'hFF; c = 8'hFF; d = 8'hFF;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 2, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 3
        a = 8'h05; b = 8'h03; c = 8'h02; d = 8'h01;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 3, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 4
        a = 8'hAA; b = 8'h55; c = 8'h77; d = 8'h99;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 4, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 5
        a = 8'h10; b = 8'h20; c = 8'h30; d = 8'h00;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 5, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 6
        a = 8'h0F; b = 8'h1F; c = 8'h2F; d = 8'h00; // Ensure d is assigned as per the checklist
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 6, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 7
        a = 8'hFF; b = 8'h01; c = 8'hFE; d = 8'h02;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 7, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Scenario 8
        a = 8'h12; b = 8'h12; c = 8'h12; d = 8'h12;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 8, a = %d, b = %d, c = %d, d = %d, min = %d", a, b, c, d, min);

        // Close the file
        $fclose(file);
        
        // End simulation
        $finish;
    end

endmodule
