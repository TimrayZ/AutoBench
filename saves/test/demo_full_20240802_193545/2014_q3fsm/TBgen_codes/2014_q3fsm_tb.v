`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
reg  s;
reg  w;
wire  z;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.reset(reset),
	.s(s),
	.w(w),
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
    reset = 1; s = 0; w = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
    #10;
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end

    // Scenario 2
    scenario = 2;
    reset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
    #10;
    reset = 0; s = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end

    // Scenario 3
    scenario = 3;
    w = 1; // w = 1 for first clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end
    w = 1; // w = 1 for second clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end
    w = 0; // w = 0 for third clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end

    // Scenario 4
    scenario = 4;
    w = 0; // w = 0 for first clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end
    w = 1; // w = 1 for second clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end
    w = 1; // w = 1 for third clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end

    // Scenario 5
    scenario = 5;
    w = 0; // w = 0 for first clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end
    w = 0; // w = 0 for second clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end
    w = 1; // w = 1 for third clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end

    // Scenario 6
    scenario = 6;
    w = 1; // w = 1 for first clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end
    w = 0; // w = 0 for second clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end
    w = 0; // w = 0 for third clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end
    
    // Scenario 7
    scenario = 7;
    s = 0; // Set s back to 0
    w = 1; // w = 1 for first clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end
    w = 1; // w = 1 for second clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end
    w = 1; // w = 1 for third clock cycle
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end

    // Scenario 8
    scenario = 8;
    reset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
    #10;
    reset = 0; s = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(3) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end

    // Scenario 9
    scenario = 9;
    reset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
    #10;
    reset = 0; s = 1; w = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end

    // Scenario 10
    scenario = 10;
    reset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
    #10;
    reset = 0; s = 1; w = 1; // All 3 cycles w = 1
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z); #10; 
    repeat(3) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, s = %d, w = %d, z = %d", scenario, clk, reset, s, w, z);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
