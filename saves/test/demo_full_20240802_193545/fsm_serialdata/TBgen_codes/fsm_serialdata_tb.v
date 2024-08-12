`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  in;
reg  reset;
wire [7:0] out_byte;
wire  done;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.in(in),
	.reset(reset),
	.out_byte(out_byte),
	.done(done)
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
    repeat(2) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
        #10;
    end
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
    #10;

    // scenario 2
    scenario = 2;
    in = 0; // Start bit
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
    #10;
    in = 1; // Data bit 0
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done); #10; 
    repeat(8) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
        #10;
        in = ~in; // Toggle for each data bit
        $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done); #10; 
    end
    in = 1; // Stop bit
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
    #10;

    // scenario 3
    scenario = 3;
    in = 0; // Start bit
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
    #10;
    in = 1; // Data bit 1
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
        #10;
        in = ~in; // Toggle for each data bit
        $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done); #10; 
    end
    // No stop bit provided
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
    #10;

    // scenario 4
    scenario = 4;
    in = 1; // Incorrect start bit
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
    #10;
    in = 1; // Data bit 1
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done); #10; 
    repeat(8) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
        #10;
        in = ~in; // Toggle for each data bit
        $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done); #10; 
    end
    in = 1; // Stop bit
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
    #10;

    // scenario 5
    scenario = 5;
    in = 0; // Start bit
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
    #10;
    in = 0; // Data bit 0
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done); #10; 
    repeat(7) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
        #10;
        in = ~in; // Toggle for each data bit
        $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done); #10; 
    end
    // No stop bit provided
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
    #10;

    // scenario 6
    scenario = 6;
    in = 0; // Start bit
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
    #10;
    in = 0; // Data bit 0
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done); #10; 
    repeat(8) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
        #10;
        in = ~in; // Toggle for each data bit
        $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done); #10; 
    end
    in = 1; // Stop bit
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
    #10;

    // scenario 7
    scenario = 7;
    in = 1; // Idle condition
    reset = 1; // Toggle reset
    repeat(20) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done); #10; 
        $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
        #10;
    end
    reset = 0; // Release reset
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
    #10;

    // scenario 8
    scenario = 8;
    in = 1; // Start with stop bit
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
    #10;
    in = 0; // Noise bits
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done); #10; 
    repeat(7) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
        #10;
        in = ~in; // Toggle for each noise bit
        $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done); #10; 
    end
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_byte = %d, done = %d", scenario, clk, in, reset, out_byte, done);
    #10;

    $fclose(file);
    $finish;
end

endmodule
