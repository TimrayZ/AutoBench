`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
reg  x;
wire  z;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.reset(reset),
	.x(x),
	.z(z)
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

    // scenario 1
    scenario = 1;
    reset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
    #10;
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
        #10;
    end

    // scenario 2
    scenario = 2;
    x = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
    #10;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
        #10;
    end

    // scenario 3
    scenario = 3;
    x = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
    #10;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
        #10;
    end

    // scenario 4
    scenario = 4;
    x = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
    #10;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
        #10;
    end

    // scenario 5
    scenario = 5;
    x = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
    #10;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
        #10;
    end

    // scenario 6
    scenario = 6;
    x = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
    #10;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
        #10;
    end

    // scenario 7
    scenario = 7;
    x = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
    #10;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
        #10;
    end

    // scenario 8
    scenario = 8;
    x = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
    #10;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
        #10;
    end

    // scenario 9
    scenario = 9;
    x = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
    #10;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
        #10;
    end

    // scenario 10
    scenario = 10;
    x = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
    #10;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
        #10;
    end

    // scenario 11
    scenario = 11;
    x = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
    #10;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
        #10;
    end

    // scenario 12
    scenario = 12;
    x = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
    #10;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, x = %d, z = %d", scenario, clk, reset, x, z);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
