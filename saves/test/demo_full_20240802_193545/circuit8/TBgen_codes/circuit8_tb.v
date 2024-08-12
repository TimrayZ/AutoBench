`timescale 1ns / 1ps
module testbench;
reg  clock;
reg  a;
wire  p;
wire  q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clock(clock),
	.a(a),
	.p(p),
	.q(q)
);
// Clock generation
initial begin
    clock = 0;
    forever #5 clock = ~clock;
end

initial begin
    file = $fopen("TBout.txt", "w");
end

// Scenario Based Test
initial begin
    // Scenario 1
    scenario = 1;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 

    // Scenario 2
    scenario = 2;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 

    // Scenario 3
    scenario = 3;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 
    end

    // Scenario 4
    scenario = 4;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 
    end

    // Scenario 5
    scenario = 5;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 
    end

    // Scenario 6
    scenario = 6;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 
    end

    // Scenario 7
    scenario = 7;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 

    // Scenario 8
    scenario = 8;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 
    end

    // Scenario 9
    scenario = 9;
    a = 1;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 
    end

    // Scenario 10
    scenario = 10;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 

    // Scenario 11
    scenario = 11;
    a = 1;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 

    // Scenario 12
    scenario = 12;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 
    end

    // Scenario 13
    scenario = 13;
    a = 1;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 
    end

    // Scenario 14
    scenario = 14;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 

    // Scenario 15
    scenario = 15;
    a = 1;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 
    end

    // Scenario 16
    scenario = 16;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 
    end

    // Scenario 17
    scenario = 17;
    a = 1;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 

    // Scenario 18
    scenario = 18;
    a = 1;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 
    end

    // Scenario 19
    scenario = 19;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 

    // Scenario 20
    scenario = 20;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 

    // Scenario 21
    scenario = 21;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 

    // Scenario 22
    scenario = 22;
    a = 1;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 

    // Scenario 23
    scenario = 23;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 

    // Scenario 24
    scenario = 24;
    a = 0;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 

    // Scenario 25
    scenario = 25;
    a = 1;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q); #10; 
    end

    // Scenario 26
    scenario = 26;
    a = 1;
    $fdisplay(file, "scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);
    #10; 
    $fdisplay(file, "[check]scenario: %d, clock = %d, a = %d, p = %d, q = %d", scenario, clock, a, p, q);

    $fclose(file);
    $finish;
end

endmodule
