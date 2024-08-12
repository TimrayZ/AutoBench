`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  load;
reg [511:0] data;
wire [511:0] q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.load(load),
	.data(data),
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
    load = 1;
    data = 512'b0;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q); #10; 

    // Scenario 2
    scenario = 2;
    load = 1;
    data = 512'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000; 
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q); #10; 

    // Scenario 3
    scenario = 3;
    load = 1;
    data = 512'b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010; 
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q); #10; 

    // Scenario 4
    scenario = 4;
    load = 1;
    data = 512'b011011011110100101111111101010011111000011111100001010100001110110110101011; 
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q); #10; 

    // Scenario 5
    scenario = 5;
    load = 1;
    data = 512'b11111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000; 
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q); #10; 

    // Scenario 6
    scenario = 6;
    load = 0;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q); #10; 
    end

    // Scenario 7
    scenario = 7;
    load = 1;
    data = 512'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000001100000000000000000000000; // 'pulsar' initial state
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    
    // Observing the output for several cycles
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q); #10; 
    end

    // Scenario 8
    scenario = 8;
    load = 1;
    data = 512'b1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000; 
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    end

    $fclose(file);
    $finish;
end

endmodule
