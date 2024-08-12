`timescale 1ns / 1ps

module tb_top_module;

  // Parameters
  reg [2:0] a;
  reg [2:0] b;
  wire [2:0] out_or_bitwise;
  wire out_or_logical;
  wire [5:0] out_not;

  // DUT instantiation
  top_module DUT (
    .a(a),
    .b(b),
    .out_or_bitwise(out_or_bitwise),
    .out_or_logical(out_or_logical),
    .out_not(out_not)
  );

  // File descriptor
  integer file;

  initial begin
    // Open file for writing
    file = $fopen("TBout.txt", "w");

    // Scenario 1
    a = 3'b000; b = 3'b000; #1;
    $fdisplay(file, "scenario: 1, a = %d, b = %d, out_or_bitwise = %d, out_or_logical = %d, out_not = %d", a, b, out_or_bitwise, out_or_logical, out_not);
    
    // Scenario 2
    a = 3'b101; b = 3'b010; #1;
    $fdisplay(file, "scenario: 2, a = %d, b = %d, out_or_bitwise = %d, out_or_logical = %d, out_not = %d", a, b, out_or_bitwise, out_or_logical, out_not);
    
    // Scenario 3
    a = 3'b111; b = 3'b000; #1;
    $fdisplay(file, "scenario: 3, a = %d, b = %d, out_or_bitwise = %d, out_or_logical = %d, out_not = %d", a, b, out_or_bitwise, out_or_logical, out_not);
    
    // Scenario 4
    a = 3'b011; b = 3'b011; #1;
    $fdisplay(file, "scenario: 4, a = %d, b = %d, out_or_bitwise = %d, out_or_logical = %d, out_not = %d", a, b, out_or_bitwise, out_or_logical, out_not);
    
    // Scenario 5
    a = 3'b110; b = 3'b111; #1;
    $fdisplay(file, "scenario: 5, a = %d, b = %d, out_or_bitwise = %d, out_or_logical = %d, out_not = %d", a, b, out_or_bitwise, out_or_logical, out_not);
    
    // Scenario 6
    a = 3'b001; b = 3'b100; #1;
    $fdisplay(file, "scenario: 6, a = %d, b = %d, out_or_bitwise = %d, out_or_logical = %d, out_not = %d", a, b, out_or_bitwise, out_or_logical, out_not);
    
    // Scenario 7
    a = 3'b010; b = 3'b101; #1;
    $fdisplay(file, "scenario: 7, a = %d, b = %d, out_or_bitwise = %d, out_or_logical = %d, out_not = %d", a, b, out_or_bitwise, out_or_logical, out_not);
    
    // Scenario 8
    a = 3'b111; b = 3'b111; #1;
    $fdisplay(file, "scenario: 8, a = %d, b = %d, out_or_bitwise = %d, out_or_logical = %d, out_not = %d", a, b, out_or_bitwise, out_or_logical, out_not);
    
    // Scenario 9
    a = 3'b000; b = 3'b111; #1;
    $fdisplay(file, "scenario: 9, a = %d, b = %d, out_or_bitwise = %d, out_or_logical = %d, out_not = %d", a, b, out_or_bitwise, out_or_logical, out_not);
    
    // Scenario 10
    a = 3'b110; b = 3'b010; #1;
    $fdisplay(file, "scenario: 10, a = %d, b = %d, out_or_bitwise = %d, out_or_logical = %d, out_not = %d", a, b, out_or_bitwise, out_or_logical, out_not);

    // Close file
    $fclose(file);
    $finish;
  end

endmodule
