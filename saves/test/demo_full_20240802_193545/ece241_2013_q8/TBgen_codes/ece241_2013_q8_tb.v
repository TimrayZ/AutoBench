`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  aresetn;
reg  x;
wire  z;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.aresetn(aresetn),
	.x(x),
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

    // scenario 1
    scenario = 1;
    aresetn = 0;
    $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z); #10;
    aresetn = 1;
    x = 0;
    $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z); #10; 
    repeat(3) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);
        #10;
    end

    // scenario 2
    scenario = 2;
    x = 1;
    $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);
    #10;
    x = 0;
    $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);
    #10;

    // scenario 3
    scenario = 3;
    x = 1;
    $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);
    #10;

    // scenario 4
    scenario = 4;
    x = 1;
    $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);
    #10;
    x = 0;
    repeat(2) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);
        #10;
    end

    // scenario 5
    scenario = 5;
    x = 0;
    $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);
    #10;
    x = 1;
    repeat(2) begin
        $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);
        #10;
    end

    // scenario 6
    scenario = 6;
    x = 1;
    $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);
    #10;

    // scenario 7
    scenario = 7;
    aresetn = 0;
    $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z); #10;
    aresetn = 1;
    x = 1;
    $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);
    #10;
    x = 0;
    repeat(2) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);
        #10;
    end

    // scenario 8
    scenario = 8;
    x = 1;
    $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);
    #10;
    x = 0;
    $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z); #10; 

    // scenario 9
    scenario = 9;
    x = 1;
    repeat(3) begin
        $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);
        #10;
    end
    x = 0;
    repeat(3) begin
        $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);
        #10;
    end

    // scenario 10
    scenario = 10;
    x = 1;
    repeat(2) begin
        $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);
        #10;
    end
    x = 0;
    $fdisplay(file, "scenario: %d, clk = %d, aresetn = %d, x = %d, z = %d", scenario, clk, aresetn, x, z);

    $fclose(file);
    $finish;
end

endmodule
