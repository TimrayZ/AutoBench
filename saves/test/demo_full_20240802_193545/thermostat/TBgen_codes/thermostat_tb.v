`timescale 1ns / 1ps

module tb_top_module;
    // Inputs
    reg mode;
    reg too_cold;
    reg too_hot;
    reg fan_on;
    
    // Outputs
    wire heater;
    wire aircon;
    wire fan;

    // Instantiate the DUT
    top_module uut (
        .mode(mode),
        .too_cold(too_cold),
        .too_hot(too_hot),
        .fan_on(fan_on),
        .heater(heater),
        .aircon(aircon),
        .fan(fan)
    );

    // File handle for exporting data
    integer file;

    initial begin
        // Open the file for writing
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        mode = 1; too_cold = 1; too_hot = 0; fan_on = 0;
        #10;  // Wait for 5 clock cycles
        $fdisplay(file, "scenario: 1, mode = %d, too_cold = %d, too_hot = %d, fan_on = %d, heater = %d, aircon = %d, fan = %d", mode, too_cold, too_hot, fan_on, heater, aircon, fan);

        // Scenario 2
        mode = 1; too_cold = 0; too_hot = 0; fan_on = 1;
        #10;  // Wait for 5 clock cycles
        $fdisplay(file, "scenario: 2, mode = %d, too_cold = %d, too_hot = %d, fan_on = %d, heater = %d, aircon = %d, fan = %d", mode, too_cold, too_hot, fan_on, heater, aircon, fan);

        // Scenario 3
        mode = 0; too_cold = 0; too_hot = 1; fan_on = 0;
        #10;  // Wait for 5 clock cycles
        $fdisplay(file, "scenario: 3, mode = %d, too_cold = %d, too_hot = %d, fan_on = %d, heater = %d, aircon = %d, fan = %d", mode, too_cold, too_hot, fan_on, heater, aircon, fan);

        // Scenario 4
        mode = 0; too_cold = 0; too_hot = 0; fan_on = 1;
        #10;  // Wait for 5 clock cycles
        $fdisplay(file, "scenario: 4, mode = %d, too_cold = %d, too_hot = %d, fan_on = %d, heater = %d, aircon = %d, fan = %d", mode, too_cold, too_hot, fan_on, heater, aircon, fan);
        
        // Scenario 5
        mode = 1; too_cold = 1; too_hot = 1; fan_on = 0;
        #10;  // Wait for 5 clock cycles
        $fdisplay(file, "scenario: 5, mode = %d, too_cold = %d, too_hot = %d, fan_on = %d, heater = %d, aircon = %d, fan = %d", mode, too_cold, too_hot, fan_on, heater, aircon, fan);

        // Scenario 6
        mode = 0; too_cold = 1; too_hot = 1; fan_on = 1;
        #10;  // Wait for 5 clock cycles
        $fdisplay(file, "scenario: 6, mode = %d, too_cold = %d, too_hot = %d, fan_on = %d, heater = %d, aircon = %d, fan = %d", mode, too_cold, too_hot, fan_on, heater, aircon, fan);

        // Scenario 7
        for (integer i = 0; i < 10; i++) begin
            mode = (i % 2);
            too_cold = 1; too_hot = 0; fan_on = 0;
            #1;  // Wait for 1 clock cycle to allow signals to settle
            $fdisplay(file, "scenario: 7, mode = %d, too_cold = %d, too_hot = %d, fan_on = %d, heater = %d, aircon = %d, fan = %d", mode, too_cold, too_hot, fan_on, heater, aircon, fan);
        end

        // Scenario 8
        mode = 1; too_cold = 0; too_hot = 0; fan_on = 0;
        #2;  // Wait for 2 clock cycles
        fan_on = 1;
        #10;  // Wait for 5 clock cycles
        $fdisplay(file, "scenario: 8, mode = %d, too_cold = %d, too_hot = %d, fan_on = %d, heater = %d, aircon = %d, fan = %d", mode, too_cold, too_hot, fan_on, heater, aircon, fan);

        // Scenario 9
        mode = 0; too_cold = 0; too_hot = 1; fan_on = 1;
        #10;  // Wait for 5 clock cycles
        too_hot = 0;
        #10;  // Wait for 5 clock cycles
        $fdisplay(file, "scenario: 9, mode = %d, too_cold = %d, too_hot = %d, fan_on = %d, heater = %d, aircon = %d, fan = %d", mode, too_cold, too_hot, fan_on, heater, aircon, fan);

        // Scenario 10
        mode = 1; too_cold = 1; too_hot = 0; fan_on = 1;
        #3;  // Wait for 3 clock cycles
        fan_on = 0;
        #3;  // Wait for 3 clock cycles
        $fdisplay(file, "scenario: 10, mode = %d, too_cold = %d, too_hot = %d, fan_on = %d, heater = %d, aircon = %d, fan = %d", mode, too_cold, too_hot, fan_on, heater, aircon, fan);
        
        // Close the file
        $fclose(file);
        $finish;
    end
endmodule
