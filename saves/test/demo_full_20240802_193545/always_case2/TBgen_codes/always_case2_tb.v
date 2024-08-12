`timescale 1ns / 1ps

module tb_top_module;

    // Inputs
    reg [3:0] in;

    // Outputs
    wire [1:0] pos;

    // Instantiate the DUT
    top_module uut (
        .in(in),
        .pos(pos)
    );

    // File handle
    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");

        // Test scenarios
        run_scenario(1, 4'b0000);
        run_scenario(2, 4'b0001);
        run_scenario(3, 4'b0010);
        run_scenario(4, 4'b0100);
        run_scenario(5, 4'b1000);
        run_scenario(6, 4'b0011);
        run_scenario(7, 4'b0101);
        run_scenario(8, 4'b1001);
        run_scenario(9, 4'b0110);
        run_scenario(10, 4'b1010);
        run_scenario(11, 4'b1100);
        run_scenario(12, 4'b1011);
        run_scenario(13, 4'b1101);
        run_scenario(14, 4'b1110);
        run_scenario(15, 4'b1111);

        // Close the output file
        $fclose(file);
        $finish;
    end

    // Task to run scenario and print results
    task run_scenario;
        input [3:0] scenario_num;
        input [3:0] test_input;

        begin
            in = test_input;
            #1; // Wait for 1 time unit for the signals to stabilize
            $fdisplay(file, "scenario: %0d, in = %b, pos = %b", scenario_num, in, pos); // Change %d to %b for binary display
        end
    endtask

endmodule
