`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
reg [3:1] s;
wire  fr3;
wire  fr2;
wire  fr1;
wire  dfr;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.reset(reset),
	.s(s),
	.fr3(fr3),
	.fr2(fr2),
	.fr1(fr1),
	.dfr(dfr)
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
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr); #10;
    reset = 0;
    s = 3'b000;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr);
    #10; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr); #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr); #10; 
    
    // Scenario 2
    scenario = 2;
    s = 3'b111; // Above s[3]
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr);
    repeat(3) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr); #10; 
    end
    
    // Scenario 3
    scenario = 3;
    s = 3'b110; // Between s[3] and s[2]
    fr1 = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr);
    repeat(3) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr); #10; 
    end
    fr1 = 0; // Reset fr1 state after scenario

    // Scenario 4
    scenario = 4;
    s = 3'b100; // Between s[2] and s[1]
    fr1 = 1;
    fr2 = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr);
    repeat(3) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr); #10; 
    end
    fr1 = 0; // Reset fr1 state after scenario
    fr2 = 0; // Reset fr2 state after scenario

    // Scenario 5
    scenario = 5;
    s = 3'b000; // Below s[1]
    fr1 = 1;
    fr2 = 1;
    fr3 = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr);
    repeat(4) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr); #10; 
    end
    fr1 = 0; // Reset fr1 state after scenario
    fr2 = 0; // Reset fr2 state after scenario
    fr3 = 0; // Reset fr3 state after scenario

    // Scenario 6
    scenario = 6;
    s = 3'b110; // Between s[3] and s[2]
    fr1 = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr);
    repeat(2) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr); #10; 
    end
    fr1 = 0; // Reset fr1 state after scenario

    // Scenario 7
    scenario = 7;
    s = 3'b000; // Below s[1]
    fr1 = 1;
    fr2 = 1;
    fr3 = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr);
    repeat(2) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr); #10; 
    end
    fr1 = 0; // Reset fr1 state after scenario
    fr2 = 0; // Reset fr2 state after scenario
    fr3 = 0; // Reset fr3 state after scenario

    // Scenario 8
    scenario = 8;
    reset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr); #10;
    reset = 0;
    s = 3'b111; // Above s[3]
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr);
    repeat(3) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, fr3 = %d, fr2 = %d, fr1 = %d, dfr = %d", scenario, clk, reset, s, fr3, fr2, fr1, dfr);
    end

    $fclose(file);
    $finish;
end

endmodule
