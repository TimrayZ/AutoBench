`timescale 1ns / 1ps

module tb_top_module;
    // Inputs
    reg x;
    reg y;

    // Outputs
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
        
        // Scenario 1
        x = 0; y = 0; 
        #25; // Hold until 25ns
        $fdisplay(file, "scenario: 1, x = %d, y = %d, z = %d", x, y, z);

        // Scenario 2
        x = 1; y = 0; 
        #10; // Hold until 35ns
        $fdisplay(file, "scenario: 2, x = %d, y = %d, z = %d", x, y, z);

        // Scenario 3
        x = 0; y = 1; 
        #10; // Hold until 45ns
        $fdisplay(file, "scenario: 3, x = %d, y = %d, z = %d", x, y, z);

        // Scenario 4
        x = 1; y = 1; 
        #10; // Hold until 55ns
        $fdisplay(file, "scenario: 4, x = %d, y = %d, z = %d", x, y, z);

        // Scenario 5
        x = 0; y = 0; 
        #5; // Hold until 60ns
        $fdisplay(file, "scenario: 5, x = %d, y = %d, z = %d", x, y, z);

        // Scenario 6
        x = 0; y = 1; 
        #10; // Hold until 70ns
        $fdisplay(file, "scenario: 6, x = %d, y = %d, z = %d", x, y, z);

        // Scenario 7
        x = 1; y = 1; 
        #5; // Hold until 75ns
        $fdisplay(file, "scenario: 7, x = %d, y = %d, z = %d", x, y, z);

        // Scenario 8
        x = 0; y = 1; 
        #15; // Hold until 90ns
        $fdisplay(file, "scenario: 8, x = %d, y = %d, z = %d", x, y, z);

        // Scenario 9
        x = 1; y = 0; 
        #1000; // Hold indefinitely
        $fdisplay(file, "scenario: 9, x = %d, y = %d, z = %d", x, y, z);

        // Close the output file
        $fclose(file);
        $finish;
    end
endmodule
