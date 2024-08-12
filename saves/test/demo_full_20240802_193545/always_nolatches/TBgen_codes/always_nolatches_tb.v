`timescale 1ns / 1ps

module tb_top_module;

    reg [15:0] scancode;
    wire left, down, right, up;

    // Instantiate the Device Under Test (DUT)
    top_module dut (
        .scancode(scancode),
        .left(left),
        .down(down),
        .right(right),
        .up(up)
    );

    integer file;

    initial begin
        // Open output file
        file = $fopen("TBout.txt", "w");

        // Scenario 1: left arrow
        scancode = 16'hE06B; // left arrow
        #10; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 1, scancode = %d, left = %d, down = %d, right = %d, up = %d", scancode, left, down, right, up);

        // Scenario 2: down arrow
        scancode = 16'hE072; // down arrow
        #10; 
        $fdisplay(file, "scenario: 2, scancode = %d, left = %d, down = %d, right = %d, up = %d", scancode, left, down, right, up);

        // Scenario 3: right arrow
        scancode = 16'hE074; // right arrow
        #10; 
        $fdisplay(file, "scenario: 3, scancode = %d, left = %d, down = %d, right = %d, up = %d", scancode, left, down, right, up);

        // Scenario 4: up arrow
        scancode = 16'hE075; // up arrow
        #10; 
        $fdisplay(file, "scenario: 4, scancode = %d, left = %d, down = %d, right = %d, up = %d", scancode, left, down, right, up);

        // Scenario 5: invalid scancode
        scancode = 16'hFFFF; // invalid scancode
        #10; 
        $fdisplay(file, "scenario: 5, scancode = %d, left = %d, down = %d, right = %d, up = %d", scancode, left, down, right, up);

        // Scenario 6: invalid scancode
        scancode = 16'h0000; // invalid scancode
        #10; 
        $fdisplay(file, "scenario: 6, scancode = %d, left = %d, down = %d, right = %d, up = %d", scancode, left, down, right, up);

        // Scenario 7: left arrow then down arrow
        scancode = 16'hE06B; // left arrow
        #10; 
        $fdisplay(file, "scenario: 7a, scancode = %d, left = %d, down = %d, right = %d, up = %d", scancode, left, down, right, up);

        #20; // wait for 2 clock cycles
        scancode = 16'hE072; // down arrow
        #10; 
        $fdisplay(file, "scenario: 7b, scancode = %d, left = %d, down = %d, right = %d, up = %d", scancode, left, down, right, up);

        // Scenario 8: right arrow then up arrow
        scancode = 16'hE074; // right arrow
        #10; 
        $fdisplay(file, "scenario: 8a, scancode = %d, left = %d, down = %d, right = %d, up = %d", scancode, left, down, right, up);

        #20; // wait for 2 clock cycles
        scancode = 16'hE075; // up arrow
        #10; 
        $fdisplay(file, "scenario: 8b, scancode = %d, left = %d, down = %d, right = %d, up = %d", scancode, left, down, right, up);

        // Close the output file
        $fclose(file);
        
        // End simulation
        $finish;
    end
endmodule
