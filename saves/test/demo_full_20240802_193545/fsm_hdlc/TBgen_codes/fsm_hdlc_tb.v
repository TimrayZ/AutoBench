`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
reg  in;
wire  disc;
wire  flag;
wire  err;

integer file, scenario;

// DUT instantiation
top_module DUT (
	.clk(clk),
	.reset(reset),
	.in(in),
	.disc(disc),
	.flag(flag),
	.err(err)
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
    reset = 1; in = 0; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err); #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err);
    reset = 0; #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err);
    in = 0; #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err);
    in = 1; repeat(6) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err); #10; 
    end

    // Scenario 2
    scenario = 2;
    in = 1; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err); #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err);
    in = 1; #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err);
    in = 1; #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err);
    in = 1; #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err);
    in = 0; #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err); #10; 
    
    // Scenario 3
    scenario = 3;
    reset = 1; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err); #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err);
    reset = 0; #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err);
    in = 1; repeat(8) begin
        #10;
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err); #10; 
    end

    // Scenario 4
    scenario = 4;
    in = 0; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err); #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err);
    in = 1; repeat(5) begin
        #10;
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err); #10; 
    end

    // Scenario 5
    scenario = 5;
    in = 0; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err); #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err);
    in = 1; repeat(6) begin
        #10;
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err);
    end
    in = 0; #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err);
    in = 0; #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err);
    in = 1; repeat(5) begin
        #10;
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, in = %d, disc = %d, flag = %d, err = %d", scenario, clk, reset, in, disc, flag, err);
    end

    $fclose(file);
    $finish;
end

endmodule
