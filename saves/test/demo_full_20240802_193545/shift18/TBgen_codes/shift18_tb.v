`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  load;
reg  ena;
reg [1:0] amount;
reg [63:0] data;
wire [63:0] q;

integer file, scenario;
// DUT instantiation
top_module DUT (
    .clk(clk),
    .load(load),
    .ena(ena),
    .amount(amount),
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
    load = 1; ena = 0; amount = 2'b00; data = 64'hA5A5A5A5A5A5A5A5;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end
    load = 0; ena = 1;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end

    // scenario 2
    scenario = 2;
    load = 1; ena = 0; amount = 2'b00; data = 64'hFFFFFFFFFFFFFFFF;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end
    load = 0; ena = 1; amount = 2'b00;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end

    // scenario 3
    scenario = 3;
    load = 1; ena = 0; amount = 2'b00; data = 64'h1234567890ABCDEF;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end
    load = 0; ena = 1; amount = 2'b01;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end

    // scenario 4
    scenario = 4;
    load = 1; ena = 0; amount = 2'b00; data = 64'h0000000000000001;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end
    load = 0; ena = 1; amount = 2'b10;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end

    // scenario 5
    scenario = 5;
    load = 1; ena = 0; amount = 2'b00; data = 64'h8000000000000000;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end
    load = 0; ena = 1; amount = 2'b11;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end

    // scenario 6
    scenario = 6;
    load = 1; ena = 0; amount = 2'b00; data = 64'h1234567890ABCDEF;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end
    load = 0; ena = 1; amount = 2'b10;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end

    // scenario 7
    scenario = 7;
    load = 1; ena = 0; amount = 2'b00; data = 64'hA5A5A5A5A5A5A5A5;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end
    load = 0; ena = 1; amount = 2'b01;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end

    // scenario 8
    scenario = 8;
    load = 1; ena = 0; amount = 2'b00; data = 64'h5555555555555555;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end
    load = 0; ena = 1; amount = 2'b11;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q); #10; 
    repeat (1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, ena = %d, amount = %d, data = %d, q = %d", scenario, clk, load, ena, amount, data, q);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
