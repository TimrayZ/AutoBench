`timescale 1ns / 1ps
module testbench;
reg  clk;
reg  reset;
reg  data;
wire  shift_ena;
wire  counting;
reg  done_counting;
wire  done;
reg  ack;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.reset(reset),
	.data(data),
	.shift_ena(shift_ena),
	.counting(counting),
	.done_counting(done_counting),
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

    // Scenario 1: Reset the DUT
    scenario = 1;
    reset = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack);
    #10;
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack);
        #10;
    end

    // Scenario 2: Send data bits 0000, 0000, 0000, 1101
    scenario = 2;
    data = 0;
    repeat(3) begin
        repeat(4) begin
            $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack);
            #10;
        end
    end
    data = 1; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10; data = 1; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10; data = 0; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10; data = 1; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10;

    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack);
        #10;
    end

    // Scenario 3: Continue sending data bits: 0000, 0000, 0
    scenario = 3;
    data = 0;
    repeat(3) begin
        repeat(4) begin
            $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack);
            #10;
        end
    end

    // Scenario 4: Send delay bits 0101
    scenario = 4;
    data = 0; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10; data = 1; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10; data = 0; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10; data = 1; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10;

    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack);
        #10;
    end

    // Scenario 5: Assert done_counting signal
    scenario = 5;
    done_counting = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10; 
    done_counting = 0; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10;  
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack);
        #10;
    end

    // Scenario 6: Send ack high
    scenario = 6;
    ack = 0; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10; ack = 1; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10;
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack);
        #10;
    end

    // Scenario 7: Send additional data that do not include the pattern
    scenario = 7;
    data = 0;
    repeat(3) begin
        repeat(4) begin
            $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack);
            #10;
        end
    end

    // Scenario 8: Repeat process with pattern 1101 after gap
    scenario = 8;
    data = 0; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10; 
    repeat(3) begin
        data = 0; repeat(4) begin
            $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack);
            #10;
        end
    end
    data = 1; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10; data = 1; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10; data = 0; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10; data = 1; $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10;

    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack);
        #10;
    end

    // Scenario 9: Reset while in 'done' state
    scenario = 9;
    reset = 1; 
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack);
    #10;
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack); #10; 
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, reset = %d, data = %d, shift_ena = %d, counting = %d, done_counting = %d, done = %d, ack = %d", scenario, clk, reset, data, shift_ena, counting, done_counting, done, ack);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
