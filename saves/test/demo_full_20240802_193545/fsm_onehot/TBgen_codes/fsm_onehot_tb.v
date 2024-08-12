`timescale 1ns / 1ps

module testbench;

    // DUT Inputs
    reg in;
    reg [9:0] state;

    // DUT Outputs
    wire [9:0] next_state;
    wire out1;
    wire out2;

    // Instantiate the DUT
    top_module DUT (
        .in(in),
        .state(state),
        .next_state(next_state),
        .out1(out1),
        .out2(out2)
    );

    // File descriptor for output
    integer fd;

    initial begin
        // Open the output file
        fd = $fopen("TBout.txt", "w");
        
        // Scenario 1
        state = 10'b0000000001; // S0
        in = 0;
        #1;
        $fdisplay(fd, "scenario: 1, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 2
        state = 10'b0000000001; // S0
        in = 1;
        #1;
        $fdisplay(fd, "scenario: 2, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 3
        state = 10'b0000000010; // S1
        in = 0;
        #1;
        $fdisplay(fd, "scenario: 3, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 4
        state = 10'b0000000010; // S1
        in = 1;
        #1;
        $fdisplay(fd, "scenario: 4, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 5
        state = 10'b0000000100; // S2
        in = 0;
        #1;
        $fdisplay(fd, "scenario: 5, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 6
        state = 10'b0000000100; // S2
        in = 1;
        #1;
        $fdisplay(fd, "scenario: 6, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 7
        state = 10'b0000001000; // S3
        in = 0;
        #1;
        $fdisplay(fd, "scenario: 7, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 8
        state = 10'b0000001000; // S3
        in = 1;
        #1;
        $fdisplay(fd, "scenario: 8, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 9
        state = 10'b0000010000; // S4
        in = 0;
        #1;
        $fdisplay(fd, "scenario: 9, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 10
        state = 10'b0000010000; // S4
        in = 1;
        #1;
        $fdisplay(fd, "scenario: 10, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 11
        state = 10'b0000100000; // S5
        in = 0;
        #1;
        $fdisplay(fd, "scenario: 11, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 12
        state = 10'b0000100000; // S5
        in = 1;
        #1;
        $fdisplay(fd, "scenario: 12, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 13
        state = 10'b0001000000; // S6
        in = 0;
        #1;
        $fdisplay(fd, "scenario: 13, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 14
        state = 10'b0001000000; // S6
        in = 1;
        #1;
        $fdisplay(fd, "scenario: 14, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 15
        state = 10'b0010000000; // S7
        in = 0;
        #1;
        $fdisplay(fd, "scenario: 15, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 16
        state = 10'b0010000000; // S7
        in = 1;
        #1;
        $fdisplay(fd, "scenario: 16, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 17
        state = 10'b0100000000; // S8
        in = 0;
        #1;
        $fdisplay(fd, "scenario: 17, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 18
        state = 10'b0100000000; // S8
        in = 1;
        #1;
        $fdisplay(fd, "scenario: 18, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 19
        state = 10'b1000000000; // S9
        in = 0;
        #1;
        $fdisplay(fd, "scenario: 19, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Scenario 20
        state = 10'b1000000000; // S9
        in = 1;
        #1;
        $fdisplay(fd, "scenario: 20, in = %d, state = %b, next_state = %b, out1 = %d, out2 = %d", in, state, next_state, out1, out2);

        // Close the output file
        $fclose(fd);
        
        // End the simulation
        $finish;
    end

endmodule
