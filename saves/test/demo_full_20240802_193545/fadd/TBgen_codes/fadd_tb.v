`timescale 1ns / 1ps

module tb_top_module;

  // Inputs
  reg a;
  reg b;
  reg cin;

  // Outputs
  wire cout;
  wire sum;

  // Instantiate the Device Under Test (DUT)
  top_module dut (
    .a(a),
    .b(b),
    .cin(cin),
    .cout(cout),
    .sum(sum)
  );

  integer file;

  initial begin
    // Open file for writing
    file = $fopen("TBout.txt", "w");

    // Scenario 1
    a = 0; b = 0; cin = 0;
    #1; // Wait for 1 time unit
    $fdisplay(file, "scenario: 1, a = %d, b = %d, cin = %d, cout = %d, sum = %d", a, b, cin, cout, sum);

    // Scenario 2
    a = 0; b = 0; cin = 1;
    #1;
    $fdisplay(file, "scenario: 2, a = %d, b = %d, cin = %d, cout = %d, sum = %d", a, b, cin, cout, sum);

    // Scenario 3
    a = 0; b = 1; cin = 0;
    #1;
    $fdisplay(file, "scenario: 3, a = %d, b = %d, cin = %d, cout = %d, sum = %d", a, b, cin, cout, sum);

    // Scenario 4
    a = 0; b = 1; cin = 1;
    #1;
    $fdisplay(file, "scenario: 4, a = %d, b = %d, cin = %d, cout = %d, sum = %d", a, b, cin, cout, sum);

    // Scenario 5
    a = 1; b = 0; cin = 0;
    #1;
    $fdisplay(file, "scenario: 5, a = %d, b = %d, cin = %d, cout = %d, sum = %d", a, b, cin, cout, sum);

    // Scenario 6
    a = 1; b = 0; cin = 1;
    #1;
    $fdisplay(file, "scenario: 6, a = %d, b = %d, cin = %d, cout = %d, sum = %d", a, b, cin, cout, sum);

    // Scenario 7
    a = 1; b = 1; cin = 0;
    #1;
    $fdisplay(file, "scenario: 7, a = %d, b = %d, cin = %d, cout = %d, sum = %d", a, b, cin, cout, sum);

    // Scenario 8
    a = 1; b = 1; cin = 1;
    #1;
    $fdisplay(file, "scenario: 8, a = %d, b = %d, cin = %d, cout = %d, sum = %d", a, b, cin, cout, sum);

    // Close file
    $fclose(file);
    $finish;
  end

endmodule
