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

    // scenario 1
    scenario = 1;
    reset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10; // while clk = 0
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10; // clk goes low to high
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q); #10; 

    // scenario 2
    scenario = 2;
    d = 8'b00000001; // d = 1
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10; // after 1 clock cycle of reset = 0
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q); #10; 

    // scenario 3
    scenario = 3;
    d = 8'b11111111; // d = 255
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10; // apply negative edge transition of clk
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10; // wait for 1 clock cycle
    d = 8'b10101010; // d = 170
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10; // apply another negative edge of clk
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q); #10; 

    // scenario 4
    scenario = 4;
    reset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10; // wait 1 clock cycle
    reset = 0;
    d = 8'b00000000; // d = 0
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10; // apply a negative edge of clk
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q); #10; 

    // scenario 5
    scenario = 5;
    d = 8'b01010101; // d = 85
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10; // apply a negative edge transition of clk
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10; // after 1 clock cycle
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q); #10; 

    // scenario 6
    scenario = 6;
    reset = 0; 
    d = 8'b11110000; // d = 240
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10; // after 1 clock cycle
    reset = 1; // set reset = 1 for 1 clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10;
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10; // wait for the next negative edge of clk
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q); #10; 

    // scenario 7
    scenario = 7;
    d = 8'b00001111; // d = 15
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10; // apply a negative edge of clk
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q); #10; 
    d = 8'b00110011; // change d to 51
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);
    #10; #10; // after 2 clock cycles
    $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, reset = %d, q = %d", scenario, clk, d, reset, q);

    $fclose(file);
    $finish;
end

endmodule
