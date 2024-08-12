`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  areset;
reg  load;
reg  ena;
reg [3:0] data;
wire [3:0] q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.areset(areset),
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
    areset = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    #10
    areset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10; 

    // scenario 2
    scenario = 2;
    load = 1; 
    data = 4'b1010;
    areset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    #10;
    load = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10;  
    $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10; 

    // scenario 3
    scenario = 3;
    ena = 1;
    areset = 0;
    load = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    repeat(2) begin
        #10;  
        $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10;  
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10; 
    end

    // scenario 4
    scenario = 4;
    load = 1; 
    data = 4'b1100;
    areset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    #10;
    ena = 0; 
    load = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    #10;
    load = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10;  
    $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10; 

    // scenario 5
    scenario = 5;
    areset = 0;
    load = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    #10
    ena = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    repeat(3) begin
        #10;  
        $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10;  
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10; 
    end

    // scenario 6
    scenario = 6;
    areset = 0;
    load = 1;
    data = 4'b1111;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    #10;
    load = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10;  
    ena = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    repeat(2) begin
        #10;  
        $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10;  
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10; 
    end

    // scenario 7
    scenario = 7;
    areset = 0;
    load = 1;
    data = 4'b0011;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    #10;
    load = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10;  
    ena = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    repeat(3) begin
        #10;  
        $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10;  
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10; 
    end

    // scenario 8
    scenario = 8;
    areset = 0;
    load = 1;
    data = 4'b0001;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    #10;
    load = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10;  
    ena = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    repeat(2) begin
        #10;  
        $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10;  
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10; 
    end

    // scenario 9
    scenario = 9;
    areset = 0;
    load = 1;
    data = 4'b1001;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    #10;
    load = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10;  
    ena = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10; 

    // scenario 10
    scenario = 10;
    areset = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    #10;
    areset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    #10;
    ena = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); 
    repeat(3) begin
        #10;  
        $fdisplay(file, "scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q); #10;  
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, load = %d, ena = %d, data = %d, q = %d", scenario, clk, areset, load, ena, data, q);
    end

    $fclose(file);
    $finish;
end

endmodule
