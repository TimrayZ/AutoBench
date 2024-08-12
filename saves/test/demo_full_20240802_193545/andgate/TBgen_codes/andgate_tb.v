`timescale 1ns/1ps

module tb_top_module;

  // Declare inputs as reg
  reg a;
  reg b;
  
  // Declare output as wire
  wire out;
  
  // Instantiate the device under test (DUT)
  top_module DUT (
      .a(a),
      .b(b),
      .out(out)
  );
  
  // File pointer for output
  integer file;

  initial begin
      // Open the output file
      file = $fopen("TBout.txt", "w");
      
      // Scenario 1: a = 0, b = 0
      a = 0; 
      b = 0; 
      #1; // wait for 1 time unit for stability
      $fdisplay(file, "scenario: 1, a = %d, b = %d, out = %d", a, b, out);
      
      // Scenario 2: a = 0, b = 1
      a = 0; 
      b = 1; 
      #1; // wait for 1 time unit for stability
      $fdisplay(file, "scenario: 2, a = %d, b = %d, out = %d", a, b, out);
      
      // Scenario 3: a = 1, b = 0
      a = 1; 
      b = 0; 
      #1; // wait for 1 time unit for stability
      $fdisplay(file, "scenario: 3, a = %d, b = %d, out = %d", a, b, out);
      
      // Scenario 4: a = 1, b = 1
      a = 1; 
      b = 1; 
      #1; // wait for 1 time unit for stability
      $fdisplay(file, "scenario: 4, a = %d, b = %d, out = %d", a, b, out);
      
      // Close the output file
      $fclose(file);
      
      // End of the simulation
      $finish;
  end

endmodule
