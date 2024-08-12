`timescale 1ns / 1ps

module tb_top_module;

    // Input and output declarations
    reg [7:0] in;
    wire [31:0] out;

    // Instantiate the DUT (Device Under Test)
    top_module DUT (
        .in(in),
        .out(out)
    );

    // File pointer for output
    integer fd;

    initial begin
        // Open the output file
        fd = $fopen("TBout.txt", "w");
        
        // Scenario 1
        in = 8'b01010101; // 85
        #10; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 1, in = %d, out = %d", in, out);
        
        // Scenario 2
        in = 8'b11010011; // -13
        #10; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 2, in = %d, out = %d", in, out);
        
        // Scenario 3
        in = 8'b00000000; // 0
        #10; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 3, in = %d, out = %d", in, out);
        
        // Scenario 4
        in = 8'b11111111; // -1
        #10; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 4, in = %d, out = %d", in, out);
        
        // Scenario 5
        in = 8'b01111111; // 127
        #10; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 5, in = %d, out = %d", in, out);
        
        // Scenario 6
        in = 8'b10000000; // -128
        #10; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 6, in = %d, out = %d", in, out);
        
        // Scenario 7
        in = 8'b10101010; // -86
        #10; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 7, in = %d, out = %d", in, out);
        
        // Scenario 8
        in = 8'b00001111; // 15
        #10; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 8, in = %d, out = %d", in, out);
        
        // Scenario 9
        in = 8'b01101001; // 105
        #10; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 9, in = %d, out = %d", in, out);
        
        // Scenario 10
        in = 8'b11111100; // -4
        #10; // Wait for 1 clock cycle
        $fdisplay(fd, "scenario: 10, in = %d, out = %d", in, out);
        
        // Close the file
        $fclose(fd);
        
        // Finish simulation
        $finish;
    end

endmodule
