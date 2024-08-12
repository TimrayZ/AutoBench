`timescale 1ns / 1ps
module testbench;
reg  clk;
reg [7:0] d;
reg  areset;
wire [7:0] q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.d(d),
	.areset(areset),
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
    areset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q);
        #10;
    end
    areset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q);
        #10;
    end

    // scenario 2
    scenario = 2;
    d = 8'b10101010;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q);
        #10;
    end

    // scenario 3
    scenario = 3;
    d = 8'b11110000;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q);
        #10;
    end

    // scenario 4
    scenario = 4;
    areset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q); #10; 
    repeat(2) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q);
        #10;
    end
    areset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q);
        #10;
    end

    // scenario 5
    scenario = 5;
    d = 8'b00001111;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q);
        #10;
    end

    // scenario 6
    scenario = 6;
    d = 8'b00110011;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q);
        #10;
    end

    // scenario 7
    scenario = 7;
    d = 8'b11111111;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q);
        #10;
    end

    // scenario 8
    scenario = 8;
    d = 8'b00000000;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q);
        #10;
    end

    // scenario 9
    scenario = 9;
    areset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q);
        #10;
    end
    areset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q);
        #10;
    end

    // scenario 10
    scenario = 10;
    d = 8'b10101010;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, areset = %d, q = %d", scenario, clk, d, areset, q);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
