`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  resetn;
reg  x;
reg  y;
wire  f;
wire  g;

integer file, scenario;
// DUT instantiation
top_module DUT (
    .clk(clk),
    .resetn(resetn),
    .x(x),
    .y(y),
    .f(f),
    .g(g)
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
    resetn = 0;
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g);
        #10;
    end

    // Scenario 2
    scenario = 2;
    resetn = 1; // De-assert resetn
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g); #10;
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g); #10; 
    
    // Scenario 3
    scenario = 3;
    x = 1; y = 0; // Setting initial values
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g); #10; 
    
    x = 0; $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g); #10; 
    
    x = 1; $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g); #10; 
    
    // Scenario 4
    scenario = 4;
    y = 1; // Set y to 1
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g); #10; 
    
    // Scenario 5
    scenario = 5;
    y = 0; // De-assert y
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g); #10; 
    end
    
    // Scenario 6
    scenario = 6;
    resetn = 0; // Assert resetn again
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g);
    end
    resetn = 1; // Release resetn
    #10;
    
    // Scenario 7
    scenario = 7;
    x = 1; y = 0; // Setting values for x and y
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g); #10; 
    
    x = 0; $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g); #10; 
    
    x = 1; $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g); #10; 
    
    y = 0; $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g);
    
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, x = %d, y = %d, f = %d, g = %d", scenario, clk, resetn, x, y, f, g);
    end

    $fclose(file);
    $finish;
end

endmodule
