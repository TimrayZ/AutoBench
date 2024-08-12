`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  w;
reg  R;
reg  E;
reg  L;
wire  Q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.w(w),
	.R(R),
	.E(E),
	.L(L),
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

    // scenario 1
    scenario = 1;
    L = 1; E = 0; R = 0; w = 0; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
    end
    L = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
    end 

    // scenario 2
    scenario = 2;
    L = 1; R = 8'b10101010; E = 0; w = 0; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
    end
    L = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
    end 

    // scenario 3
    scenario = 3;
    E = 1; w = 1; L = 0; R = 0; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
    end
    w = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q); #10;  
    repeat(2) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
    end 

    // scenario 4
    scenario = 4;
    w = 1; L = 0; R = 0; E = 1; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
        $fdisplay(file, "scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q); #10;  
        w = w + 1; // Changing w value to simulate continuous shifting
    end 

    // scenario 5
    scenario = 5;
    E = 1; w = 1; L = 0; R = 0; 
    repeat(2) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
    end 
    L = 1; R = 8'b11111111; 
    $fdisplay(file, "scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
    end 
    L = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
    end 

    // scenario 6
    scenario = 6;
    E = 1; L = 0; R = 0; w = 0; 
    repeat(3) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
    end 
    E = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q); #10;  
    repeat(2) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
    end 

    // scenario 7
    scenario = 7;
    E = 1; L = 1; R = 0; w = 0; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
    end 
    L = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
    end 

    // scenario 8
    scenario = 8;
    L = 1; E = 1; R = 0; w = 0; 
    repeat(2) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
    end 
    L = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q); #10;  
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, w = %d, R = %d, E = %d, L = %d, Q = %d", scenario, clk, w, R, E, L, Q);
        #10;
    end 

    $fclose(file);
    $finish;
end

endmodule
