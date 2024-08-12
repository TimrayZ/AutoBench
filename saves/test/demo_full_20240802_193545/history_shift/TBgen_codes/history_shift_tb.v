`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  areset;
reg  predict_valid;
reg  predict_taken;
wire [31:0] predict_history;
reg  train_mispredicted;
reg  train_taken;
reg [31:0] train_history;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.areset(areset),
	.predict_valid(predict_valid),
	.predict_taken(predict_taken),
	.predict_history(predict_history),
	.train_mispredicted(train_mispredicted),
	.train_taken(train_taken),
	.train_history(train_history)
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
    areset = 1;
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history);
        #10;
    end
    areset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history);
        #10;
    end

    // Scenario 2
    scenario = 2;
    areset = 0;
    predict_valid = 1;
    predict_taken = 1;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history);
        #10;
    end

    // Scenario 3
    scenario = 3;
    predict_valid = 1;
    predict_taken = 0;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history);
        #10;
    end

    // Scenario 4
    scenario = 4;
    predict_valid = 1;
    predict_taken = 1;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history);
        #10;
    end

    // Scenario 5
    scenario = 5;
    predict_valid = 0;
    train_mispredicted = 1;
    train_history = 32'h12345678; // Sample value
    train_taken = 1;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history);
        #10;
    end

    // Scenario 6
    scenario = 6;
    predict_valid = 1;
    train_mispredicted = 1;
    train_history = 32'h87654321; // Specific value
    train_taken = 0;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history);
        #10;
    end

    // Scenario 7
    scenario = 7;
    areset = 0;
    predict_valid = 1;
    train_mispredicted = 0;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history); #10; 
    repeat(4) begin
        predict_taken = ~predict_taken; // Toggle predict_taken
        $fdisplay(file, "scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history);
        #10;
    end

    // Scenario 8
    scenario = 8;
    areset = 1;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history);
        #10;
    end
    areset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history); #10; 
    repeat(1) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history);
        #10;
    end

    // Scenario 9
    scenario = 9;
    areset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history); #10; 
    // Provide a mix of predictions and mispredictions
    repeat(5) begin
        predict_valid = $urandom_range(0, 1);
        train_mispredicted = $urandom_range(0, 1);
        predict_taken = $urandom_range(0, 1);
        train_taken = $urandom_range(0, 1);
        train_history = $urandom; // Random value
        $fdisplay(file, "scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history); #10; 
        $fdisplay(file, "[check]scenario: %d, clk = %d, areset = %d, predict_valid = %d, predict_taken = %d, predict_history = %d, train_mispredicted = %d, train_taken = %d, train_history = %d", scenario, clk, areset, predict_valid, predict_taken, predict_history, train_mispredicted, train_taken, train_history);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
