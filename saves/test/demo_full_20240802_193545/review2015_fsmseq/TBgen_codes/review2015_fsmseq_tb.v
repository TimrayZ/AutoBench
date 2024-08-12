`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
reg  data;
wire  start_shifting;

integer file, scenario;

// DUT instantiation
top_module DUT (
	.clk(clk),
	.reset(reset),
	.data(data),
	.start_shifting(start_shifting)
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
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    repeat(2) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    end
    reset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    repeat(4) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    end

    // Scenario 2
    scenario = 2;
    reset = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    reset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10;
    repeat(1) begin
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    end

    // Scenario 3
    scenario = 3;
    reset = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    repeat(2) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    end
    reset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    repeat(2) begin
        #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    end

    // Scenario 4
    scenario = 4;
    reset = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    reset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    repeat(2) begin
        #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    end

    // Scenario 5
    scenario = 5;
    reset = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    repeat(2) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    end
    reset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    repeat(2) begin
        #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    end

    // Scenario 6
    scenario = 6;
    reset = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    reset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    repeat(2) begin
        #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    end

    // Scenario 7
    scenario = 7;
    reset = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    reset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    repeat(3) begin
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
        data = {$random}%2;  
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    end

    // Scenario 8
    scenario = 8;
    reset = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    reset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    #10; 
    data = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    repeat(3) begin
        #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting); #10; 
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, start_shifting = %d", scenario, clk, reset, data, start_shifting);
    end

    $fclose(file);
    $finish;
end

endmodule
