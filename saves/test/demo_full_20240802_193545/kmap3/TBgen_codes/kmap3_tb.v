`timescale 1ns / 1ps

module tb_top_module;

    // Input signals
    reg a;
    reg b;
    reg c;
    reg d;

    // Output signal
    wire out;

    // Instantiate the DUT
    top_module DUT (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .out(out)
    );

    // File descriptor for output
    integer outfile;

    initial begin
        // Open the output file
        outfile = $fopen("TBout.txt", "w");

        // Scenario 1
        a = 0; b = 0; c = 0; d = 0; 
        #10; 
        $fdisplay(outfile, "scenario: 1, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Scenario 2
        a = 0; b = 0; c = 0; d = 1; 
        #10; 
        $fdisplay(outfile, "scenario: 2, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        
        // Scenario 3
        a = 0; b = 0; c = 1; d = 0; 
        #10; 
        $fdisplay(outfile, "scenario: 3, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        
        // Scenario 4
        a = 0; b = 0; c = 1; d = 1; 
        #10; 
        $fdisplay(outfile, "scenario: 4, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        
        // Scenario 5
        a = 0; b = 1; c = 0; d = 0; 
        #10; 
        $fdisplay(outfile, "scenario: 5, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        
        // Scenario 6
        a = 0; b = 1; c = 0; d = 1; 
        #10; 
        $fdisplay(outfile, "scenario: 6, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        
        // Scenario 7
        a = 0; b = 1; c = 1; d = 0; 
        #10; 
        $fdisplay(outfile, "scenario: 7, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        
        // Scenario 8
        a = 0; b = 1; c = 1; d = 1; 
        #10; 
        $fdisplay(outfile, "scenario: 8, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        
        // Scenario 9
        a = 1; b = 1; c = 0; d = 0; 
        #10; 
        $fdisplay(outfile, "scenario: 9, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        
        // Scenario 10
        a = 1; b = 1; c = 0; d = 1; 
        #10; 
        $fdisplay(outfile, "scenario: 10, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        
        // Scenario 11
        a = 1; b = 1; c = 1; d = 0; 
        #10; 
        $fdisplay(outfile, "scenario: 11, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        
        // Scenario 12
        a = 1; b = 1; c = 1; d = 1; 
        #10; 
        $fdisplay(outfile, "scenario: 12, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        
        // Scenario 13
        a = 1; b = 0; c = 0; d = 0; 
        #10; 
        $fdisplay(outfile, "scenario: 13, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        
        // Scenario 14
        a = 1; b = 0; c = 0; d = 1; 
        #10; 
        $fdisplay(outfile, "scenario: 14, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        
        // Scenario 15
        a = 1; b = 0; c = 1; d = 0; 
        #10; 
        $fdisplay(outfile, "scenario: 15, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);
        
        // Scenario 16
        a = 1; b = 0; c = 1; d = 1; 
        #10; 
        $fdisplay(outfile, "scenario: 16, a = %d, b = %d, c = %d, d = %d, out = %d", a, b, c, d, out);

        // Close the output file
        $fclose(outfile);
        $finish;
    end
endmodule
