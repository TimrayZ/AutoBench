`timescale 1ns / 1ps

module tb_top_module();
    
    // Inputs
    reg in;
    
    // Outputs
    wire out;
    
    // Instantiate the DUT
    top_module DUT (
        .in(in),
        .out(out)
    );
    
    // File descriptor for output
    integer fd;

    initial begin
        // Open file for writing
        fd = $fopen("TBout.txt", "w");
    
        // Scenario 1
        in = 0;
        #10;
        $fdisplay(fd, "scenario: 1, in = %d, out = %d", in, out);
        
        // Scenario 2
        in = 1;
        #10;
        $fdisplay(fd, "scenario: 2, in = %d, out = %d", in, out);
        
        // Scenario 3
        in = 0;
        #5;
        $fdisplay(fd, "scenario: 3a, in = %d, out = %d", in, out);
        in = 1;
        #5;
        $fdisplay(fd, "scenario: 3b, in = %d, out = %d", in, out);
        
        // Scenario 4
        in = 1;
        #5;
        $fdisplay(fd, "scenario: 4a, in = %d, out = %d", in, out);
        in = 0;
        #5;
        $fdisplay(fd, "scenario: 4b, in = %d, out = %d", in, out);

        // Scenario 5
        in = 0;
        #2;
        $fdisplay(fd, "scenario: 5a, in = %d, out = %d", in, out);
        in = 1;
        #2;
        $fdisplay(fd, "scenario: 5b, in = %d, out = %d", in, out);
        in = 0;
        #2;
        $fdisplay(fd, "scenario: 5c, in = %d, out = %d", in, out);
        
        // Close file
        $fclose(fd);
        $finish; // End the simulation
    end
    
endmodule
