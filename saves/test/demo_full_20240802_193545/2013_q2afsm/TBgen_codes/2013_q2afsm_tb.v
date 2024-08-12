`timescale 1ns / 1ps

module tb_top_module;

    // Parameters
    reg clk;
    reg resetn;
    reg [3:1] r;
    wire [3:1] g;

    // Instantiate the DUT
    top_module DUT (
        .clk(clk),
        .resetn(resetn),
        .r(r),
        .g(g)
    );

    // File Handling
    integer file;

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units period
    end

    // Test Cases
    initial begin
        // Open the file
        file = $fopen("TBout.txt", "w");

        // Scenario 1: Reset the FSM
        resetn = 0; // Active low reset
        #10; // Wait for 1 clock cycle
        resetn = 1; // Release reset
        #10; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 1, clk = %d, resetn = %d, r = %b, g = %b", clk, resetn, r, g);
        
        // Scenario 2: Device 1 grant
        r = 3'b100; // r1=1, r2=0, r3=0
        #20; // Wait for 2 clock cycles
        $fdisplay(file, "scenario: 2, clk = %d, resetn = %d, r = %b, g = %b", clk, resetn, r, g);

        // Scenario 3: Device 2 grant
        r = 3'b010; // r1=0, r2=1, r3=0
        #20; // Wait for 2 clock cycles
        $fdisplay(file, "scenario: 3, clk = %d, resetn = %d, r = %b, g = %b", clk, resetn, r, g);

        // Scenario 4: Device 3 grant
        r = 3'b001; // r1=0, r2=0, r3=1
        #20; // Wait for 2 clock cycles
        $fdisplay(file, "scenario: 4, clk = %d, resetn = %d, r = %b, g = %b", clk, resetn, r, g);

        // Scenario 5: Priority handling
        r = 3'b110; // r1=1, r2=1, r3=0
        #30; // Wait for 3 clock cycles
        $fdisplay(file, "scenario: 5, clk = %d, resetn = %d, r = %b, g = %b", clk, resetn, r, g);
        r = 3'b010; // r1=0, r2=1, r3=0
        #20; // Wait for 2 clock cycles
        $fdisplay(file, "scenario: 5a, clk = %d, resetn = %d, r = %b, g = %b", clk, resetn, r, g);

        // Scenario 6: Device 3 without higher priority
        r = 3'b001; // r1=0, r2=0, r3=1
        #20; // Wait for 2 clock cycles
        $fdisplay(file, "scenario: 6, clk = %d, resetn = %d, r = %b, g = %b", clk, resetn, r, g);

        // Scenario 7: Conflicting requests
        r = 3'b111; // r1=1, r2=1, r3=1
        #40; // Wait for 4 clock cycles
        $fdisplay(file, "scenario: 7, clk = %d, resetn = %d, r = %b, g = %b", clk, resetn, r, g);
        
        // Verify priority during conflicting requests (extended)
        #20; // Wait for an additional 2 clock cycles to check state after conflicting requests
        
        // Scenario 8: Idle state
        r = 3'b000; // All requests are low
        #30; // Wait for 3 clock cycles
        $fdisplay(file, "scenario: 8, clk = %d, resetn = %d, r = %b, g = %b", clk, resetn, r, g);

        // Close the file
        $fclose(file);
        $finish; // End simulation
    end

endmodule
