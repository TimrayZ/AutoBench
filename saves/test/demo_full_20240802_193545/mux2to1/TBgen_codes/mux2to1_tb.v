`timescale 1ns / 1ps

module tb_top_module;

    reg a;
    reg b;
    reg sel;
    wire out;

    // Instance of the Device Under Test (DUT)
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
        a = 0; b = 0; sel = 0; 
        #1; 
        $fdisplay(file, "scenario: 1, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);

        // Scenario 2
        a = 0; b = 1; sel = 0; 
        #1; 
        $fdisplay(file, "scenario: 2, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);

        // Scenario 3
        a = 1; b = 0; sel = 0; 
        #1; 
        $fdisplay(file, "scenario: 3, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);

        // Scenario 4
        a = 1; b = 1; sel = 0; 
        #1; 
        $fdisplay(file, "scenario: 4, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);

        // Scenario 5
        a = 0; b = 0; sel = 1; 
        #1; 
        $fdisplay(file, "scenario: 5, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);

        // Scenario 6
        a = 0; b = 1; sel = 1; 
        #1; 
        $fdisplay(file, "scenario: 6, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);

        // Scenario 7
        a = 1; b = 0; sel = 1; 
        #1; 
        $fdisplay(file, "scenario: 7, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);

        // Scenario 8
        a = 1; b = 1; sel = 1; 
        #1; 
        $fdisplay(file, "scenario: 8, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);

        // Scenario 9
        a = 0; b = 0; 
        sel = 0; 
        repeat (4) begin
            #1;
            $fdisplay(file, "scenario: 9, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);
            sel = ~sel;
        end

        // Scenario 10
        repeat (4) begin
            a = $urandom_range(0, 1);
            b = $urandom_range(0, 1);
            sel = 0;
            #1;
            $fdisplay(file, "scenario: 10, a = %d, b = %d, sel = %d, out = %d", a, b, sel, out);
            sel = ~sel;
        end

        // Close the output file
        $fclose(file);
        $finish;
    end

endmodule
