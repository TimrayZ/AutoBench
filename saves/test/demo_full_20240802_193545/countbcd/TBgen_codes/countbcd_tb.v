`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
wire [3:1] ena;
wire [15:0] q;

integer file, scenario;

// DUT instantiation
top_module DUT (
	.clk(clk),
	.reset(reset),
	.ena(ena),
	.q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    file = $fopen("TBout.txt", "w");
end

// Scenario Based Test
initial begin

    // Scenario 1
    scenario = 1;
    reset = 1; // Apply active-high reset
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q);
    #10; // Wait for clock cycle
    reset = 0; // Release reset
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; 

    // Scenario 2
    scenario = 2;
    repeat(10) begin
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; // Wait for rising edge 
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; 
    end

    // Scenario 3
    scenario = 3;
    repeat(20) begin
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; // Wait for rising edge 
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; 
    end

    // Scenario 4
    scenario = 4;
    reset = 1; // Apply active-high reset
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q);
    #10; // Wait for clock cycle
    reset = 0; // Release reset
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; 

    // Scenario 5
    scenario = 5;
    repeat(10) begin
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; // Wait for rising edge
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; 
    end

    // Scenario 6
    scenario = 6;
    clk = 0; // Hold clk low
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; // Wait
    end
    clk = 1; // Release clk
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; // Wait for rising edge
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; 

    // Scenario 7
    scenario = 7;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q); #10; // Wait for 50 clock cycles
    reset = 1; // Apply active-high reset
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q);
    #10; // Wait for clock cycle
    reset = 0; // Release reset
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, q = %d", scenario, clk, reset, ena, q);

    $fclose(file);
    $finish;
end

endmodule
