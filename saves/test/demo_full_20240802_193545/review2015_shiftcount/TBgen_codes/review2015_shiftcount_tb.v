`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  shift_ena;
reg  count_ena;
reg [3:0] data;
wire [3:0] q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.shift_ena(shift_ena),
	.count_ena(count_ena),
	.data(data),
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

    // scenario 1
    scenario = 1;
    shift_ena = 0;
    count_ena = 0;
    data = 4'b0000;
    $fdisplay(file, "scenario: %d, clk = %d, shift_ena = %d, count_ena = %d, data = %d, q = %d", scenario, clk, shift_ena, count_ena, data, q);
    #10; 
    repeat(2) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, shift_ena = %d, count_ena = %d, data = %d, q = %d", scenario, clk, shift_ena, count_ena, data, q);
        #10;
    end

    // scenario 2
    scenario = 2;
    shift_ena = 1;
    data = 4'b1010;
    $fdisplay(file, "scenario: %d, clk = %d, shift_ena = %d, count_ena = %d, data = %d, q = %d", scenario, clk, shift_ena, count_ena, data, q);
    #10; 
    repeat(3) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, shift_ena = %d, count_ena = %d, data = %d, q = %d", scenario, clk, shift_ena, count_ena, data, q);
        #10;
    end

    // scenario 3
    scenario = 3;
    shift_ena = 0;
    count_ena = 1;
    $fdisplay(file, "scenario: %d, clk = %d, shift_ena = %d, count_ena = %d, data = %d, q = %d", scenario, clk, shift_ena, count_ena, data, q);
    #10; 
    repeat(4) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, shift_ena = %d, count_ena = %d, data = %d, q = %d", scenario, clk, shift_ena, count_ena, data, q);
        #10;
    end

    // scenario 4
    scenario = 4;
    shift_ena = 1;
    count_ena = 1;
    $fdisplay(file, "scenario: %d, clk = %d, shift_ena = %d, count_ena = %d, data = %d, q = %d", scenario, clk, shift_ena, count_ena, data, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, shift_ena = %d, count_ena = %d, data = %d, q = %d", scenario, clk, shift_ena, count_ena, data, q); #10; 

    // scenario 5
    scenario = 5;
    shift_ena = 1;
    count_ena = 0;
    data = 4'b0011; // Initialize register
    $fdisplay(file, "scenario: %d, clk = %d, shift_ena = %d, count_ena = %d, data = %d, q = %d", scenario, clk, shift_ena, count_ena, data, q);
    #10; 
    shift_ena = 0; // Now count down
    count_ena = 1;
    $fdisplay(file, "scenario: %d, clk = %d, shift_ena = %d, count_ena = %d, data = %d, q = %d", scenario, clk, shift_ena, count_ena, data, q);
    #10; 
    repeat(3) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, shift_ena = %d, count_ena = %d, data = %d, q = %d", scenario, clk, shift_ena, count_ena, data, q);
        #10;
    end

    // scenario 6
    scenario = 6;
    shift_ena = 1;
    count_ena = 0;
    data = 4'b1111; // Change data
    $fdisplay(file, "scenario: %d, clk = %d, shift_ena = %d, count_ena = %d, data = %d, q = %d", scenario, clk, shift_ena, count_ena, data, q);
    #10; 
    repeat(2) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, shift_ena = %d, count_ena = %d, data = %d, q = %d", scenario, clk, shift_ena, count_ena, data, q);
        #10;
    end

    // scenario 7
    scenario = 7;
    shift_ena = 0;
    count_ena = 0;
    $fdisplay(file, "scenario: %d, clk = %d, shift_ena = %d, count_ena = %d, data = %d, q = %d", scenario, clk, shift_ena, count_ena, data, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, shift_ena = %d, count_ena = %d, data = %d, q = %d", scenario, clk, shift_ena, count_ena, data, q);
    
    // Ending the simulation
    $fclose(file);
    $finish;
end

endmodule
