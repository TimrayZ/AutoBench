`timescale 1ns/1ps

module tb_top_module;

  // Inputs
  reg in;
  reg [1:0] state;

  // Outputs
  wire [1:0] next_state;
  wire out;

  // Instantiate the DUT
  top_module DUT (
    .in(in),
    .state(state),
    .next_state(next_state),
    .out(out)
  );

  // File handling
  integer file;

  initial begin
    // Open file for writing
    file = $fopen("TBout.txt", "w");

    // Scenario 1: Initial state is A (state=2'b00) with input in=0
    state = 2'b00; in = 1'b0;
    #1; // Wait for signals to stabilize
    $fdisplay(file, "scenario: 1, in = %d, state = %d, next_state = %d, out = %d", in, state, next_state, out);

    // Scenario 2: Current state is A with input in=1
    state = 2'b00; in = 1'b1;
    #1; 
    $fdisplay(file, "scenario: 2, in = %d, state = %d, next_state = %d, out = %d", in, state, next_state, out);

    // Scenario 3: Current state is B (state=2'b01) with input in=0
    state = 2'b01; in = 1'b0;
    #1;
    $fdisplay(file, "scenario: 3, in = %d, state = %d, next_state = %d, out = %d", in, state, next_state, out);

    // Scenario 4: Current state is B with input in=1
    state = 2'b01; in = 1'b1;
    #1;
    $fdisplay(file, "scenario: 4, in = %d, state = %d, next_state = %d, out = %d", in, state, next_state, out);

    // Scenario 5: Current state is C (state=2'b10) with input in=0
    state = 2'b10; in = 1'b0;
    #1;
    $fdisplay(file, "scenario: 5, in = %d, state = %d, next_state = %d, out = %d", in, state, next_state, out);

    // Scenario 6: Current state is C with input in=1
    state = 2'b10; in = 1'b1;
    #1;
    $fdisplay(file, "scenario: 6, in = %d, state = %d, next_state = %d, out = %d", in, state, next_state, out);

    // Scenario 7: Current state is D (state=2'b11) with input in=0
    state = 2'b11; in = 1'b0;
    #1;
    $fdisplay(file, "scenario: 7, in = %d, state = %d, next_state = %d, out = %d", in, state, next_state, out);

    // Scenario 8: Current state is D with input in=1
    state = 2'b11; in = 1'b1;
    #1;
    $fdisplay(file, "scenario: 8, in = %d, state = %d, next_state = %d, out = %d", in, state, next_state, out);

    // Close the file
    $fclose(file);

    // Finish simulation
    $finish;
  end

endmodule
