`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
wire [3:0] q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.reset(reset),
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
    reset = 1;  // Set reset high
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); 
    #10;        // Wait for 1 clock cycle
    reset = 0;  // Set reset low
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); 
    #10;        // Wait for 1 clock cycle
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 

    // Scenario 2
    scenario = 2;
    reset = 0;  // Keep reset low
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); 
    repeat(10) begin
        #10;  // Wait for each clock cycle
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    end

    // Scenario 3
    scenario = 3;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10;  // Wait for 1 clock cycle (after 10 increments)
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10;  
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 

    // Scenario 4
    scenario = 4;
    reset = 1;  // Set reset high
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); 
    #10;        // Hold reset high for 1 clock cycle
    reset = 0;  // Set reset low
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); 
    #10;        // Wait for 1 clock cycle
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 

    // Scenario 5
    scenario = 5;
    reset = 0;  // Keep reset low
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); 
    repeat(3) begin
        #10;  // Wait for each clock cycle
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    end

    // Scenario 6
    scenario = 6;
    reset = 1;  // Set reset high
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); 
    #10;        // Hold reset high for 1 clock cycle
    reset = 0;  // Release reset
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); 
    repeat(5) begin
        #10;  // Wait for each clock cycle
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    end

    $fclose(file);
    $finish;
end

endmodule
