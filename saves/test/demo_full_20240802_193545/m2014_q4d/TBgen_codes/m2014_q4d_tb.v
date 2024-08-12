`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  in;
wire  out;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.in(in),
	.out(out)
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
    in = 0;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out); #10; 
    
    // Scenario 2
    scenario = 2;
    in = 1;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out); #10; 

    // Scenario 3
    scenario = 3;
    in = 0;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10; // Hold clk = 1
    clk = 0;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10; // clk = 0
    clk = 1;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out); #10; 

    // Scenario 4
    scenario = 4;
    in = 1;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out); #10; 

    // Scenario 5
    scenario = 5;
    in = 0;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10; // Hold clk = 1
    in = 1;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10;
    clk = 0;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10; // clk = 0
    clk = 1;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out); #10; 

    // Scenario 6
    scenario = 6;
    in = 1;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out); #10; 

    // Scenario 7
    scenario = 7;
    in = 1;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10;
    clk = 1;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10;
    in = 0;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out); #10; 

    // Scenario 8
    scenario = 8;
    in = 1;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10; // Hold clk = 1
    in = 0;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10; // clk = 0
    clk = 1;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, out = %d", scenario, clk, in, out);

    $fclose(file);
    $finish;
end

endmodule
