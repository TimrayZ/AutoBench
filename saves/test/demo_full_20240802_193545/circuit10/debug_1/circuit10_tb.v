`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  a;
reg  b;
wire  q;
wire  state;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.a(a),
	.b(b),
	.q(q),
	.state(state)
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
    a = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 1'bx; #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state);
    clk = 1; #10; 
    clk = 0; a = 0; b = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 2
    scenario = 2;
    clk = 1; a = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 0; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 3
    scenario = 3;
    clk = 1; a = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 0; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 
    
    // scenario 4
    scenario = 4;
    clk = 1; a = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 0; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 5
    scenario = 5;
    clk = 1; a = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 1; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 6
    scenario = 6;
    clk = 1; a = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 0; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 7
    scenario = 7;
    clk = 1; a = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 1; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 8
    scenario = 8;
    clk = 1; a = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 0; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 9
    scenario = 9;
    clk = 1; a = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 1; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 10
    scenario = 10;
    clk = 1; a = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 1; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 11
    scenario = 11;
    clk = 1; a = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 1; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 12
    scenario = 12;
    clk = 1; a = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 0; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 13
    scenario = 13;
    clk = 1; a = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 1; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 14
    scenario = 14;
    clk = 1; a = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 0; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 15
    scenario = 15;
    clk = 1; a = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 0; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 16
    scenario = 16;
    clk = 1; a = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 0; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 17
    scenario = 17;
    clk = 1; a = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 0; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 18
    scenario = 18;
    clk = 1; a = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 0; #10; 
    clk = 0; $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); #10; 

    // scenario 19
    scenario = 19;
    clk = 1; a = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state); 
    b = 0; #10; 
    clk = 0; #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, a = %d, b = %d, q = %d, state = %d", scenario, clk, a, b, q, state);

    $fclose(file);
    $finish;
end

endmodule
