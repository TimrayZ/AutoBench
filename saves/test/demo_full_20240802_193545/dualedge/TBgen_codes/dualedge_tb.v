`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  d;
wire  q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.d(d),
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
    d = 0;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q); #10; 
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
    end

    // Scenario 2
    scenario = 2;
    d = 1;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q); #10; 
    repeat(20) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
        clk = ~clk; // Toggle the clock
    end

    // Scenario 3
    scenario = 3;
    d = 0;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q); #10; 
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
        clk = ~clk; // Toggle the clock
    end

    // Scenario 4
    scenario = 4;
    d = 1;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
    end
    d = 0;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q); #10; // Next rising edge will capture d = 0

    // Scenario 5
    scenario = 5;
    d = 0;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q); #10 d = 1; // Change to 1 at 1 time unit
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
    #10 d = 0; // Change back to 0 at 2 time units
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
    end

    // Scenario 6
    scenario = 6;
    d = 1;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q); #10; 
    repeat(3) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
    end
    d = 0;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q); #10; 
    repeat(3) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
    end

    // Scenario 7
    scenario = 7;
    repeat(15) begin
        d = {$random} % 2; // Random d value (0 or 1)
        $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
