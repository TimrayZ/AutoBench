`timescale 1ns / 1ps
module testbench;
reg  clk;
reg [7:0] d;
reg  reset;
wire [7:0] q;

integer file, scenario;

// DUT instantiation
top_module DUT (
	.clk(clk),
	.d(d),
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
    // Scenario 1
    scenario = 1;
    reset = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10;
    reset = 0;  

    // Scenario 2
    scenario = 2;
    d = 8'b10101010;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    repeat(2) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q); #10; 
    end

    // Scenario 3
    scenario = 3;
    d = 8'b11110000;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    repeat(2) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q); #10; 
    end

    // Scenario 4
    scenario = 4;
    reset = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10;
    reset = 0;  

    // Scenario 5
    scenario = 5;
    d = 8'b00001111;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    repeat(2) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q); #10; 
    end

    // Scenario 6
    scenario = 6;
    d = 8'b11111111;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    repeat(2) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q); #10; 
    end

    // Scenario 7
    scenario = 7;
    d = 8'b00000000;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    repeat(2) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q); #10; 
    end

    // Scenario 8
    scenario = 8;
    d = 8'b10101010;  
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    repeat(6) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    end

    $fclose(file);
    $finish;
end

endmodule
