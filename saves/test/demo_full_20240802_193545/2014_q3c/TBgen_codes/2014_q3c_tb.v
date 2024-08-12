`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  x;
reg [2:0] y;
wire  Y0;
wire  z;

integer file, scenario;

// DUT instantiation
top_module DUT (
    .clk(clk),
    .x(x),
    .y(y),
    .Y0(Y0),
    .z(z)
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
    y = 3'b000; x = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z); #10; 
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z);
        #10;
    end   

    // Scenario 2
    scenario = 2;
    y = 3'b000; x = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z); #10; 
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z);
        #10;
    end

    // Scenario 3
    scenario = 3;
    y = 3'b001; x = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z); #10; 
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z);
        #10;
    end

    // Scenario 4
    scenario = 4;
    y = 3'b001; x = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z); #10; 
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z);
        #10;
    end

    // Scenario 5
    scenario = 5;
    y = 3'b010; x = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z); #10; 
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z);
        #10;
    end

    // Scenario 6
    scenario = 6;
    y = 3'b010; x = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z); #10; 
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z);
        #10;
    end

    // Scenario 7
    scenario = 7;
    y = 3'b011; x = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z); #10; 
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z);
        #10;
    end

    // Scenario 8
    scenario = 8;
    y = 3'b011; x = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z); #10; 
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z);
        #10;
    end

    // Scenario 9
    scenario = 9;
    y = 3'b100; x = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z); #10; 
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z);
        #10;
    end

    // Scenario 10
    scenario = 10;
    y = 3'b100; x = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z); #10; 
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, x = %d, y = %d, Y0 = %d, z = %d", scenario, clk, x, y, Y0, z);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
