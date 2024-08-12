`timescale 1ns / 1ps

module tb_top_module;

    // Define inputs and output
    reg x;
    reg y;
    wire z;

    // Instantiate the DUT
    top_module DUT (
        .x(x),
        .y(y),
        .z(z)
    );

    // File descriptor
    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");

        // Scenario 1: x = 0, y = 0
        x = 0; 
        y = 0;
        #1; // Wait for one clock cycle
        $fdisplay(file, "scenario: 1, x = %d, y = %d, z = %d", x, y, z);

        // Scenario 2: x = 0, y = 1
        x = 0; 
        y = 1;
        #1; // Wait for one clock cycle
        $fdisplay(file, "scenario: 2, x = %d, y = %d, z = %d", x, y, z);

        // Scenario 3: x = 1, y = 0
        x = 1; 
        y = 0;
        #1; // Wait for one clock cycle
        $fdisplay(file, "scenario: 3, x = %d, y = %d, z = %d", x, y, z);

        // Scenario 4: x = 1, y = 1
        x = 1; 
        y = 1;
        #1; // Wait for one clock cycle
        $fdisplay(file, "scenario: 4, x = %d, y = %d, z = %d", x, y, z);

        // Close the output file
        $fclose(file);

        // End simulation
        $finish;
    end
endmodule
