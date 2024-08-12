`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
wire [4:0] q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.reset(reset),
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
    reset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    repeat(2) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    end
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    
    // scenario 2
    scenario = 2;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    repeat(31) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    end

    // scenario 3
    scenario = 3;
    reset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10;
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    
    // scenario 4
    scenario = 4;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    repeat(10) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    end

    // scenario 5
    scenario = 5;
    reset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10;
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);

    $fclose(file);
    $finish;
end

endmodule
