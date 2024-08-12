`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  a;
wire [2:0] q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.a(a),
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
    a = 1;
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q);
    #10; // Wait for the rising edge
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q);
    #10;

    // Scenario 2
    scenario = 2;
    a = 1;
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q);
        #10;
    end

    // Scenario 3
    scenario = 3;
    a = 1;
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q);
        #10;
    end

    // Scenario 4
    scenario = 4;
    a = 1;
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q);
        #10;
    end

    // Scenario 5
    scenario = 5;
    a = 0; // Change a
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q);
        #10;
    end

    // Scenario 6
    scenario = 6;
    a = 0;
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q);
        #10;
    end

    // Scenario 7
    scenario = 7;
    a = 0;
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q);
        #10;
    end

    // Scenario 8
    scenario = 8;
    a = 1; // Change a
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q);
        #10;
    end

    // Scenario 9
    scenario = 9;
    a = 1;
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
