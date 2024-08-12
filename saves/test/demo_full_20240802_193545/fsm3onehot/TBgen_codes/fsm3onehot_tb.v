module tb_top_module;

  reg in;
  reg [3:0] state;
  wire [3:0] next_state;
  wire out;

  // Instantiate the DUT
  top_module DUT (
    .in(in),
    .state(state),
    .next_state(next_state),
    .out(out)
  );

  // File Handling
  integer file;

  initial begin
    file = $fopen("TBout.txt", "w");

    // Scenario 1: Initialize the state to A (4'b0001) and apply in=0. Observe the next_state and output after 1 clock cycle.
    state = 4'b0001; in = 0; #1;
    $fdisplay(file, "scenario: 1, in = %d, state = %b, next_state = %b, out = %b", in, state, next_state, out);
  
    // Scenario 2: Set state to A (4'b0001) and apply in=1. Observe the next_state and output after 1 clock cycle.
    state = 4'b0001; in = 1; #1;
    $fdisplay(file, "scenario: 2, in = %d, state = %b, next_state = %b, out = %b", in, state, next_state, out);

    // Scenario 3: Set state to B (4'b0010) and apply in=0. Observe the next_state and output after 1 clock cycle.
    state = 4'b0010; in = 0; #1;
    $fdisplay(file, "scenario: 3, in = %d, state = %b, next_state = %b, out = %b", in, state, next_state, out);

    // Scenario 4: Set state to B (4'b0010) and apply in=1. Observe the next_state and output after 1 clock cycle.
    state = 4'b0010; in = 1; #1;
    $fdisplay(file, "scenario: 4, in = %d, state = %b, next_state = %b, out = %b", in, state, next_state, out);

    // Scenario 5: Set state to C (4'b0100) and apply in=0. Observe the next_state and output after 1 clock cycle.
    state = 4'b0100; in = 0; #1;
    $fdisplay(file, "scenario: 5, in = %d, state = %b, next_state = %b, out = %b", in, state, next_state, out);

    // Scenario 6: Set state to C (4'b0100) and apply in=1. Observe the next_state and output after 1 clock cycle.
    state = 4'b0100; in = 1; #1;
    $fdisplay(file, "scenario: 6, in = %d, state = %b, next_state = %b, out = %b", in, state, next_state, out);

    // Scenario 7: Set state to D (4'b1000) and apply in=0. Observe the next_state and output after 1 clock cycle.
    state = 4'b1000; in = 0; #1;
    $fdisplay(file, "scenario: 7, in = %d, state = %b, next_state = %b, out = %b", in, state, next_state, out);

    // Scenario 8: Set state to D (4'b1000) and apply in=1. Observe the next_state and output after 1 clock cycle.
    state = 4'b1000; in = 1; #1;
    $fdisplay(file, "scenario: 8, in = %d, state = %b, next_state = %b, out = %b", in, state, next_state, out);

    // Close file
    $fclose(file);
    $finish;
  end

endmodule
