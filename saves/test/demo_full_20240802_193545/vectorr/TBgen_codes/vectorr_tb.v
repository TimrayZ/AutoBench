`timescale 1ns / 1ps

module tb_top_module;

    // Declare inputs and outputs
    reg [7:0] in;
    wire [7:0] out;

    // Instantiate the DUT
    top_module DUT (
        .in(in),
        .out(out)
    );

    // File pointer for output
    integer file;

    // Initial block for stimulus and file initialization
    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        in = 8'b00000000; 
        #1; 
        $fdisplay(file, "scenario: 1, in = %d, out = %d", in, out);
        
        // Scenario 2
        in = 8'b11111111;
        #1;
        $fdisplay(file, "scenario: 2, in = %d, out = %d", in, out);
        
        // Scenario 3
        in = 8'b10101010;
        #1;
        $fdisplay(file, "scenario: 3, in = %d, out = %d", in, out);
        
        // Scenario 4
        in = 8'b01010101;
        #1;
        $fdisplay(file, "scenario: 4, in = %d, out = %d", in, out);
        
        // Scenario 5
        in = 8'b00001111;
        #1;
        $fdisplay(file, "scenario: 5, in = %d, out = %d", in, out);
        
        // Scenario 6
        in = 8'b11110000;
        #1;
        $fdisplay(file, "scenario: 6, in = %d, out = %d", in, out);
        
        // Scenario 7
        in = 8'b00000001;
        #1;
        $fdisplay(file, "scenario: 7, in = %d, out = %d", in, out);
        
        // Scenario 8
        in = 8'b00001110;
        #1;
        $fdisplay(file, "scenario: 8, in = %d, out = %d", in, out);
        
        // Scenario 9
        in = 8'b11111110;
        #1;
        $fdisplay(file, "scenario: 9, in = %d, out = %d", in, out);
        
        // Scenario 10
        in = 8'b10000000;
        #1;
        $fdisplay(file, "scenario: 10, in = %d, out = %d", in, out);

        // Close the output file
        $fclose(file);
    end

endmodule
