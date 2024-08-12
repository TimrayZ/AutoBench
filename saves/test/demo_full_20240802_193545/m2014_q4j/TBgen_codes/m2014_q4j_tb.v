`timescale 1ns / 1ps

module tb_top_module;
  reg [3:0] x;
  reg [3:0] y;
  wire [4:0] sum;

  // Instantiate the DUT
  top_module DUT (
    .x(x),
    .y(y),
    .sum(sum)
  );

  integer file;

  initial begin
    file = $fopen("TBout.txt", "w");

    // Scenario 1
    x = 4'b0000; 
    y = 4'b0000; 
    #1; // Delay for signal stabilization
    $fdisplay(file, "scenario: 1, x = %d, y = %d, sum = %d", x, y, sum);

    // Scenario 2
    x = 4'b0001; 
    y = 4'b0001; 
    #1; 
    $fdisplay(file, "scenario: 2, x = %d, y = %d, sum = %d", x, y, sum);

    // Scenario 3
    x = 4'b0010; 
    y = 4'b0010; 
    #1; 
    $fdisplay(file, "scenario: 3, x = %d, y = %d, sum = %d", x, y, sum);

    // Scenario 4
    x = 4'b1111; 
    y = 4'b0001; 
    #1; 
    $fdisplay(file, "scenario: 4, x = %d, y = %d, sum = %d", x, y, sum);

    // Scenario 5
    x = 4'b0101; 
    y = 4'b1010; 
    #1; 
    $fdisplay(file, "scenario: 5, x = %d, y = %d, sum = %d", x, y, sum);

    // Scenario 6
    x = 4'b1000; 
    y = 4'b1000; 
    #1; 
    $fdisplay(file, "scenario: 6, x = %d, y = %d, sum = %d", x, y, sum);

    // Scenario 7
    x = 4'b1111; 
    y = 4'b1111; 
    #1; 
    $fdisplay(file, "scenario: 7, x = %d, y = %d, sum = %d", x, y, sum);

    // Scenario 8
    x = 4'b0111; 
    y = 4'b1000; 
    #1; 
    $fdisplay(file, "scenario: 8, x = %d, y = %d, sum = %d", x, y, sum);

    // Scenario 9
    x = 4'b0011; 
    y = 4'b0101; 
    #1; 
    $fdisplay(file, "scenario: 9, x = %d, y = %d, sum = %d", x, y, sum);

    // Scenario 10
    x = 4'b0000; 
    y = 4'b1111; 
    #1; 
    $fdisplay(file, "scenario: 10, x = %d, y = %d, sum = %d", x, y, sum);

    $fclose(file);
    $finish;
  end
endmodule
