`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  d;
wire  q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.d(d),
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
    d = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
    end

    // scenario 2
    scenario = 2;
    d = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
    #10; // d = 1, clk = 1
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
    #10; // clk = 0
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
    end

    // scenario 3
    scenario = 3;
    d = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
    #10; // d = 1, clk = 1
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
    #10; // clk = 0
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
    end

    // scenario 4
    scenario = 4;
    d = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
    #10; // d = 0, clk = 1
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
    #10; // clk = 0
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
    end

    // scenario 5
    scenario = 5;
    d = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
    #10; // d = 0, clk = 1
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
    #10; // clk = 0
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
    end

    // scenario 6
    scenario = 6;
    d = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
    #10; // d = 1, clk = 1
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
    #10; // clk = 0
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
    end

    // scenario 7
    scenario = 7;
    d = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
    #10; // d = 0, clk = 1
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
    #10; // clk = 0
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
    end

    // scenario 8
    scenario = 8;
    d = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
    repeat(5) begin
        #10; // d = 1, clk toggles
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, q = %d", scenario, clk, d, q);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
