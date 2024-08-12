`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
wire [3:0] q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
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
    clk = 0; reset = 0;
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
        #10;
    end
    reset = 1; // activate reset
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10; 
    reset = 0; // deactivate reset
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10;

    // scenario 2
    scenario = 2;
    reset = 0;
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
        #10;
    end

    // scenario 3
    scenario = 3;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
        #10;
    end
    reset = 1; // activate reset
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10; 
    reset = 0; // deactivate reset
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10;

    // scenario 4
    scenario = 4;
    reset = 0;
    repeat(10) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
        #10;
    end

    // scenario 5
    scenario = 5;
    reset = 0;
    repeat(10) begin
        if (clk == 1) begin
            reset = 1; // activate reset every 5 clock cycles
            $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
            $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
            #10;
            reset = 0; 
        end
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
        #10;
    end

    // scenario 6
    scenario = 6;
    reset = 0;
    repeat(20) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
        #10;
    end
    reset = 1; // activate reset
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10; 
    reset = 0; // deactivate reset
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10;

    $fclose(file);
    $finish;
end

endmodule
