`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  a;
wire  q;

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

    // scenario 1
    scenario = 1;
    a = 'x';
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q);
    #10; 
    a = 0; // At 5ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 

    // scenario 2
    scenario = 2;
    a = 0; // At 10ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 

    // scenario 3
    scenario = 3; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; // At 15ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 

    // scenario 4
    scenario = 4; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; // At 20ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    
    // scenario 5
    scenario = 5; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; // At 25ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    
    // scenario 6
    scenario = 6; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; // At 30ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 

    // scenario 7
    scenario = 7; 
    a = 1; // At 35ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    
    // scenario 8
    scenario = 8; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; // At 40ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    
    // scenario 9
    scenario = 9; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; // At 45ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 

    // scenario 10
    scenario = 10; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; // At 50ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    
    // scenario 11
    scenario = 11; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; // At 55ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    
    // scenario 12
    scenario = 12; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; // At 60ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    
    // scenario 13
    scenario = 13; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; // At 65ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    
    // scenario 14
    scenario = 14; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; // At 70ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    
    // scenario 15
    scenario = 15; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; // At 75ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 

    // scenario 16
    scenario = 16; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; // At 80ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    
    // scenario 17
    scenario = 17; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; // At 85ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    
    // scenario 18
    scenario = 18; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; // At 90ns
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, q = %d", scenario, clk, a, q);

    $fclose(file);
    $finish;
end

endmodule
