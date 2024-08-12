`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  resetn;
reg [1:0] byteena;
reg [15:0] d;
wire [15:0] q;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.resetn(resetn),
	.byteena(byteena),
	.d(d),
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
    resetn = 0; // Assert resetn low
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
    #10;
    resetn = 1; // Deassert resetn
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
        #10;
    end

    // scenario 2
    scenario = 2;
    resetn = 1; // Set resetn high
    d = 16'hA5A5;
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
    byteena = 2'b01; // Enable lower byte
    #10; // Wait one clock cycle
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
        #10;
    end

    // scenario 3
    scenario = 3;
    resetn = 1; // Set resetn high
    d = 16'hFF00;
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
    byteena = 2'b10; // Enable upper byte
    #10; // Wait one clock cycle
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
        #10;
    end

    // scenario 4
    scenario = 4;
    resetn = 1; // Set resetn high
    d = 16'hF0F0;
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
    byteena = 2'b11; // Enable both bytes
    #10; // Wait one clock cycle
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
        #10;
    end

    // scenario 5
    scenario = 5;
    resetn = 0; // Assert resetn low
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
    #10;
    resetn = 1; // Deassert resetn
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
    d = 16'h1234;
    byteena = 2'b01; // Enable writing to lower byte
    #10; // Wait one clock cycle
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
        #10;
    end
    d = 16'h5678;
    byteena = 2'b10; // Enable writing to upper byte
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q); #10; // Wait one clock cycle
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
        #10;
    end

    // scenario 6
    scenario = 6;
    resetn = 1; // Set resetn high
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
    #10; // Deassert resetn
    byteena = 2'b00; // No bytes enabled 
    d = 16'h0000; // Random values
    repeat(5) begin
        $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q); #10;
        $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q); #10; 
        byteena = $urandom_range(0, 3); // Random byteena
        d = $urandom; // Random data
    end

    // scenario 7
    scenario = 7;
    resetn = 0; // Assert resetn low
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
    #10;
    resetn = 1; // Deassert resetn
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
    d = 16'hAAAA;
    byteena = 2'b00; // No bytes enabled
    #10; // Wait one clock cycle
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
        #10;
    end

    // scenario 8
    scenario = 8;
    resetn = 1; // Set resetn high
    d = 16'hBEEF; // Constant data
    $fdisplay(file, "scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
    repeat(6) begin
        byteena = (byteena == 2'b00) ? 2'b01 : 2'b00; // Change byteena
        #10; // Wait for one clock
        $fdisplay(file, "[check]scenario: %d, clk = %d, resetn = %d, byteena = %d, d = %d, q = %d", scenario, clk, resetn, byteena, d, q);
    end

    $fclose(file);
    $finish;
end

endmodule
