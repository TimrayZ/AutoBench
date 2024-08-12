`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  in;
reg  areset;
wire  out;

integer file, scenario;
// DUT instantiation
top_module DUT (
    .clk(clk),
    .in(in),
    .areset(areset),
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

    // Scenario 1: Reset the DUT
    scenario = 1;
    areset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out);
    #10; 
    areset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out); #10; 
    
    // Scenario 2: Apply input 0 from state B
    scenario = 2;
    in = 0;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out); #10; 
    
    // Scenario 3: Apply input 1 from state B
    scenario = 3;
    in = 1;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out); #10; 
    
    // Scenario 4: Apply input 0 from state A
    scenario = 4;
    in = 0;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out);
    #10; // Assume state A after previous input and clk
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out); #10; 
    
    // Scenario 5: Apply input 1 from state A
    scenario = 5;
    in = 1;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out); #10; 
    
    // Scenario 6: Reset the DUT again
    scenario = 6;
    areset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out);
    #10; 
    areset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out); #10; 
    
    // Scenario 7: Apply input 0 then input 1 from state B
    scenario = 7;
    in = 0;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out);
    #10;
    in = 1;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out); 
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out); #10; 
    
    // Scenario 8: Apply input 0 twice from state A
    scenario = 8;
    in = 0;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out);
    #10; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, areset = %d, out = %d", scenario, clk, in, areset, out);
    
    $fclose(file);
    $finish;
end

endmodule
