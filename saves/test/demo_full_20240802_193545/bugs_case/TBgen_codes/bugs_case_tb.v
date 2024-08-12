`timescale 1ns/1ps

module tb_top_module;

    reg [7:0] code;          // Input signal
    wire [3:0] out;         // Output signal
    wire valid;             // Output signal

    // Instantiate the DUT
    top_module DUT (
        .code(code),
        .out(out),
        .valid(valid)
    );

    integer fd;             // File descriptor for output file

    initial begin
        // Open the file to write the output signals
        fd = $fopen("TBout.txt", "w");
        
        // Scenario 1
        code = 8'h45; #1; 
        $fdisplay(fd, "scenario: 1, code = %d, out = %d, valid = %d", code, out, valid);

        // Scenario 2
        code = 8'h16; #1; 
        $fdisplay(fd, "scenario: 2, code = %d, out = %d, valid = %d", code, out, valid);

        // Scenario 3
        code = 8'h1e; #1; 
        $fdisplay(fd, "scenario: 3, code = %d, out = %d, valid = %d", code, out, valid);

        // Scenario 4
        code = 8'h26; #1; 
        $fdisplay(fd, "scenario: 4, code = %d, out = %d, valid = %d", code, out, valid);

        // Scenario 5
        code = 8'h25; #1; 
        $fdisplay(fd, "scenario: 5, code = %d, out = %d, valid = %d", code, out, valid);

        // Scenario 6
        code = 8'h2e; #1; 
        $fdisplay(fd, "scenario: 6, code = %d, out = %d, valid = %d", code, out, valid);

        // Scenario 7
        code = 8'h36; #1; 
        $fdisplay(fd, "scenario: 7, code = %d, out = %d, valid = %d", code, out, valid);

        // Scenario 8
        code = 8'h3d; #1; 
        $fdisplay(fd, "scenario: 8, code = %d, out = %d, valid = %d", code, out, valid);

        // Scenario 9
        code = 8'h3e; #1; 
        $fdisplay(fd, "scenario: 9, code = %d, out = %d, valid = %d", code, out, valid);

        // Scenario 10
        code = 8'h46; #1; 
        $fdisplay(fd, "scenario: 10, code = %d, out = %d, valid = %d", code, out, valid);

        // Scenario 11
        code = 8'h00; #1; 
        $fdisplay(fd, "scenario: 11, code = %d, out = %d, valid = %d", code, out, valid);

        // Scenario 12
        code = 8'h99; #1; 
        $fdisplay(fd, "scenario: 12, code = %d, out = %d, valid = %d", code, out, valid);

        // Scenario 13
        code = 8'hFF; #1; 
        $fdisplay(fd, "scenario: 13, code = %d, out = %d, valid = %d", code, out, valid);

        // Scenario 14
        code = 8'h3A; #1; 
        $fdisplay(fd, "scenario: 14, code = %d, out = %d, valid = %d", code, out, valid);

        // Scenario 15
        code = 8'hAB; #1; 
        $fdisplay(fd, "scenario: 15, code = %d, out = %d, valid = %d", code, out, valid);

        // Close the file
        $fclose(fd);
        
        // Finish simulation
        $finish;
    end

endmodule
