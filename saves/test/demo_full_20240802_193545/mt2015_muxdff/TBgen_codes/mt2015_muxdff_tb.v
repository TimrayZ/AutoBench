`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  L;
reg  q_in;
reg  r_in;
wire  Q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.L(L),
	.q_in(q_in),
	.r_in(r_in),
	.Q(Q)
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
    L = 1; r_in = 3'b101; // Binary '101'
    $fdisplay(file, "scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q);
    #10;
    L = 0;
    $fdisplay(file, "scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q);
    #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q); #10; 

    // Scenario 2
    scenario = 2;
    L = 0; q_in = 0; r_in = 3'b011; // Binary '011'
    $fdisplay(file, "scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q);
    repeat(3) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q); #10; 
    end

    // Scenario 3
    scenario = 3;
    L = 1; r_in = 3'b110; // Binary '110'
    $fdisplay(file, "scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q);
    #10;
    L = 0;
    $fdisplay(file, "scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q);
    repeat(3) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q); #10; 
    end

    // Scenario 4
    scenario = 4;
    L = 0; q_in = 3'b111; // Binary '111'
    $fdisplay(file, "scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q);
    repeat(6) begin
        r_in = (clk % 2 == 0) ? 3'b000 : 3'b001; // Toggle between binary '000' and '001'
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q); #10; 
    end

    // Scenario 5
    scenario = 5;
    L = 1; r_in = 3'b010; // Binary '010'
    $fdisplay(file, "scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q);
    #10;
    L = 0;
    $fdisplay(file, "scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q);
    repeat(5) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q); #10; 
    end

    // Scenario 6
    scenario = 6;
    L = 0; r_in = 3'b100; // Binary '100'
    $fdisplay(file, "scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q);
    repeat(10) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q); #10; 
    end

    // Scenario 7
    scenario = 7;
    r_in = 3'b111; // Binary '111'
    L = 0;
    $fdisplay(file, "scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q);
    repeat(4) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q); #10; 
    end

    // Scenario 8
    scenario = 8;
    L = 1; r_in = 3'b010; // Binary '010'
    q_in = 0; // Start with 0
    $fdisplay(file, "scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q);
    repeat(6) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, L = %d, q_in = %d, r_in = %d, Q = %d", scenario, clk, L, q_in, r_in, Q);
        q_in = ~q_in; // Toggle q_in every cycle
    end

    $fclose(file);
    $finish;
end

endmodule
