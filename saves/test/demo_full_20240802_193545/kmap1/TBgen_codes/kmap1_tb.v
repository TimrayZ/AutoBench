`timescale 1ns / 1ps

module tb_top_module;

  // Inputs
  reg a;
  reg b;
  reg c;

  // Outputs
  wire out;

  // Instantiate the Device Under Test (DUT)
  top_module DUT (
    .a(a),
    .b(b),
    .c(c),
    .out(out)
  );

  // File for exporting signals
  integer file;
  
  initial begin
    // Open the file to write
    file = $fopen("TBout.txt", "w");
    
    // Scenario 1
    a = 0; b = 0; c = 0; // Inputs for scenario 1
    #1; // Wait for 1 time unit
    $fdisplay(file, "scenario: 1, a = %d, b = %d, c = %d, out = %d", a, b, c, out);
    
    // Scenario 2
    a = 0; b = 0; c = 1; // Inputs for scenario 2
    #1; 
    $fdisplay(file, "scenario: 2, a = %d, b = %d, c = %d, out = %d", a, b, c, out);
    
    // Scenario 3
    a = 0; b = 1; c = 0; // Inputs for scenario 3
    #1; 
    $fdisplay(file, "scenario: 3, a = %d, b = %d, c = %d, out = %d", a, b, c, out);
    
    // Scenario 4
    a = 0; b = 1; c = 1; // Inputs for scenario 4
    #1; 
    $fdisplay(file, "scenario: 4, a = %d, b = %d, c = %d, out = %d", a, b, c, out);
    
    // Scenario 5
    a = 1; b = 0; c = 0; // Inputs for scenario 5
    #1; 
    $fdisplay(file, "scenario: 5, a = %d, b = %d, c = %d, out = %d", a, b, c, out);
    
    // Scenario 6
    a = 1; b = 0; c = 1; // Inputs for scenario 6
    #1; 
    $fdisplay(file, "scenario: 6, a = %d, b = %d, c = %d, out = %d", a, b, c, out);
    
    // Scenario 7
    a = 1; b = 1; c = 0; // Inputs for scenario 7
    #1; 
    $fdisplay(file, "scenario: 7, a = %d, b = %d, c = %d, out = %d", a, b, c, out);
    
    // Scenario 8
    a = 1; b = 1; c = 1; // Inputs for scenario 8
    #1; 
    $fdisplay(file, "scenario: 8, a = %d, b = %d, c = %d, out = %d", a, b, c, out);
    
    // Close the file
    $fclose(file);
    
    // Finish simulation
    $finish;
  end

endmodule
