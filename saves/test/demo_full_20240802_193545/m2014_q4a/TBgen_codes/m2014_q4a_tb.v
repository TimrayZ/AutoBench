`timescale 1ns / 1ps
module testbench;
reg  d;
reg  ena;
wire  q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.d(d),
	.ena(ena),
	.q(q)
);

initial begin
    file = $fopen("TBout.txt", "w");
end
// Scenario Based Test
initial begin

    // scenario 1
    scenario = 1;
    d = 0; ena = 1;  
    $fdisplay(file, "scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q); 
    #10; 
    $fdisplay(file, "[check]scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q);
    #10;

    // scenario 2
    scenario = 2;
    d = 1; ena = 1;  
    $fdisplay(file, "scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q); 
    #10; 
    $fdisplay(file, "[check]scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q);
    #10;

    // scenario 3
    scenario = 3;
    d = 0; ena = 0;  
    $fdisplay(file, "scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q); 
    #10; 
    $fdisplay(file, "[check]scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q);
    #10;

    // scenario 4
    scenario = 4;
    d = 1; ena = 0;  
    $fdisplay(file, "scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q); 
    #10; 
    $fdisplay(file, "[check]scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q);
    #10;

    // scenario 5
    scenario = 5;
    ena = 1;  
    $fdisplay(file, "scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q); 
    #10; 
    $fdisplay(file, "[check]scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q);
    #10;

    // scenario 6
    scenario = 6;
    d = 0; ena = 1;  
    $fdisplay(file, "scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q); 
    #10; 
    $fdisplay(file, "[check]scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q);
    #10;

    // scenario 7
    scenario = 7;
    ena = 0;  
    $fdisplay(file, "scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q); 
    #10; 
    $fdisplay(file, "[check]scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q);
    #10;

    // scenario 8
    scenario = 8;
    ena = 1; d = 1;  
    $fdisplay(file, "scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q); 
    #10; 
    $fdisplay(file, "[check]scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q);
    #10;

    // scenario 9
    scenario = 9;
    d = 0; ena = 1;  
    $fdisplay(file, "scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q); 
    #10; 
    $fdisplay(file, "[check]scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q);
    #10;

    // scenario 10
    scenario = 10;
    ena = 0; d = 1;  
    $fdisplay(file, "scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q); 
    #10; 
    $fdisplay(file, "[check]scenario: %d, d = %d, ena = %d, q = %d", scenario, d, ena, q);
    #10;

    $fclose(file);
    $finish;
end

endmodule
