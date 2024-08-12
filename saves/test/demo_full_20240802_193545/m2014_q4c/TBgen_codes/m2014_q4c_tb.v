`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  d;
reg  r;
wire  q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.d(d),
	.r(r),
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
    r = 0; d = 0;
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q);
        #10;
    end
    d = 1;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q); #10;  
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q);
        #10;
    end

    // scenario 2
    scenario = 2;
    r = 1; d = 0;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q); 
    #10;
    r = 0;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q);
        #10;
    end

    // scenario 3
    scenario = 3;
    r = 0; d = 1;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q);
        #10;
    end

    // scenario 4
    scenario = 4;
    r = 1;
    repeat(3) begin
        $fdisplay(file, "scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q); #10;  
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q);
        #10;
    end
    d = 1;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q);
        #10;
    end
    r = 0;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q);
        #10;
    end

    // scenario 5
    scenario = 5;
    d = 0; r = 1;
    repeat(2) begin
        $fdisplay(file, "scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q); #10;  
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q);
        #10;
    end
    r = 0; 
    d = 1;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q);
        #10;
    end

    // scenario 6
    scenario = 6;
    r = 1; 
    repeat(4) begin
        d = (d == 0) ? 1 : 0;
        $fdisplay(file, "scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q); #10;  
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q);
        #10;
    end

    // scenario 7
    scenario = 7;
    r = 0; d = 0;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q);
        #10;
    end
    d = 1;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q);
        #10;
    end
    d = 0;
    $fdisplay(file, "scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, d = %d, r = %d, q = %d", scenario, clk, d, r, q);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
