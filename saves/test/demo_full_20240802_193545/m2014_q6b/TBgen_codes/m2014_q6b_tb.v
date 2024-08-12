`timescale 1ns/1ps

module testbench;

  reg [3:1] y;
  reg w;
  wire Y2;

  // Instantiate the DUT
  top_module DUT (
    .y(y),
    .w(w),
    .Y2(Y2)
  );

  integer fd;

  initial begin
    // Open the output file
    fd = $fopen("TBout.txt", "w");

    // Scenario 1: Initialize state to A (000), set w to 0. Apply for 1 clock cycle.
    y = 3'b000; w = 1'b0;
    #10;  // Wait for signals to stabilize
    $fdisplay(fd, "scenario: 1, y = %b, w = %b, Y2 = %b", y, w, Y2);

    // Scenario 2: Maintain state A (000), set w to 1. Apply for 1 clock cycle.
    w = 1'b1;
    #10;
    $fdisplay(fd, "scenario: 2, y = %b, w = %b, Y2 = %b", y, w, Y2);

    // Scenario 3: Transition to state B (001) by setting y to 001, then set w to 0. Apply for 1 clock cycle.
    y = 3'b001; w = 1'b0;
    #10;
    $fdisplay(fd, "scenario: 3, y = %b, w = %b, Y2 = %b", y, w, Y2);

    // Scenario 4: Maintain state B (001), set w to 1. Apply for 1 clock cycle.
    w = 1'b1;
    #10;
    $fdisplay(fd, "scenario: 4, y = %b, w = %b, Y2 = %b", y, w, Y2);

    // Scenario 5: Transition to state C (010) by setting y to 010, then set w to 0. Apply for 1 clock cycle.
    y = 3'b010; w = 1'b0;
    #10;
    $fdisplay(fd, "scenario: 5, y = %b, w = %b, Y2 = %b", y, w, Y2);

    // Scenario 6: Maintain state C (010), set w to 1. Apply for 1 clock cycle.
    w = 1'b1;
    #10;
    $fdisplay(fd, "scenario: 6, y = %b, w = %b, Y2 = %b", y, w, Y2);

    // Scenario 7: Transition to state D (011) by setting y to 011, then set w to 0. Apply for 1 clock cycle.
    y = 3'b011; w = 1'b0;
    #10;
    $fdisplay(fd, "scenario: 7, y = %b, w = %b, Y2 = %b", y, w, Y2);

    // Scenario 8: Maintain state D (011), set w to 1. Apply for 1 clock cycle.
    w = 1'b1;
    #10;
    $fdisplay(fd, "scenario: 8, y = %b, w = %b, Y2 = %b", y, w, Y2);

    // Scenario 9: Transition to state E (100) by setting y to 100, then set w to 0. Apply for 1 clock cycle.
    y = 3'b100; w = 1'b0;
    #10;
    $fdisplay(fd, "scenario: 9, y = %b, w = %b, Y2 = %b", y, w, Y2);

    // Scenario 10: Maintain state E (100), set w to 1. Apply for 1 clock cycle.
    w = 1'b1;
    #10;
    $fdisplay(fd, "scenario: 10, y = %b, w = %b, Y2 = %b", y, w, Y2);

    // Scenario 11: Transition to state F (101) by setting y to 101, then set w to 0. Apply for 1 clock cycle.
    y = 3'b101; w = 1'b0;
    #10;
    $fdisplay(fd, "scenario: 11, y = %b, w = %b, Y2 = %b", y, w, Y2);

    // Scenario 12: Maintain state F (101), set w to 1. Apply for 1 clock cycle.
    w = 1'b1;
    #10;
    $fdisplay(fd, "scenario: 12, y = %b, w = %b, Y2 = %b", y, w, Y2);

    // Close the output file
    $fclose(fd);
  end

endmodule
