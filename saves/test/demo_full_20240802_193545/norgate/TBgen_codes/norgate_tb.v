`timescale 1ns / 1ps

module tb_top_module;

    // DUT signals
    reg a;
    reg b;
    wire out;

    // Instantiate the Device Under Test (DUT)
    top_module DUT (
        .a(a),
        .b(b),
        .out(out)
    );

    // File pointer for exporting signals
    integer fp;

    initial begin
        // Open the file for writing
        fp = $fopen("TBout.txt", "w");
        
        // Scenario 1
        a = 0; b = 0; 
        #1; 
        $fdisplay(fp, "scenario: 1, a = %d, b = %d, out = %d", a, b, out);

        // Scenario 2
        a = 0; b = 1; 
        #1; 
        $fdisplay(fp, "scenario: 2, a = %d, b = %d, out = %d", a, b, out);

        // Scenario 3
        a = 1; b = 0; 
        #1; 
        $fdisplay(fp, "scenario: 3, a = %d, b = %d, out = %d", a, b, out);

        // Scenario 4
        a = 1; b = 1; 
        #1; 
        $fdisplay(fp, "scenario: 4, a = %d, b = %d, out = %d", a, b, out);

        // Close the file
        $fclose(fp);
        $finish;
    end

endmodule
