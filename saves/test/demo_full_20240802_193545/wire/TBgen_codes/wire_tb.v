`timescale 1ns / 1ps

module tb_top_module;

    reg in;
    wire out;

    // Instantiate the Device Under Test (DUT)
    top_module DUT (
        .in(in),
        .out(out)
    );

    // File declaration for output
    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");
        
        // Scenario 1: Apply a logical low value (0) to the input 'in' at time 0 ns.
        in = 0;
        #10; // Hold this value for 10 clock cycles
        $fdisplay(file, "scenario: 1, in = %d, out = %d", in, out);

        // Scenario 2: Apply a logical high value (1) to the input 'in' at time 10 ns.
        in = 1;
        #10; // Hold this value for 10 clock cycles
        $fdisplay(file, "scenario: 2, in = %d, out = %d", in, out);

        // Scenario 3: Change the input 'in' from a logical low (0) to a logical high (1) at time 20 ns.
        in = 1;
        #10; // Hold this value for 10 clock cycles
        $fdisplay(file, "scenario: 3, in = %d, out = %d", in, out);

        // Scenario 4: Change the input 'in' from a logical high (1) to a logical low (0) at time 30 ns.
        in = 0;
        #10; // Hold this value for 10 clock cycles
        $fdisplay(file, "scenario: 4, in = %d, out = %d", in, out);

        // Scenario 5: Apply a sequence of alternating values
        in = 0; // Start with a logical low (0) at time 40 ns
        #2; // Hold for 2 clock cycles
        $fdisplay(file, "scenario: 5a, in = %d, out = %d", in, out);
        
        in = 1; // Switch to high (1) at time 42 ns
        #2; // Hold for 2 clock cycles
        $fdisplay(file, "scenario: 5b, in = %d, out = %d", in, out);
        
        in = 0; // Switch back to low (0) at time 44 ns
        #2; // Hold for 2 clock cycles
        $fdisplay(file, "scenario: 5c, in = %d, out = %d", in, out);
        
        in = 1; // Switch to high (1) at time 46 ns
        #2; // Hold for 2 clock cycles
        $fdisplay(file, "scenario: 5d, in = %d, out = %d", in, out);
        
        // Continuing Scenario 5 with the explicit timing 
        in = 0; // Start with a logical low (0)
        #2; // Hold for 2 clock cycles
        $fdisplay(file, "scenario: 5e, in = %d, out = %d", in, out);
        
        in = 1; // Switch to high (1)
        #2; // Hold for 2 clock cycles
        $fdisplay(file, "scenario: 5f, in = %d, out = %d", in, out);
        
        in = 0; // Switch back to low (0)
        #2; // Hold for 2 clock cycles
        $fdisplay(file, "scenario: 5g, in = %d, out = %d", in, out);
        
        in = 1; // Switch to high (1)
        #2; // Hold for 2 clock cycles
        $fdisplay(file, "scenario: 5h, in = %d, out = %d", in, out);

        // Close the output file
        $fclose(file);
        $finish;
    end

endmodule
