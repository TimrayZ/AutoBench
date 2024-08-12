`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
reg  w;
wire  z;

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

    // scenario 1: Initialize the system by asserting reset for 1 clock cycle and then de-assert it.
    scenario = 1;
    reset = 1; w = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    reset = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;  
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // scenario 2: Drive input w with 0 for 2 clock cycles in state A.
    scenario = 2;
    w = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    repeat(2) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 
    end

    // scenario 3: Drive input w with 1 for 1 clock cycle in state A.
    scenario = 3;
    w = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // scenario 4: In state B, drive input w with 0 for 1 clock cycle.
    scenario = 4;
    w = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // scenario 5: In state B, drive input w with 1 for 1 clock cycle.
    scenario = 5;
    w = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // scenario 6: In state C, drive input w with 0 for 1 clock cycle.
    scenario = 6;
    w = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // scenario 7: In state C, drive input w with 1 for 1 clock cycle.
    scenario = 7;
    w = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // scenario 8: In state D, drive input w with 0 for 1 clock cycle.
    scenario = 8;
    w = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // scenario 9: In state D, drive input w with 1 for 1 clock cycle.
    scenario = 9;
    w = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // scenario 10: In state E, drive input w with 0 for 1 clock cycle.
    scenario = 10;
    w = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // scenario 11: In state E, drive input w with 1 for 1 clock cycle.
    scenario = 11;
    w = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // scenario 12: In state F, drive input w with 0 for 1 clock cycle.
    scenario = 12;
    w = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z); #10; 

    // scenario 13: In state F, drive input w with 1 for 1 clock cycle.
    scenario = 13;
    w = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, w = %d, z = %d", scenario, clk, reset, w, z);

    $fclose(file);
    $finish;
end

endmodule
