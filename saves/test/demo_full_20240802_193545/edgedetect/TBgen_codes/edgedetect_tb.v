`timescale 1ns / 1ps
module testbench;
reg  clk;
reg [7:0] in;
wire [7:0] pedge;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.in(in),
	.pedge(pedge)
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
    in = 8'b00000000; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
    #10; 
    in = 8'b00000001; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
        #10;
    end

    // scenario 2
    scenario = 2;
    in = 8'b00000001; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
    #10; 
    in = 8'b00000000; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
    #10; 
    in = 8'b00000001; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
        #10;
    end

    // scenario 3
    scenario = 3;
    in = 8'b00000000; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
    #10; 
    in = 8'b00000010; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
        #10;
    end

    // scenario 4
    scenario = 4;
    in = 8'b00000011; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
    #10; 
    in = 8'b00000101; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
        #10;
    end

    // scenario 5
    scenario = 5;
    in = 8'b11111111; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
    #10; 
    in = 8'b00000000; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
    #10; 
    in = 8'b00001111; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
        #10;
    end

    // scenario 6
    scenario = 6;
    in = 8'b00000000; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
    #10; 
    in = 8'b11111111; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
    #10; 
    in = 8'b00000000; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
        #10;
    end

    // scenario 7
    scenario = 7;
    in = 8'b01010101; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
    #10; 
    in = 8'b01010111; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
    #10; 
    in = 8'b01010100; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
        #10;
    end

    // scenario 8
    scenario = 8;
    in = 8'b00000000; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
    #10; 
    in = 8'b11111111; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
    #10; 
    in = 8'b00000001; 
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, pedge = %d", scenario, clk, in, pedge);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
