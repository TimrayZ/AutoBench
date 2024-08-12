`timescale 1ns / 1ps

module tb_population_count;

    // Parameters
    reg [2:0] in;           // Input vector
    wire [1:0] out;        // Output vector

    // DUT instance
    top_module DUT (
        .in(in),
        .out(out)
    );

    // File Descriptors
    integer file;

    initial begin
        // Open file for writing
        file = $fopen("TBout.txt", "w");
        
        // Scenario 1
        in = 3'b000;           // Set input
        #1;                    // Wait for signals to stabilize
        $fdisplay(file, "scenario: 1, in = %d, out = %d", in, out);
        
        // Scenario 2
        in = 3'b001;           // Set input
        #1;                    // Wait for signals to stabilize
        $fdisplay(file, "scenario: 2, in = %d, out = %d", in, out);
        
        // Scenario 3
        in = 3'b010;           // Set input
        #1;                    // Wait for signals to stabilize
        $fdisplay(file, "scenario: 3, in = %d, out = %d", in, out);
        
        // Scenario 4
        in = 3'b011;           // Set input
        #1;                    // Wait for signals to stabilize
        $fdisplay(file, "scenario: 4, in = %d, out = %d", in, out);
        
        // Scenario 5
        in = 3'b100;           // Set input
        #1;                    // Wait for signals to stabilize
        $fdisplay(file, "scenario: 5, in = %d, out = %d", in, out);
        
        // Scenario 6
        in = 3'b101;           // Set input
        #1;                    // Wait for signals to stabilize
        $fdisplay(file, "scenario: 6, in = %d, out = %d", in, out);
        
        // Scenario 7
        in = 3'b110;           // Set input
        #1;                    // Wait for signals to stabilize
        $fdisplay(file, "scenario: 7, in = %d, out = %d", in, out);
        
        // Scenario 8
        in = 3'b111;           // Set input
        #1;                    // Wait for signals to stabilize
        $fdisplay(file, "scenario: 8, in = %d, out = %d", in, out);
        
        // Close the file
        $fclose(file);
        $finish;               // End the simulation
    end

endmodule
