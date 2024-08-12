`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
reg [31:0] in;
wire [31:0] out;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.reset(reset),
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
    reset = 1; in = 32'b00000000000000000000000000000000;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
        #10;
    end
    reset = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out); #10;

    // Scenario 2
    scenario = 2;
    in = 32'b11111111111111111111111111111111;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
    #10;
    in = 32'b11111111111111111111111111111110;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
        #10;
    end

    // Scenario 3
    scenario = 3;
    in = 32'b11111111111111111111111111111100;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
    #10;
    in = 32'b11111111111111111111111111111000;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
        #10;
    end

    // Scenario 4
    scenario = 4;
    in = 32'b11111111111111111111111111111101;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
    #10;
    in = 32'b11111111111111111111111111111111;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
        #10;
    end

    // Scenario 5
    scenario = 5;
    reset = 1; in = 32'b00000000000000000000000000000000;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
        #10;
    end
    reset = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out); #10;

    // Scenario 6
    scenario = 6;
    in = 32'b10101010101010101010101010101010;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
    #10;
    in = 32'b10101010101010101010101010101000;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
        #10;
    end

    // Scenario 7
    scenario = 7;
    in = 32'b01010101010101010101010101010101;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
    #10;
    in = 32'b01010101010101010101010101010000;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
        #10;
    end

    // Scenario 8
    scenario = 8;
    in = 32'b00000000000000000000000000000001;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
    #10;
    in = 32'b00000000000000000000000000000000;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
        #10;
    end

    // Scenario 9
    scenario = 9;
    in = 32'b11111111111111111111111111111111;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out); #10; 
    repeat(2) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
        #10;
    end 

    // Scenario 10
    scenario = 10;
    reset = 1; in = 32'b11111111111111111111111111111111;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, in = %d, out = %d", scenario, clk, reset, in, out);
        #10;
    end
    reset = 0; 
    #10;

    $fclose(file);
    $finish;
end

endmodule
