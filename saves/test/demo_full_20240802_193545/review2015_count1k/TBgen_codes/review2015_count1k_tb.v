`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
wire [9:0] q;

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
    reset = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); 
    #10; 
    reset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); 
    #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    
    // scenario 2
    scenario = 2;
    repeat(1000) begin
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10;
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    end
    
    // scenario 3
    scenario = 3;
    repeat(500) begin
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10;
        if (q == 500) begin
            reset = 1;  
            $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
            #10; 
            reset = 0;  
            $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
            $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
            break;
        end
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    end
    
    // scenario 4
    scenario = 4;
    repeat(500) begin
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10;
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    end

    // scenario 5
    scenario = 5;
    repeat(1500) begin
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10;
        if (q == 249 || q == 500 || q == 999) begin
            reset = 1;  
            $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
            #10;
            reset = 0;  
            $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
        end
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
    end

    // scenario 6
    scenario = 6;
    reset = 1;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10; 
    reset = 0;  
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    #10; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; // Delay to observe no counting
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 

    // scenario 7
    scenario = 7;
    repeat(1000) begin
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10;
        if (scenario == 1000) begin
            reset = 1;  
            $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
            #10;
            reset = 0;  
            $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
            $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
            break;
        end
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, q = %d", scenario, clk, reset, q);
    end

    $fclose(file);
    $finish;
end

endmodule
