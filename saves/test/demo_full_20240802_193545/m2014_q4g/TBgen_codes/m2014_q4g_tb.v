module testbench;
    // Declare inputs and output
    reg in1;
    reg in2;
    reg in3;
    wire out;

    // Instantiate the DUT
    top_module dut (
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .out(out)
    );

    // File descriptor
    integer fd;

    initial begin
        // Open the output file
        fd = $fopen("TBout.txt", "w");
        
        // Scenario 1
        in1 = 0; in2 = 0; in3 = 0;
        #1;
        $fdisplay(fd, "scenario: 1, in1 = %d, in2 = %d, in3 = %d, out = %d", in1, in2, in3, out);

        // Scenario 2
        in1 = 0; in2 = 0; in3 = 1;
        #1;
        $fdisplay(fd, "scenario: 2, in1 = %d, in2 = %d, in3 = %d, out = %d", in1, in2, in3, out);

        // Scenario 3
        in1 = 0; in2 = 1; in3 = 0;
        #1;
        $fdisplay(fd, "scenario: 3, in1 = %d, in2 = %d, in3 = %d, out = %d", in1, in2, in3, out);

        // Scenario 4
        in1 = 0; in2 = 1; in3 = 1;
        #1;
        $fdisplay(fd, "scenario: 4, in1 = %d, in2 = %d, in3 = %d, out = %d", in1, in2, in3, out);

        // Scenario 5
        in1 = 1; in2 = 0; in3 = 0;
        #1;
        $fdisplay(fd, "scenario: 5, in1 = %d, in2 = %d, in3 = %d, out = %d", in1, in2, in3, out);

        // Scenario 6
        in1 = 1; in2 = 0; in3 = 1;
        #1;
        $fdisplay(fd, "scenario: 6, in1 = %d, in2 = %d, in3 = %d, out = %d", in1, in2, in3, out);

        // Scenario 7
        in1 = 1; in2 = 1; in3 = 0;
        #1;
        $fdisplay(fd, "scenario: 7, in1 = %d, in2 = %d, in3 = %d, out = %d", in1, in2, in3, out);

        // Scenario 8
        in1 = 1; in2 = 1; in3 = 1;
        #1;
        $fdisplay(fd, "scenario: 8, in1 = %d, in2 = %d, in3 = %d, out = %d", in1, in2, in3, out);

        // Scenario 9
        in1 = 0; in2 = 1; in3 = 0;
        #1;
        $fdisplay(fd, "scenario: 9, in1 = %d, in2 = %d, in3 = %d, out = %d", in1, in2, in3, out);
        in1 = 1; // Change in1
        #1;
        $fdisplay(fd, "scenario: 9a, in1 = %d, in2 = %d, in3 = %d, out = %d", in1, in2, in3, out);

        // Scenario 10
        in1 = 1; in2 = 0; in3 = 0;
        #1;
        $fdisplay(fd, "scenario: 10, in1 = %d, in2 = %d, in3 = %d, out = %d", in1, in2, in3, out);
        in3 = 1; // Change in3
        #1;
        $fdisplay(fd, "scenario: 10a, in1 = %d, in2 = %d, in3 = %d, out = %d", in1, in2, in3, out);

        // Close the file
        $fclose(fd);
    end
endmodule
