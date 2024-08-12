`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
reg  ena;
wire  pm;
wire [7:0] hh;
wire [7:0] mm;
wire [7:0] ss;

integer file, scenario;

// DUT instantiation
top_module DUT (
	.clk(clk),
	.reset(reset),
	.ena(ena),
	.pm(pm),
	.hh(hh),
	.mm(mm),
	.ss(ss)
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
    reset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss);
    #10;
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss);
        #10;
    end
    
    // Scenario 2
    scenario = 2;
    ena = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss);
    repeat(60) begin
        #10;
        if ((i % 10) == 0) begin
            $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss); #10; 
        end
    end
    ena = 0;

    // Scenario 3
    scenario = 3;
    ena = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss);
    repeat(120) begin
        #10;
        if ((i % 10) == 0) begin
            $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss); #10; 
        end
    end

    // Scenario 4
    scenario = 4;
    ena = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss); #10; 
    repeat(240) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss); #10; // Increment to 2:00:00 PM
    end
    reset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss);
    #10;
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss); #10; 
    
    // Scenario 5
    scenario = 5;
    ena = 1;
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss); #10; 
    repeat(180) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss); #10;
    end
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss); #10; 

    // Scenario 6
    scenario = 6;
    ena = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss);
    repeat(1800) begin // 30 seconds
        #10;
        if (i % 300 == 0) begin // Reset every 30 seconds
            reset = 1;
            $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss); #10;
            reset = 0;
            $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss); #10; 
            $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss); #10; 
        end
    end

    // Scenario 7
    scenario = 7;
    ena = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss); #10; 
    repeat(30) begin // Increment to 12:59:59 PM
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss); #10;
    end
    ena = 0;
    #10;
    ena = 1;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, ena = %d, pm = %d, hh = %d, mm = %d, ss = %d", scenario, clk, reset, ena, pm, hh, mm, ss);

    $fclose(file);
    $finish;
end

endmodule
