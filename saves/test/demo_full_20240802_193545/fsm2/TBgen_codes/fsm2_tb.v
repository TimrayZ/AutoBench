`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  j;
reg  k;
reg  areset;
wire  out;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.j(j),
	.k(k),
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

    // Scenario 1: Initialize the DUT by setting areset to high for 1 clock cycle.
    scenario = 1;
    areset = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out);
        #10;
    end
    areset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out);
    #10;

    // Scenario 2: Set j=0 and k=0 for 3 clock cycles, verifying that the output remains consistent.
    scenario = 2;
    j = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    k = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    repeat(3) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out);
        #10;
    end

    // Scenario 3: Set j=1 for 1 clock cycle and check the system's response in the following clock cycle.
    scenario = 3;
    j = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    k = 0; // maintaining k=0
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out);
        #10;
    end
    // Check output next clock cycle
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out);
        #10;
    end

    // Scenario 4: Set k=1 for 1 clock cycle while maintaining j=0 for the previous clock. Observe the output after this transition.
    scenario = 4;
    j = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    k = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out);
        #10;
    end
    // Next clock cycle
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out);
        #10;
    end

    // Scenario 5: Set j=0 for 1 clock cycle, followed by j=1 for 1 clock cycle, and observe output changes over 3 clock cycles.
    scenario = 5;
    j = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    k = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out);
        #10;
    end
    // Set j to 1 the next cycle
    j = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    repeat(2) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out);
        #10;
    end

    // Scenario 6: Set k=0 for 2 clock cycles while keeping j=1 from the previous test.
    scenario = 6;
    j = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    k = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    repeat(2) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out);
        #10;
    end

    // Scenario 7: During clock cycle 1, set areset to high again to reset the state of the DUT, and then set areset to low after one clock cycle.
    scenario = 7;
    areset = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out);
        #10;
    end
    areset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out);
    #10;

    // Scenario 8: Set both j=1 and k=1 for 1 clock cycle, and observe the output in the next clock cycle.
    scenario = 8;
    j = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    k = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out);
        #10;
    end
    // Next clock cycle
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, j = %d, k = %d, areset = %d, out = %d", scenario, clk, j, k, areset, out);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
