`timescale 1ns / 1ps

module tb_top_module;

    // Inputs
    reg c;
    reg d;

    // Outputs
    wire [3:0] mux_in;

    // Instantiate the DUT
    top_module dut (
        .c(c),
        .d(d),
        .mux_in(mux_in)
    );

    // File descriptor for output
    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");
        
        // Scenario 1
        c = 0; d = 0; #1;
        $fdisplay(file, "scenario: 1, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Scenario 2
        c = 0; d = 1; #1;
        $fdisplay(file, "scenario: 2, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Scenario 3
        c = 1; d = 0; #1;
        $fdisplay(file, "scenario: 3, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Scenario 4
        c = 1; d = 1; #1;
        $fdisplay(file, "scenario: 4, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Scenario 5
        c = 0; d = 0; #1;
        $fdisplay(file, "scenario: 5, c = %d, d = %d, mux_in = %b", c, d, mux_in);
        c = 0; d = 1; #1;
        $fdisplay(file, "scenario: 5a, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Scenario 6
        c = 0; d = 1; #1;
        $fdisplay(file, "scenario: 6, c = %d, d = %d, mux_in = %b", c, d, mux_in);
        c = 1; d = 0; #1;
        $fdisplay(file, "scenario: 6a, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Scenario 7
        c = 1; d = 0; #1;
        $fdisplay(file, "scenario: 7, c = %d, d = %d, mux_in = %b", c, d, mux_in);
        c = 1; d = 1; #1;
        $fdisplay(file, "scenario: 7a, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Scenario 8
        c = 1; d = 1; #1;
        $fdisplay(file, "scenario: 8, c = %d, d = %d, mux_in = %b", c, d, mux_in);
        c = 0; d = 0; #1;
        $fdisplay(file, "scenario: 8a, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Scenario 9
        c = 0; d = 0; #1;
        $fdisplay(file, "scenario: 9, c = %d, d = %d, mux_in = %b", c, d, mux_in);
        #1;
        $fdisplay(file, "scenario: 9a, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Scenario 10
        c = 0; d = 1; #1;
        $fdisplay(file, "scenario: 10, c = %d, d = %d, mux_in = %b", c, d, mux_in);
        #1;
        $fdisplay(file, "scenario: 10a, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Scenario 11
        c = 1; d = 0; #1;
        $fdisplay(file, "scenario: 11, c = %d, d = %d, mux_in = %b", c, d, mux_in);
        #1;
        $fdisplay(file, "scenario: 11a, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Scenario 12
        c = 1; d = 1; #1;
        $fdisplay(file, "scenario: 12, c = %d, d = %d, mux_in = %b", c, d, mux_in);
        #1;
        $fdisplay(file, "scenario: 12a, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Scenario 13
        c = 0; d = 0; #1;
        $fdisplay(file, "scenario: 13, c = %d, d = %d, mux_in = %b", c, d, mux_in);
        c = 1; d = 1; #1;
        $fdisplay(file, "scenario: 13a, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Scenario 14
        c = 0; d = 1; #1;
        $fdisplay(file, "scenario: 14, c = %d, d = %d, mux_in = %b", c, d, mux_in);
        c = 0; d = 0; #1;
        $fdisplay(file, "scenario: 14a, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Scenario 15
        c = 1; d = 0; #1;
        $fdisplay(file, "scenario: 15, c = %d, d = %d, mux_in = %b", c, d, mux_in);
        c = 1; d = 1; #1;
        $fdisplay(file, "scenario: 15a, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Scenario 16 (Randomly check each combination of c and d)
        c = 0; d = 0; #1; 
        $fdisplay(file, "scenario: 16a, c = %d, d = %d, mux_in = %b", c, d, mux_in);
        c = 0; d = 1; #1; 
        $fdisplay(file, "scenario: 16b, c = %d, d = %d, mux_in = %b", c, d, mux_in);
        c = 1; d = 0; #1; 
        $fdisplay(file, "scenario: 16c, c = %d, d = %d, mux_in = %b", c, d, mux_in);
        c = 1; d = 1; #1; 
        $fdisplay(file, "scenario: 16d, c = %d, d = %d, mux_in = %b", c, d, mux_in);

        // Close the output file
        $fclose(file);
        
        // Finish the simulation
        $finish;
    end

endmodule
