`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
reg  data;
wire [3:0] count;
wire  counting;
wire  done;
reg  ack;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.reset(reset),
	.data(data),
	.count(count),
	.counting(counting),
	.done(done),
	.ack(ack)
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
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10;
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10;

    // Scenario 2
    scenario = 2;
    data = 1; // '1'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 1; // '1'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 0; // '0'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 1; // '1'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 0; // '0' to start sending delay, '0101' for delay of 5
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 1; // '1'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 0; // '0'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 1; // '1'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 1; // '1'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 0; // now maintain data = 0
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack); #10; 

    // Scenario 3
    scenario = 3;
    repeat(1000) begin
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack); #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack); #10; 
    end

    // Scenario 4
    scenario = 4;
    repeat(4000) begin
        $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack); #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack); #10; 
    end

    // Scenario 5
    scenario = 5;
    ack = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    ack = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack); #10; 
    
    // Scenario 6
    scenario = 6;
    reset = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10;
    reset = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack); #10; 

    // Scenario 7
    scenario = 7;
    data = 1; // '1'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 1; // '1'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 0; // '0'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 1; // '1'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 0; // '0' to start sending new delay, '0011' for delay of 3
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 1; // '1'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 1; // '1'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 0; // '0'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 1; // '1'
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    #10; 
    data = 0; // now maintain data = 0
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack); #10; 

    // Scenario 8
    scenario = 8;
    repeat(6000) begin
        #10;
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, count = %d, counting = %d, done = %d, ack = %d", scenario, clk, reset, data, count, counting, done, ack);
    end

    $fclose(file);
    $finish;
end

endmodule
