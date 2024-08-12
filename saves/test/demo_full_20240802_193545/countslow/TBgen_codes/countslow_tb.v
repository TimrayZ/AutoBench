`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  slowena;
reg  reset;
wire [3:0] q;

integer file, scenario;

// DUT instantiation
top_module DUT (
	.clk(clk),
	.slowena(slowena),
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

    // Scenario 1
    scenario = 1;
    slowena = 0; reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q); #10; 
    $fdisplay(file, "scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q);
    #10; 
    reset = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q);
    #10; 
    reset = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q); #10; 

    // Scenario 2
    scenario = 2;
    slowena = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q);
    repeat(10) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q); #10; 
    end

    // Scenario 3
    scenario = 3;
    slowena = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q); #10; 
    end
    slowena = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q); #10; 
    end

    // Scenario 4
    scenario = 4;
    reset = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q);
    #10; // reset high for 1 clock cycle
    reset = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q);
    repeat(10) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q); #10; 
    end

    // Scenario 5
    scenario = 5;
    slowena = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q);
    repeat(20) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q); #10; 
        if ($time == 100) begin // clock cycle 10
            reset = 1; 
            $fdisplay(file, "scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q);
            #10; // reset high for 1 clock cycle
            reset = 0; 
            $fdisplay(file, "scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q); #10; 
        end
    end

    // Scenario 6
    scenario = 6;
    slowena = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q);
    repeat(20) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q); #10; 
        if ($time % 50 == 0) begin // every 5 clock cycles
            reset = 1; 
            $fdisplay(file, "scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q);
            #10; // reset high for 1 clock cycle
            reset = 0; 
            $fdisplay(file, "scenario: %d, clk = %d, slowena = %d, reset = %d, q = %d", scenario, clk, slowena, reset, q);
        end
    end
    
    $fclose(file);
    $finish;
end

endmodule
