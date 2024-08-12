`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  load;
reg [1:0] ena;
reg [99:0] data;
wire [99:0] q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.load(load),
	.ena(ena),
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
    load = 1;
    data = 100'b101010101000000111110000000011110000111100001111000011110000111111000000000111111111000000000111111111;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q);    
    repeat(1) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q); #10; 
    end
    load = 0;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q);    
    repeat(1) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q); #10; 
    end

    // scenario 2
    scenario = 2;
    ena = 2'b10; // left rotation
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q);    
    repeat(1) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q); #10; 
    end
    ena = 2'b00; // no operation
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q);    
    repeat(1) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q); #10; 
    end

    // scenario 3
    scenario = 3;
    ena = 2'b01; // right rotation
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q);    
    repeat(1) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q); #10; 
    end
    ena = 2'b11; // no operation
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q);    
    repeat(1) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q); #10; 
    end

    // scenario 4
    scenario = 4;
    load = 1;
    data = 100'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q);    
    repeat(1) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q); #10; 
    end
    load = 0;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q);    
    repeat(1) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q); #10; 
    end

    // scenario 5
    scenario = 5;
    ena = 2'b10; // left rotation
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q);    
    repeat(1) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q); #10; 
    end
    ena = 2'b01; // right rotation
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q);    
    repeat(1) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q); #10; 
    end
    ena = 2'b00; // no operation
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q);    
    repeat(1) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, load, ena, data, q);
    end

    $fclose(file);
    $finish;
end

endmodule
