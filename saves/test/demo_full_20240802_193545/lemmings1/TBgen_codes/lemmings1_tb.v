`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  areset;
reg  bump_left;
reg  bump_right;
wire  walk_left;
wire  walk_right;

integer file, scenario;

// DUT instantiation
top_module DUT (
	.clk(clk),
	.areset(areset),
	.bump_left(bump_left),
	.bump_right(bump_right),
	.walk_left(walk_left),
	.walk_right(walk_right)
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
    areset = 1;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right);
        #10;
    end
    areset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right);
        #10;
    end

    // Scenario 2
    scenario = 2;
    bump_left = 1;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right); #10; 
    bump_right = 0;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right);
        #10;
    end
    bump_left = 0; // Reset for the next scenario

    // Scenario 3
    scenario = 3;
    bump_right = 1;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right); #10; 
    bump_left = 0;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right);
        #10;
    end
    bump_right = 0; // Reset for the next scenario

    // Scenario 4
    scenario = 4;
    bump_left = 1;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right); #10; 
    bump_right = 0;
    repeat(2) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right);
        #10;
    end
    bump_left = 0;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right);
        #10;
    end
    bump_left = 1;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right);
        #10;
    end
    bump_left = 0; // Reset for the next scenario

    // Scenario 5
    scenario = 5;
    bump_left = 1;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right); #10; 
    bump_right = 1;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right);
        #10;
    end
    bump_left = 0;
    bump_right = 0; // Reset for the next scenario

    // Scenario 6
    scenario = 6;
    bump_left = 1;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right); #10; 
    bump_right = 0;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right);
        #10;
    end
    bump_left = 0; // Reset for the next scenario

    // Scenario 7
    scenario = 7;
    bump_left = 0;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right); #10; 
    bump_right = 1;
    repeat(2) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right);
        #10;
    end
    bump_right = 0; // Reset for the next scenario

    // Scenario 8
    scenario = 8;
    areset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right);
        #10;
    end
    areset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, bump_left = %d, bump_right = %d, walk_left = %d, walk_right = %d", scenario, clk, areset, bump_left, bump_right, walk_left, walk_right);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
