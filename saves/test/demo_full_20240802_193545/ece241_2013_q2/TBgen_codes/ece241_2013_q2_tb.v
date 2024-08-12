`timescale 1ns / 1ps

module tb_top_module;

// Inputs
reg a;
reg b;
reg c;
reg d;

// Outputs
wire out_sop;
wire out_pos;

// Instantiate the DUT
top_module DUT (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .out_sop(out_sop),
    .out_pos(out_pos)
);

// File handling
integer file;

initial begin
    // Open the output file
    file = $fopen("TBout.txt", "w");
    
    // Scenario 1
    a = 0; b = 0; c = 1; d = 0; #1; // binary 0010
    $fdisplay(file, "scenario: 1, a = %d, b = %d, c = %d, d = %d, out_sop = %d, out_pos = %d", a, b, c, d, out_sop, out_pos);
    
    // Scenario 2
    a = 0; b = 1; c = 1; d = 1; #1; // binary 0111
    $fdisplay(file, "scenario: 2, a = %d, b = %d, c = %d, d = %d, out_sop = %d, out_pos = %d", a, b, c, d, out_sop, out_pos);
    
    // Scenario 3
    a = 1; b = 1; c = 1; d = 1; #1; // binary 1111
    $fdisplay(file, "scenario: 3, a = %d, b = %d, c = %d, d = %d, out_sop = %d, out_pos = %d", a, b, c, d, out_sop, out_pos);
    
    // Scenario 4
    a = 0; b = 0; c = 0; d = 0; #1; // binary 0000
    $fdisplay(file, "scenario: 4, a = %d, b = %d, c = %d, d = %d, out_sop = %d, out_pos = %d", a, b, c, d, out_sop, out_pos);
    
    // Scenario 5
    a = 0; b = 0; c = 1; d = 1; #1; // binary 0011
    $fdisplay(file, "scenario: 5, a = %d, b = %d, c = %d, d = %d, out_sop = %d, out_pos = %d", a, b, c, d, out_sop, out_pos);
    
    // Scenario 6
    a = 0; b = 1; c = 0; d = 0; #1; // binary 0100
    $fdisplay(file, "scenario: 6, a = %d, b = %d, c = %d, d = %d, out_sop = %d, out_pos = %d", a, b, c, d, out_sop, out_pos);
    
    // Scenario 7
    a = 0; b = 1; c = 0; d = 1; #1; // binary 0101
    $fdisplay(file, "scenario: 7, a = %d, b = %d, c = %d, d = %d, out_sop = %d, out_pos = %d", a, b, c, d, out_sop, out_pos);
    
    // Scenario 8
    a = 0; b = 1; c = 1; d = 0; #1; // binary 0110
    $fdisplay(file, "scenario: 8, a = %d, b = %d, c = %d, d = %d, out_sop = %d, out_pos = %d", a, b, c, d, out_sop, out_pos);
    
    // Scenario 9
    a = 1; b = 0; c = 0; d = 0; #1; // binary 1000
    $fdisplay(file, "scenario: 9, a = %d, b = %d, c = %d, d = %d, out_sop = %d, out_pos = %d", a, b, c, d, out_sop, out_pos);
    
    // Scenario 10
    a = 1; b = 0; c = 1; d = 1; #1; // binary 1011
    $fdisplay(file, "scenario: 10, a = %d, b = %d, c = %d, d = %d, out_sop = %d, out_pos = %d", a, b, c, d, out_sop, out_pos);
    
    // Scenario 11
    a = 1; b = 1; c = 0; d = 1; #1; // binary 1101
    $fdisplay(file, "scenario: 11, a = %d, b = %d, c = %d, d = %d, out_sop = %d, out_pos = %d", a, b, c, d, out_sop, out_pos);
    
    // Scenario 12
    a = 1; b = 1; c = 1; d = 0; #1; // binary 1110
    $fdisplay(file, "scenario: 12, a = %d, b = %d, c = %d, d = %d, out_sop = %d, out_pos = %d", a, b, c, d, out_sop, out_pos);
    
    // Close the output file
    $fclose(file);
    
    // End simulation
    $finish;
end

endmodule
