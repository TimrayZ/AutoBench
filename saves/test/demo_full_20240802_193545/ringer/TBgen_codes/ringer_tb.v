`timescale 1ns / 1ps

module tb_top_module; 
    // Inputs
    reg ring; 
    reg vibrate_mode; 

    // Outputs
    wire ringer; 
    wire motor; 

    // Instantiate the DUT
    top_module DUT (
        .ring(ring), 
        .vibrate_mode(vibrate_mode), 
        .ringer(ringer), 
        .motor(motor)
    );

    // File Descriptor
    integer fd;

    initial begin
        // Open file for writing
        fd = $fopen("TBout.txt", "w");

        // Scenario 1
        ring = 0; 
        vibrate_mode = 0; 
        #10;
        $fdisplay(fd, "scenario: 1, ring = %d, vibrate_mode = %d, ringer = %d, motor = %d", ring, vibrate_mode, ringer, motor);

        // Scenario 2
        ring = 0; 
        vibrate_mode = 1; 
        #10;
        $fdisplay(fd, "scenario: 2, ring = %d, vibrate_mode = %d, ringer = %d, motor = %d", ring, vibrate_mode, ringer, motor);

        // Scenario 3
        ring = 1; 
        vibrate_mode = 0; 
        #10;
        $fdisplay(fd, "scenario: 3, ring = %d, vibrate_mode = %d, ringer = %d, motor = %d", ring, vibrate_mode, ringer, motor);

        // Scenario 4
        ring = 1; 
        vibrate_mode = 1; 
        #10;
        $fdisplay(fd, "scenario: 4, ring = %d, vibrate_mode = %d, ringer = %d, motor = %d", ring, vibrate_mode, ringer, motor);

        // Scenario 5
        ring = 1; 
        vibrate_mode = 0; 
        #5;
        $fdisplay(fd, "scenario: 5a, ring = %d, vibrate_mode = %d, ringer = %d, motor = %d", ring, vibrate_mode, ringer, motor);
        vibrate_mode = 1; 
        #5;
        $fdisplay(fd, "scenario: 5b, ring = %d, vibrate_mode = %d, ringer = %d, motor = %d", ring, vibrate_mode, ringer, motor);

        // Scenario 6
        ring = 0; 
        vibrate_mode = 1; 
        #5; 
        $fdisplay(fd, "scenario: 6a, ring = %d, vibrate_mode = %d, ringer = %d, motor = %d", ring, vibrate_mode, ringer, motor);
        #5; 
        $fdisplay(fd, "scenario: 6b, ring = %d, vibrate_mode = %d, ringer = %d, motor = %d", ring, vibrate_mode, ringer, motor);

        // Scenario 7
        for (integer i = 0; i < 4; i = i + 1) begin
            {ring, vibrate_mode} = i;
            #5;
            $fdisplay(fd, "scenario: 7, ring = %d, vibrate_mode = %d, ringer = %d, motor = %d", ring, vibrate_mode, ringer, motor);
        end

        // Close file
        $fclose(fd);
        $finish;
    end
endmodule
