`timescale 1ns/1ps

module tb_top_module;

  // Output of DUT
  wire zero;
  
  // Input (add if required for your DUT)
  reg clk;
  reg reset;

  // Instantiate the DUT
  top_module uut (
    .zero(zero)
  );

  // File handling
  integer file;
  
  initial begin
    // Open the output file
    file = $fopen("TBout.txt", "w");
    if (file == 0) begin
      $display("Error opening file TBout.txt");
      $finish;
    end

    // Scenario 1
    $display("Starting Scenario 1");
    clk = 0; // Initialize clock
    reset = 0; // Deassert reset
    #1; // Wait for 1 time unit
    $fdisplay(file, "scenario: 1, zero = %d", zero);
    
    // Scenario 2
    $display("Starting Scenario 2");
    #10; // Wait for 10 time units
    for (integer i = 0; i < 10; i++) begin
      #1; // Small delay to ensure stability
      $fdisplay(file, "scenario: 2, zero = %d", zero);
    end

    // Scenario 3 - Toggling inputs
    $display("Starting Scenario 3");
    #2; // Wait for 2 time units
    for (integer i = 0; i < 10; i++) begin
      #1 clk = ~clk; // Toggle clock signal
      $fdisplay(file, "scenario: 3, zero = %d", zero);
    end

    // Scenario 4 - Reset (inject a reset signal)
    $display("Starting Scenario 4");
    reset = 1; // Assert reset
    #5; // Hold reset for 5 time units
    reset = 0; // Deassert reset
    #10; // Wait and check output
    $fdisplay(file, "scenario: 4, zero = %d", zero);

    // Scenario 5 - High-frequency input
    $display("Starting Scenario 5");
    #3; // Wait for 3 time units
    for (integer i = 0; i < 10; i++) begin
      #1; // High-frequency toggle
      clk = ~clk; // Toggle clock signal
      $fdisplay(file, "scenario: 5, zero = %d", zero);
    end

    // Scenario 6 - Noise on inputs
    $display("Starting Scenario 6");
    #6; // Wait for 6 time units
    // Simulate noise by briefly toggling the reset
    reset = 1; // Introduce noise
    #2;
    reset = 0; // Remove noise
    #5; // Wait for 5 time units
    $fdisplay(file, "scenario: 6, zero = %d", zero);
    
    // Close the file
    $fclose(file);
    $finish;
  end

endmodule
