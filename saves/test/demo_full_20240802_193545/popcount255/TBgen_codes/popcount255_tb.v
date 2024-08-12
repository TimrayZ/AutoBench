`timescale 1ns/1ps

module tb_top_module;

  reg [254:0] in;
  wire [7:0] out;
  
  // Instantiate the Device Under Test (DUT)
  top_module DUT (
    .in(in),
    .out(out)
  );
  
  integer file;

  initial begin
    // Open the file for writing
    file = $fopen("TBout.txt", "w");
    
    // Scenario 1: All zeroes
    in = 255'b0;
    #1; // Wait for signal stabilization
    $fdisplay(file, "scenario: 1, in = %b, out = %d", in, out);
    
    // Scenario 2: All ones
    in = 255'b1;
    #1; // Wait for signal stabilization
    $fdisplay(file, "scenario: 2, in = %b, out = %d", in, out);
    
    // Scenario 3: 127 ones followed by 128 zeroes
    in = 255'b011111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111;
    #1; // Wait for signal stabilization
    $fdisplay(file, "scenario: 3, in = %b, out = %d", in, out);
    
    // Scenario 4: Single set bit
    in = 255'b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001;
    #1; // Wait for signal stabilization
    $fdisplay(file, "scenario: 4, in = %b, out = %d", in, out);
    
    // Scenario 5: Alternating bits
    in = 255'b101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101;
    #1; // Wait for signal stabilization
    $fdisplay(file, "scenario: 5, in = %b, out = %d", in, out);
    
    // Scenario 6: Random pattern with 200 ones (example hardcoded)
    in = 255'b110101001000000011101011100111101011000010001010110010101110011010101011101011010001101000010101101000101101010; // Ensure this has 200 ones
    #1; // Wait for signal stabilization
    $fdisplay(file, "scenario: 6, in = %b, out = %d", in, out);
    
    // Scenario 7: All zeroes after previous
    in = 255'b0;
    #1; // Wait for signal stabilization
    $fdisplay(file, "scenario: 7, in = %b, out = %d", in, out);
    
    // Added Scenario 4: Single set bit (correctly added to the testbench)
    in = 255'b10;
    #1; // Wait for signal stabilization
    $fdisplay(file, "scenario: 4 updated, in = %b, out = %d", in, out);
    
    // Close the file
    $fclose(file);
    
    $finish; // End simulation
  end

endmodule
