`timescale 1ns / 1ps

module tb_top_module;

    reg [99:0] a;
    reg [99:0] b;
    reg sel;
    wire [99:0] out;

    // Instantiate the DUT
    top_module DUT (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        a = 100'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
        b = 100'b1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111;
        sel = 0;
        #10; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 1, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);
        
        // Scenario 2
        a = 100'b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010;
        b = 100'b0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101;
        sel = 1;
        #10; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 2, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);
        
        // Scenario 3
        a = 100'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001;
        b = 100'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
        sel = 0;
        #10; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 3, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);

        // Scenario 4
        a = 100'b1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111;
        b = 100'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
        sel = 1;
        #10; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 4, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);
        
        // Scenario 5
        a = 100'b0011001100110011001100110011001100110011001100110011001100110011001100110011001100110011001100110011;
        b = 100'b1100110011001100110011001100110011001100110011001100110011001100110011001100110011001100110011001100;
        sel = 0;
        #10; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 5a, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);
        sel = 1;
        #10; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 5b, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);

        // Scenario 6
        a = 100'b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010;
        b = 100'b0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101;
        sel = 0;
        #10; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 6a, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);
        sel = 1;
        #10; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 6b, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);

        // Close the output file
        $fclose(file);
        
        $finish;
    end

endmodule
