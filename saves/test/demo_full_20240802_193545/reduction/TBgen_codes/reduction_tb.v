`timescale 1ns / 1ps

module tb_top_module;

    // Inputs
    reg [7:0] in;

    // Outputs
    wire parity;

    // Instantiate the DUT (Device Under Test)
    top_module dut (
        .in(in),
        .parity(parity)
    );

    // File descriptor for output
    integer fd;

    initial begin
        // Open the output file
        fd = $fopen("TBout.txt", "w");

        // Scenario 1
        in = 8'b00000000; // Apply input
        #1; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 1, in = %d, parity = %d", in, parity);

        // Scenario 2
        in = 8'b00000001; // Apply input
        #1; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 2, in = %d, parity = %d", in, parity);

        // Scenario 3
        in = 8'b11111111; // Apply input
        #1; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 3, in = %d, parity = %d", in, parity);

        // Scenario 4
        in = 8'b10101010; // Apply input
        #1; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 4, in = %d, parity = %d", in, parity);

        // Scenario 5
        in = 8'b01010101; // Apply input
        #1; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 5, in = %d, parity = %d", in, parity);

        // Scenario 6
        in = 8'b11001100; // Apply input
        #1; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 6, in = %d, parity = %d", in, parity);

        // Scenario 7
        in = 8'b00110011; // Apply input
        #1; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 7, in = %d, parity = %d", in, parity);

        // Scenario 8
        in = 8'b00001111; // Apply input
        #1; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 8, in = %d, parity = %d", in, parity);

        // Scenario 9
        in = 8'b11110000; // Apply input
        #1; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 9, in = %d, parity = %d", in, parity);

        // Scenario 10
        in = 8'b10111100; // Apply input
        #1; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 10, in = %d, parity = %d", in, parity);

        // Close the file
        $fclose(fd);
        $finish; // End the simulation
    end

endmodule
