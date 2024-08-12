`timescale 1ns / 1ps

module tb_top_module;

    // Output of DUT
    wire out;

    // Instantiate the DUT
    top_module DUT (
        .out(out)
    );

    // File handle for output
    integer file;

    initial begin
        // Open the file for writing
        file = $fopen("TBout.txt", "w");
        
        // Scenario 1: Initialize the simulation
        #10; // Wait for 10 time units
        $fdisplay(file, "scenario: 1, out = %d", out);

        // Scenario 2: Check output at clock cycle 10
        #10; // To pause for stability
        $fdisplay(file, "scenario: 2, out = %d", out);
        
        // Ensure the output is checked to be low
        if (out !== 1'b0) begin
            $fdisplay(file, "ERROR: Output at scenario 2 is not 0");
        end

        // Scenario 3: Continue for another 10 time units
        #10; // To pause for stability
        $fdisplay(file, "scenario: 3, out = %d", out);
        
        // Ensure the output is checked to be low
        if (out !== 1'b0) begin
            $fdisplay(file, "ERROR: Output at scenario 3 is not 0");
        end

        // Scenario 4: Check output at cycles 10, 20, 30, 40, 50
        repeat (5) begin // Ensure this is set to repeat 5 times, not 4.
            #10; // To pause for stability
            $fdisplay(file, "scenario: 4a, out = %d", out);
            
            // Ensure the output is checked to be low
            if (out !== 1'b0) begin
                $fdisplay(file, "ERROR: Output at one of the scenario 4 checks is not 0");
            end
        end

        // Ensure output check for scenario 4 at 50 time units
        #10; // To pause for stability
        $fdisplay(file, "scenario: 4b, out = %d", out);
        if (out !== 1'b0) begin
            $fdisplay(file, "ERROR: Output at scenario 4b (cycle 50) is not 0");
        end
        
        // Scenario 5: Extend simulation to 100 time units
        repeat (10) begin // Corrected to repeat 10 times for 100 cycles
            #10; // To pause for stability
            $fdisplay(file, "scenario: 5a, out = %d", out);
            
            // Ensure the output is checked to be low
            if (out !== 1'b0) begin
                $fdisplay(file, "ERROR: Output at one of the scenario 5 checks is not 0");
            end
        end

        // Close the file
        $fclose(file);
        $stop; // End simulation
    end

endmodule
