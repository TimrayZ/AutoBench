`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  resetn;
reg  in;
wire  out;

integer file, scenario;

// DUT instantiation
top_module DUT (
	.clk(clk),
	.resetn(resetn),
	.in(in),
	.out(out)
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
    resetn = 0; // Apply active low reset
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out);
    #10; 
    resetn = 1; // Release reset
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out); #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out); #10; 
    
    // scenario 2
    scenario = 2;
    in = 1; // Provide input
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out);
    #10; // Hold clk low
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out); #10; // Transition clk to high
    $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out); #10; 
    
    // scenario 3
    scenario = 3;
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out); #10; // Wait for clk rising edge
    in = 0; // Change input
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out);
    #10; 
    repeat(3) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out);
        #10;
    end

    // scenario 4
    scenario = 4;
    in = 1; // Assert input before rising edge
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out); #10; 
    
    // scenario 5
    scenario = 5;
    repeat(4) begin
        in = ~in; // Toggle input
        $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out);
        #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out); #10; 
    end

    // scenario 6
    scenario = 6;
    resetn = 0; // Hold reset low
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out);
    #10; 
    resetn = 1; // Release reset with in = 1
    in = 1;
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out); #10; 
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out); #10; 
    
    // scenario 7
    scenario = 7;
    in = 0; // Apply in = 0
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out);
    repeat(5) begin
        #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, in = %d, out = %d", scenario, clk, resetn, in, out);
    end

    $fclose(file);
    $finish;
end

endmodule
