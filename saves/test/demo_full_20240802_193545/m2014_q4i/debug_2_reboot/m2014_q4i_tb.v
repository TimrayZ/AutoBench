`timescale 1ns / 1ps

module tb_top_module;

  // DUT output signal
  wire out;

  // Instantiate the DUT
  top_module uut (
    .out(out)
  );

  // File descriptor for logging output
  integer file;

  initial begin
    // Open file for writing output
    file = $fopen("TBout.txt", "w");
    
    // Scenario 1: Initialize the simulation and wait for 10 clock cycles
    #10;
    $fdisplay(file, "scenario: 1, out = %d", out);
    if (out !== 0) $display("Error: Scenario 1 output is not 0");

    // Scenario 2: Check output at clock cycle 10
    #10;
    $fdisplay(file, "scenario: 2, out = %d", out);
    if (out !== 0) $display("Error: Scenario 2 output is not 0");

    // Scenario 3: Continue simulation for additional 10 clock cycles (total 20)
    #10;
    $fdisplay(file, "scenario: 3, out = %d", out);
    if (out !== 0) $display("Error: Scenario 3 output is not 0");
    
    // Scenario 4: Simulate for total of 50 clock cycles checking every 10 cycles
    #10;
    $fdisplay(file, "scenario: 4, out = %d", out);
    if (out !== 0) $display("Error: Scenario 4 output is not 0");
    #10;
    $fdisplay(file, "scenario: 4a, out = %d", out);
    if (out !== 0) $display("Error: Scenario 4a output is not 0");
    #10;
    $fdisplay(file, "scenario: 4b, out = %d", out);
    if (out !== 0) $display("Error: Scenario 4b output is not 0");
    #10;
    $fdisplay(file, "scenario: 4c, out = %d", out);
    if (out !== 0) $display("Error: Scenario 4c output is not 0");
    #10;
    $fdisplay(file, "scenario: 4d, out = %d", out);
    if (out !== 0) $display("Error: Scenario 4d output is not 0");
    #10; // Additional check for cycle 50
    $fdisplay(file, "scenario: 4e, out = %d", out);
    if (out !== 0) $display("Error: Scenario 4e output is not 0");

    // Scenario 5: Extend simulation to 100 cycles checking every decade
    repeat(5) begin
      #10;
      $fdisplay(file, "scenario: 5, out = %d", out);
      if (out !== 0) $display("Error: Scenario 5 output is not 0");
    end

    // Final check at 100 clock cycles to ensure output stays at 0
    #10;
    $fdisplay(file, "scenario: 5a, out = %d", out);
    if (out !== 0) $display("Error: Scenario 5a output is not 0");

    // Close the file
    $fclose(file);
    // End the simulation
    $finish;
  end
  
endmodule
