`timescale 1ns/1ps

module tb_top_module;

    // Inputs
    reg cpu_overheated;
    reg arrived;
    reg gas_tank_empty;

    // Outputs
    wire shut_off_computer;
    wire keep_driving;

    // DUT instantiation
    top_module DUT (
        .cpu_overheated(cpu_overheated),
        .arrived(arrived),
        .gas_tank_empty(gas_tank_empty),
        .shut_off_computer(shut_off_computer),
        .keep_driving(keep_driving)
    );

    // File descriptor
    integer fd;

    initial begin
        // Open the output file
        fd = $fopen("TBout.txt", "w");

        // Scenario 1
        cpu_overheated = 1; arrived = 0; gas_tank_empty = 0;
        #1;  
        $fdisplay(fd, "scenario: 1, cpu_overheated = %d, shut_off_computer = %d, arrived = %d, gas_tank_empty = %d, keep_driving = %d", cpu_overheated, shut_off_computer, arrived, gas_tank_empty, keep_driving);

        // Scenario 2
        cpu_overheated = 0; arrived = 1; gas_tank_empty = 1;
        #1;  
        $fdisplay(fd, "scenario: 2, cpu_overheated = %d, shut_off_computer = %d, arrived = %d, gas_tank_empty = %d, keep_driving = %d", cpu_overheated, shut_off_computer, arrived, gas_tank_empty, keep_driving);

        // Scenario 3
        cpu_overheated = 0; arrived = 0; gas_tank_empty = 0;
        #1;  
        $fdisplay(fd, "scenario: 3, cpu_overheated = %d, shut_off_computer = %d, arrived = %d, gas_tank_empty = %d, keep_driving = %d", cpu_overheated, shut_off_computer, arrived, gas_tank_empty, keep_driving);

        // Scenario 4
        cpu_overheated = 1; arrived = 1; gas_tank_empty = 0;
        #1;  
        $fdisplay(fd, "scenario: 4, cpu_overheated = %d, shut_off_computer = %d, arrived = %d, gas_tank_empty = %d, keep_driving = %d", cpu_overheated, shut_off_computer, arrived, gas_tank_empty, keep_driving);

        // Scenario 5
        cpu_overheated = 0; arrived = 0; gas_tank_empty = 1;
        #1;  
        $fdisplay(fd, "scenario: 5, cpu_overheated = %d, shut_off_computer = %d, arrived = %d, gas_tank_empty = %d, keep_driving = %d", cpu_overheated, shut_off_computer, arrived, gas_tank_empty, keep_driving);
        
        // Scenario 6
        cpu_overheated = 1; arrived = 0; gas_tank_empty = 1;
        #1;  
        $fdisplay(fd, "scenario: 6, cpu_overheated = %d, shut_off_computer = %d, arrived = %d, gas_tank_empty = %d, keep_driving = %d", cpu_overheated, shut_off_computer, arrived, gas_tank_empty, keep_driving);

        // Scenario 7
        cpu_overheated = 0; arrived = 1; gas_tank_empty = 1;
        #1;  
        $fdisplay(fd, "scenario: 7, cpu_overheated = %d, shut_off_computer = %d, arrived = %d, gas_tank_empty = %d, keep_driving = %d", cpu_overheated, shut_off_computer, arrived, gas_tank_empty, keep_driving);

        // Scenario 8
        cpu_overheated = 1; arrived = 1; gas_tank_empty = 1;
        #1;  
        $fdisplay(fd, "scenario: 8, cpu_overheated = %d, shut_off_computer = %d, arrived = %d, gas_tank_empty = %d, keep_driving = %d", cpu_overheated, shut_off_computer, arrived, gas_tank_empty, keep_driving);

        // Scenario 9
        cpu_overheated = 1; arrived = 0; gas_tank_empty = 0;
        #1;  
        $fdisplay(fd, "scenario: 9a, cpu_overheated = %d, shut_off_computer = %d, arrived = %d, gas_tank_empty = %d, keep_driving = %d", cpu_overheated, shut_off_computer, arrived, gas_tank_empty, keep_driving);
        
        arrived = 1; // changing arrived
        #1;  
        $fdisplay(fd, "scenario: 9b, cpu_overheated = %d, shut_off_computer = %d, arrived = %d, gas_tank_empty = %d, keep_driving = %d", cpu_overheated, shut_off_computer, arrived, gas_tank_empty, keep_driving);

        // Close the file
        $fclose(fd);
    end

endmodule
