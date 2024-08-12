`timescale 1ns / 1ps

module tb_top_module;

  reg [3:0] in;
  wire out_and;
  wire out_or;
  wire out_xor;

  // Instantiate the Device Under Test (DUT)
  top_module DUT (
    .in(in),
    .out_and(out_and),
    .out_or(out_or),
    .out_xor(out_xor)
  );

  integer fh; // file handler

  initial begin
    // Open the file to write the outputs
    fh = $fopen("TBout.txt", "w");
    
    // Scenario 1
    in = 4'b0000; 
    #1; // Wait for 1 time unit
    $fdisplay(fh, "scenario: 1, in = %d, out_and = %d, out_or = %d, out_xor = %d", in, out_and, out_or, out_xor);

    // Scenario 2
    in = 4'b1111; 
    #1; 
    $fdisplay(fh, "scenario: 2, in = %d, out_and = %d, out_or = %d, out_xor = %d", in, out_and, out_or, out_xor);

    // Scenario 3
    in = 4'b1010; 
    #1; 
    $fdisplay(fh, "scenario: 3, in = %d, out_and = %d, out_or = %d, out_xor = %d", in, out_and, out_or, out_xor);

    // Scenario 4
    in = 4'b0101; 
    #1; 
    $fdisplay(fh, "scenario: 4, in = %d, out_and = %d, out_or = %d, out_xor = %d", in, out_and, out_or, out_xor);

    // Scenario 5
    in = 4'b0011; 
    #1; 
    $fdisplay(fh, "scenario: 5, in = %d, out_and = %d, out_or = %d, out_xor = %d", in, out_and, out_or, out_xor);
    
    // Scenario 6
    in = 4'b1100; 
    #1; 
    $fdisplay(fh, "scenario: 6, in = %d, out_and = %d, out_or = %d, out_xor = %d", in, out_and, out_or, out_xor);

    // Scenario 7
    in = 4'b1001; 
    #1; 
    $fdisplay(fh, "scenario: 7, in = %d, out_and = %d, out_or = %d, out_xor = %d", in, out_and, out_or, out_xor);

    // Scenario 8
    in = 4'b0110; 
    #1; 
    $fdisplay(fh, "scenario: 8, in = %d, out_and = %d, out_or = %d, out_xor = %d", in, out_and, out_or, out_xor);

    // Scenario 9
    in = 4'b1011; 
    #1; 
    $fdisplay(fh, "scenario: 9, in = %d, out_and = %d, out_or = %d, out_xor = %d", in, out_and, out_or, out_xor);

    // Scenario 10
    in = 4'b0111; 
    #1; 
    $fdisplay(fh, "scenario: 10, in = %d, out_and = %d, out_or = %d, out_xor = %d", in, out_and, out_or, out_xor);

    // Close the file
    $fclose(fh);
  end

endmodule
