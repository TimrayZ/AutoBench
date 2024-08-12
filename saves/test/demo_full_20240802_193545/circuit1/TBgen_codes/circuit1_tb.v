`timescale 1ns/1ps

module tb_top_module;
  reg a;
  reg b;
  wire q;

  // Instantiate the DUT
  top_module DUT (
    .a(a),
    .b(b),
    .q(q)
  );
  
  // File for exporting the important signals
  integer file;

  initial begin
    // Open the output file
    file = $fopen("TBout.txt", "w");

    // Scenario 1
    a = 0; b = 0;
    #5; // wait for 5ns to observe the output
    $fdisplay(file, "scenario: 1, a = %d, b = %d, q = %d", a, b, q);

    // Scenario 2
    #20; // wait for 20ns to 25ns
    a = 0; b = 1;
    #5; // wait for 5ns to observe the output
    $fdisplay(file, "scenario: 2, a = %d, b = %d, q = %d", a, b, q);

    // Scenario 3
    #10; // wait for 10ns to 35ns
    a = 1; b = 0;
    #5; // wait for 5ns to observe the output
    $fdisplay(file, "scenario: 3, a = %d, b = %d, q = %d", a, b, q);

    // Scenario 4
    #10; // wait for 10ns to 45ns
    a = 1; b = 1;
    #5; // wait for 5ns to observe the output
    $fdisplay(file, "scenario: 4, a = %d, b = %d, q = %d", a, b, q);

    // Scenario 5
    #10; // wait for 10ns to 55ns
    a = 0; b = 0;
    #5; // wait for 5ns to observe the output
    $fdisplay(file, "scenario: 5, a = %d, b = %d, q = %d", a, b, q);

    // Scenario 6
    #10; // wait for 10ns to 65ns
    a = 0; b = 1;
    #5; // wait for 5ns to observe the output
    $fdisplay(file, "scenario: 6, a = %d, b = %d, q = %d", a, b, q);

    // Scenario 7
    #10; // wait for 10ns to 75ns
    a = 1; b = 0;
    #5; // wait for 5ns to observe the output
    $fdisplay(file, "scenario: 7, a = %d, b = %d, q = %d", a, b, q);

    // Scenario 8
    #10; // wait for 10ns to 85ns
    a = 1; b = 1;
    #5; // wait for 5ns to observe the output
    $fdisplay(file, "scenario: 8, a = %d, b = %d, q = %d", a, b, q);

    // Close the output file
    $fclose(file);
    
    // Finish the simulation
    $finish;
  end
endmodule
