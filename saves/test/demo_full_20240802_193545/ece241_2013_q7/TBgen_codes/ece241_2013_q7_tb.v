`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  j;
reg  k;
wire  Q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.j(j),
	.k(k),
	.Q(Q)
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
    j = 0; k = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); 
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); #10; 
    
    // Scenario 2
    scenario = 2;
    j = 0; k = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); 
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); #10; 
    
    // Scenario 3
    scenario = 3;
    j = 1; k = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); 
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); #10; 
    
    // Scenario 4
    scenario = 4;
    j = 1; k = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); 
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); #10; 
    
    // Scenario 5
    scenario = 5;
    clk = 0; j = 0; k = 0; // deassert clock
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); #10; // maintain reset condition for 1 clock cycle
    clk = 1; // assert clock
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); 
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); #10; 
    
    // Scenario 6
    scenario = 6;
    j = 0; k = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); 
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); #10; 
    
    j = 1; k = 0; // next clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); 
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); #10; 
    
    // Scenario 7
    scenario = 7;
    j = 1; k = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); 
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); #10; 

    j = 0; k = 0; // Toggle to 0
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q); 
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, Q = %d", scenario, clk, j, k, Q);

    $fclose(file);
    $finish;
end

endmodule
