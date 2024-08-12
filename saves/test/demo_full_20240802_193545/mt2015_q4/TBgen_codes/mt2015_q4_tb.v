`timescale 1ns/1ns

module tb_top_module;

    // Inputs
    reg x;
    reg y;

    // Outputs
    wire z;

    // Instantiate the Device Under Test (DUT)
    top_module DUT (
        .x(x),
        .y(y),
        .z(z)
    );

    // File handling
    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");
        
        // Scenario 1
        x = 0; y = 0; 
        #0;
        $fdisplay(file, "scenario: 1, x = %d, y = %d, z = %d", x, y, z);
        #5; // Hold for 5ns

        // Scenario 2
        x = 0; y = 0;
        #5;
        $fdisplay(file, "scenario: 2, x = %d, y = %d, z = %d", x, y, z);
        #15; // Hold for 15ns

        // Scenario 3
        x = 0; y = 0;
        #20;
        $fdisplay(file, "scenario: 3, x = %d, y = %d, z = %d", x, y, z);
        #5; // Hold for 5ns

        // Scenario 4
        x = 1; y = 0;
        #25;
        $fdisplay(file, "scenario: 4, x = %d, y = %d, z = %d", x, y, z);
        #10; // Hold for 10ns

        // Scenario 5
        x = 0; y = 1;
        #35;
        $fdisplay(file, "scenario: 5, x = %d, y = %d, z = %d", x, y, z);
        #10; // Hold for 10ns

        // Scenario 6
        x = 1; y = 1;
        #45;
        $fdisplay(file, "scenario: 6, x = %d, y = %d, z = %d", x, y, z);
        #5; // Hold for 5ns

        // Scenario 7
        x = 0; y = 0;
        #55;
        $fdisplay(file, "scenario: 7, x = %d, y = %d, z = %d", x, y, z);
        #5; // Hold for 5ns

        // Scenario 8
        x = 0; y = 1;
        #60;
        $fdisplay(file, "scenario: 8, x = %d, y = %d, z = %d", x, y, z);
        #10; // Hold for 10ns

        // Scenario 9
        x = 1; y = 1;
        #70;
        $fdisplay(file, "scenario: 9, x = %d, y = %d, z = %d", x, y, z);
        #5; // Hold for 5ns

        // Scenario 10
        x = 0; y = 1;
        #75;
        $fdisplay(file, "scenario: 10, x = %d, y = %d, z = %d", x, y, z);
        #15; // Hold for 15ns

        // Scenario 11
        x = 1; y = 0;
        #90;
        $fdisplay(file, "scenario: 11, x = %d, y = %d, z = %d", x, y, z);
        #5; // Hold for 5ns

        // Close the file
        $fclose(file);

        // End the simulation
        $finish;
    end

endmodule
