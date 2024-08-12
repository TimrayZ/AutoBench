`timescale 1ns / 1ps

module tb_top_module;

    reg in;          // Input signal
    wire out;       // Output signal

    // Instantiate the DUT
    top_module DUT (
        .in(in),
        .out(out)
    );

    // File handle for output
    integer file;
    
    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");
        
        // Scenario 1: Apply 'in' = 0 at time = 0 clock cycles
        in = 0; 
        #1; 
        $fdisplay(file, "scenario: 1, in = %d, out = %d", in, out);

        // Scenario 2: Change 'in' to 1 at time = 1 clock cycle
        in = 1;
        #1;
        $fdisplay(file, "scenario: 2, in = %d, out = %d", in, out);
        
        // Scenario 3: Change 'in' back to 0 at time = 2 clock cycles
        in = 0; 
        #1; 
        $fdisplay(file, "scenario: 3, in = %d, out = %d", in, out);
        
        // Scenario 4: Set 'in' to 1 again at time = 3 clock cycles
        in = 1;
        #1; 
        $fdisplay(file, "scenario: 4, in = %d, out = %d", in, out);
        
        // Scenario 5: Toggle 'in' to 0 at time = 4 clock cycles
        in = 0; 
        #1; 
        $fdisplay(file, "scenario: 5, in = %d, out = %d", in, out);
        
        // Scenario 6: Apply 'in' = 1 at time = 5 clock cycles
        in = 1; 
        #5; 
        $fdisplay(file, "scenario: 6, in = %d, out = %d", in, out);
        
        // Scenario 7: Set 'in' to 0 at time = 10 clock cycles
        in = 0; 
        #1; 
        $fdisplay(file, "scenario: 7, in = %d, out = %d", in, out);
        
        // Scenario 8: Change 'in' to 1 at time = 11 clock cycles
        in = 1; 
        #1; 
        $fdisplay(file, "scenario: 8, in = %d, out = %d", in, out);

        // Hold for additional clock cycle before ending the test
        #1;

        // Close the output file
        $fclose(file);
        
        // End simulation
        $finish;
    end

endmodule
