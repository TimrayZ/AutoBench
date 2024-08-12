`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
wire  shift_ena;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.reset(reset),
	.shift_ena(shift_ena)
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
    reset = 1; // Assert reset high
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
    #10; 
    repeat(4) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
        #10; 
    end
    reset = 0; // Release reset
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
    #10;

    // Scenario 2
    scenario = 2;
    reset = 1; // Assert reset high
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
    #10; 
    repeat(4) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
        #10; 
    end
    reset = 0; // Release reset
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
    #10;

    // Scenario 3
    scenario = 3;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
    #10; 
    reset = 1; // Assert reset high
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
    #10; 
    repeat(4) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
        #10; 
    end
    reset = 0; // Release reset
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
    #10;

    // Scenario 4
    scenario = 4;
    reset = 1; // Assert reset high
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
    #10; 
    reset = 0; // Release reset
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
    #10;

    // Observe for 6 cycles
    repeat(6) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
        #10; 
    end

    // Scenario 5
    scenario = 5;
    reset = 1; // Assert reset high
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
    #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
        #10; 
    end
    reset = 0; // Release reset
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
    #10;

    repeat(4) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, shift_ena = %d", scenario, clk, reset, shift_ena);
        #10; 
    end

    $fclose(file);
    $finish;
end

endmodule
