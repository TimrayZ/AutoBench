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

    // scenario 1
    scenario = 1;
    load = 1;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    data = 512'b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010;
    #10; // Simulate clock high
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    #10; // Simulate clock low
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q); #10; 

    // scenario 2
    scenario = 2;
    load = 0;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    #10; // Simulate clock high
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    #10; // Simulate clock low
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q); #10; 

    // scenario 3
    scenario = 3;
    load = 0;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    data = 512'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    #10; // Simulate clock high
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    #10; // Simulate clock low
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q); #10; 

    // scenario 4
    scenario = 4;
    load = 0;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    data = 512'b1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111;
    #10; // Simulate clock high
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    #10; // Simulate clock low
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q); #10; 

    // scenario 5
    scenario = 5;
    load = 1;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    data = 512'b11001100110011001100110011001100110011001100110011001100110011001100110011001100110011001100110011;
    #10; // Simulate clock high
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    #10; // Simulate clock low
    $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q); #10; 
    
    // scenario 6
    scenario = 6;
    load = 0;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    repeat(10) begin
        #10; // Simulate clock high
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
        #10; // Simulate clock low
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    end

    $fclose(file);
    $finish;
end

endmodule
