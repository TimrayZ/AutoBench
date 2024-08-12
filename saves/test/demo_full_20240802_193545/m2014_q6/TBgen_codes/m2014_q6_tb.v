`timescale 1ns / 1ps
module testbench;
reg clk;
reg reset;
reg w;
wire z;

integer file, scenario;
// DUT instantiation
top_module DUT (
    .clk(clk),
    .reset(reset),
    .w(w),
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

    // Scenario 1
    scenario = 1;
    reset = 1; w = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // Scenario 2
    scenario = 2;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; // After 2 clock cycles
    w = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // Scenario 3
    scenario = 3;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; // After 1 clock cycle
    w = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // Scenario 4
    scenario = 4;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; // After 1 clock cycle in State D
    w = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // Scenario 5
    scenario = 5;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; // After 1 clock cycle in State F
    w = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // Scenario 6
    scenario = 6;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; // After 1 clock cycle in State D
    w = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // Scenario 7
    scenario = 7;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; // After 1 clock cycle in State A
    w = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // Scenario 8
    scenario = 8;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; // After 1 clock cycle in State A
    w = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    repeat(2) begin
        #10;
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 
    end

    // Scenario 9
    scenario = 9;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; // After 1 clock cycle in State C
    w = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // Scenario 10
    scenario = 10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; // After 1 clock cycle in State E
    w = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    repeat(2) begin
        #10;
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 
    end
    w = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);

    $fclose(file);
    $finish;
end

endmodule
