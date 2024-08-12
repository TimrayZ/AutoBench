`timescale 1ns / 1ps

module tb_top_module;

  // Inputs
  reg x3;
  reg x2;
  reg x1;

  // Outputs
  wire f;

  // Instantiate the DUT
  top_module DUT (
    .x3(x3),
    .x2(x2),
    .x1(x1),
    .f(f)
  );

  // File descriptor for output
  integer file;

  initial begin
    // Open the file for writing
    file = $fopen("TBout.txt", "w");
    
    // Scenario 1
    x3 = 0; x2 = 0; x1 = 0;
    #1;
    $fdisplay(file, "scenario: 1, x3 = %d, x2 = %d, x1 = %d, f = %d", x3, x2, x1, f);
    
    // Scenario 2
    x3 = 0; x2 = 0; x1 = 1;
    #1;
    $fdisplay(file, "scenario: 2, x3 = %d, x2 = %d, x1 = %d, f = %d", x3, x2, x1, f);
    
    // Scenario 3
    x3 = 0; x2 = 1; x1 = 0;
    #1;
    $fdisplay(file, "scenario: 3, x3 = %d, x2 = %d, x1 = %d, f = %d", x3, x2, x1, f);
    
    // Scenario 4
    x3 = 0; x2 = 1; x1 = 1;
    #1;
    $fdisplay(file, "scenario: 4, x3 = %d, x2 = %d, x1 = %d, f = %d", x3, x2, x1, f);
    
    // Scenario 5
    x3 = 1; x2 = 0; x1 = 0;
    #1;
    $fdisplay(file, "scenario: 5, x3 = %d, x2 = %d, x1 = %d, f = %d", x3, x2, x1, f);
    
    // Scenario 6
    x3 = 1; x2 = 0; x1 = 1;
    #1;
    $fdisplay(file, "scenario: 6, x3 = %d, x2 = %d, x1 = %d, f = %d", x3, x2, x1, f);
    
    // Scenario 7
    x3 = 1; x2 = 1; x1 = 0;
    #1;
    $fdisplay(file, "scenario: 7, x3 = %d, x2 = %d, x1 = %d, f = %d", x3, x2, x1, f);
    
    // Scenario 8
    x3 = 1; x2 = 1; x1 = 1;
    #1;
    $fdisplay(file, "scenario: 8, x3 = %d, x2 = %d, x1 = %d, f = %d", x3, x2, x1, f);
    
    // Close the file
    $fclose(file);
    
    // Finish the simulation
    $finish;
  end

endmodule
