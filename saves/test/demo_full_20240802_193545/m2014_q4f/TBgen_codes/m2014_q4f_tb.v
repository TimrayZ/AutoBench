module tb_top_module;
    // Declare inputs and outputs
    logic in1;
    logic in2;
    logic out;

    // Instantiate the DUT
    top_module DUT (
        .in1(in1),
        .in2(in2),
        .out(out)
    );

    // File handling
    integer file;

    // Clock generation
    logic clk;
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time unit clock period
    end

    // Test scenarios
    initial begin
        file = $fopen("TBout.txt", "w"); // Open output file

        // Scenario 1: Apply in1 = 0 and in2 = 0
        in1 = 0; in2 = 0;
        #10; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 1, in1 = %d, in2 = %d, out = %d", in1, in2, out);
        #90; // Hold for 10 clock cycles

        // Scenario 2: Apply in1 = 0 and in2 = 1
        in1 = 0; in2 = 1;
        #10; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 2, in1 = %d, in2 = %d, out = %d", in1, in2, out);
        #90; // Hold for 10 clock cycles

        // Scenario 3: Apply in1 = 1 and in2 = 0
        in1 = 1; in2 = 0;
        #10; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 3, in1 = %d, in2 = %d, out = %d", in1, in2, out);
        #90; // Hold for 10 clock cycles

        // Scenario 4: Apply in1 = 1 and in2 = 1
        in1 = 1; in2 = 1;
        #10; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 4, in1 = %d, in2 = %d, out = %d", in1, in2, out);
        #90; // Hold for 10 clock cycles

        // Scenario 5: Generate a clock signal. Apply in1 = 0 and toggle in2 from 0 to 1 every clock cycle for 5 cycles.
        in1 = 0;
        for (int i = 0; i < 5; i++) begin
            in2 = i % 2; // Toggle in2 between 0 and 1
            #10; // Wait for signals to stabilize
            $fdisplay(file, "scenario: 5%d, in1 = %d, in2 = %d, out = %d", i % 2, in1, in2, out);
            #90; // Hold for 10 clock cycles (added missing hold)
        end

        // Scenario 6: Generate a clock signal. Apply in1 = 1 and toggle in2 from 0 to 1 every clock cycle for 5 cycles.
        in1 = 1;
        for (int i = 0; i < 5; i++) begin
            in2 = i % 2; // Toggle in2 between 0 and 1
            #10; // Wait for signals to stabilize
            $fdisplay(file, "scenario: 6%d, in1 = %d, in2 = %d, out = %d", i % 2, in1, in2, out);
            #90; // Hold for 10 clock cycles (added missing hold)
        end

        // Scenario 7: Randomly toggle in1 and in2 for 20 cycles
        for (int i = 0; i < 20; i++) begin
            {in1, in2} = {$random} % 4; // Randomly generate in1 and in2
            #10; // Wait for signals to stabilize
            $fdisplay(file, "scenario: 7%d, in1 = %d, in2 = %d, out = %d", i, in1, in2, out);
        end

        // Close file
        $fclose(file);
        $finish;
    end
endmodule
