`timescale 1ns / 1ps
module testbench;
reg clk;
reg load;
reg [255:0] data;
wire [255:0] q;

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
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    data = 256'd0; 
    #10; 
    load = 0; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
        #10;
    end

    // Scenario 2
    scenario = 2;
    load = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    data = 256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    #10; 
    load = 0;
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
        #10;
    end
    
    // Scenario 3
    scenario = 3;
    load = 1;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    data = 256'b0000000000000000000000000000000000000000000000111100000000000000;
    #10; 
    load = 0; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
        #10;
    end

    // Scenario 4
    scenario = 4;
    load = 1;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    data = 256'b0000000000000000000000000000000000000000000000000000000100000000;
    #10; 
    load = 0; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
        #10;
    end

    // Scenario 5
    scenario = 5;
    load = 1;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    data = 256'b1000000000000000000000000000000000000000000000000000000000000001;
    #10; 
    load = 0; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
        #10;
    end

    // Scenario 6
    scenario = 6;
    load = 1;
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    data = 256'b0000000000000000000000000000000000000000000000000000000000000001;
    #10; 
    load = 0; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
        #10;
    end

    // Scenario 7
    scenario = 7;
    load = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    data = 256'b0000000000000000000000000111110000000000000000000000000000000000;
    #10; 
    load = 0; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
        #10;
    end

    // Scenario 8
    scenario = 8;
    load = 0;
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
        #10;
    end

    // Scenario 9
    scenario = 9;
    load = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    data = 256'b1001100010010110100101001111100010001100001010001110010110101011;
    #10; 
    load = 0; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
        #10;
    end

    // Scenario 10
    scenario = 10;
    load = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
    data = 256'd1;
    #10; 
    load = 0; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, load = %d, data = %d, q = %d", scenario, clk, load, data, q);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
