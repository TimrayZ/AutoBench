`timescale 1ns / 1ps

module tb_half_adder;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire sum;
  wire cout;

  // Instantiate the DUT (Device Under Test)
  top_module dut (
    .a(a),
    .b(b),
    .sum(sum),
    .cout(cout)
  );

  // File descriptor
  integer file;

  initial begin
    // Open the output file
    file = $fopen("TBout.txt", "w");

    // Test scenario 1: a = 0, b = 0
    a = 0;
    b = 0;
    #1; // Wait for stable signals
    $fdisplay(file, "scenario: 1, a = %d, b = %d, sum = %d, cout = %d", a, b, sum, cout);
    #1; // Wait for next scenario

    // Test scenario 2: a = 0, b = 1
    a = 0;
    b = 1;
    #1; // Wait for stable signals
    $fdisplay(file, "scenario: 2, a = %d, b = %d, sum = %d, cout = %d", a, b, sum, cout);
    #1; // Wait for next scenario

    // Test scenario 3: a = 1, b = 0
    a = 1;
    b = 0;
    #1; // Wait for stable signals
    $fdisplay(file, "scenario: 3, a = %d, b = %d, sum = %d, cout = %d", a, b, sum, cout);
    #1; // Wait for next scenario

    // Test scenario 4: a = 1, b = 1
    a = 1;
    b = 1;
    #1; // Wait for stable signals
    $fdisplay(file, "scenario: 4, a = %d, b = %d, sum = %d, cout = %d", a, b, sum, cout);
    #1; // Wait for end of test

    // Close the output file
    $fclose(file);
    
    // End the simulation
    $finish;
  end

endmodule
