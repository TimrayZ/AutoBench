`timescale 1ns / 1ps

module tb_top_module;
    // Parameters and variables
    reg [3:0] in;
    wire [2:0] out_both;
    wire [3:1] out_any;
    wire [3:0] out_different;

    // Instantiate the Device Under Test (DUT)
    top_module dut (
        .in(in),
        .out_both(out_both),
        .out_any(out_any),
        .out_different(out_different)
    );

    // File for output
    integer file;
    
    initial begin
        // Open the file for writing
        file = $fopen("TBout.txt", "w");
        
        // Scenario 1
        in = 4'b0000; 
        #1; 
        $fdisplay(file, "scenario: 1, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 2
        in = 4'b1111; 
        #1; 
        $fdisplay(file, "scenario: 2, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 3
        in = 4'b1010; 
        #1; 
        $fdisplay(file, "scenario: 3, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 4
        in = 4'b0101; 
        #1; 
        $fdisplay(file, "scenario: 4, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 5
        in = 4'b1100; 
        #1; 
        $fdisplay(file, "scenario: 5, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 6
        in = 4'b0011; 
        #1; 
        $fdisplay(file, "scenario: 6, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 7
        in = 4'b0110; 
        #1; 
        $fdisplay(file, "scenario: 7, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 8
        in = 4'b1001; 
        #1; 
        $fdisplay(file, "scenario: 8, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 9
        in = 4'b1110; 
        #1; 
        $fdisplay(file, "scenario: 9, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 10
        in = 4'b0001; 
        #1; 
        $fdisplay(file, "scenario: 10, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Close the file
        $fclose(file);
        // End the simulation
        $finish;
    end
endmodule
