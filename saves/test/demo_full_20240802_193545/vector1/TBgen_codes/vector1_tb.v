`timescale 1ns / 1ps

module tb_top_module;

    reg [15:0] in;
    wire [7:0] out_hi;
    wire [7:0] out_lo;

    // Instantiate the DUT
    top_module DUT (
        .in(in),
        .out_hi(out_hi),
        .out_lo(out_lo)
    );

    // File handling
    integer file;

    initial begin
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        in = 16'b0000000000000000; 
        #1;
        $fdisplay(file, "scenario: 1, in = %d, out_hi = %d, out_lo = %d", in, out_hi, out_lo);

        // Scenario 2
        in = 16'b1111111111111111; 
        #1;
        $fdisplay(file, "scenario: 2, in = %d, out_hi = %d, out_lo = %d", in, out_hi, out_lo);

        // Scenario 3
        in = 16'b1010101010101010; 
        #1;
        $fdisplay(file, "scenario: 3, in = %d, out_hi = %d, out_lo = %d", in, out_hi, out_lo);

        // Scenario 4
        in = 16'b0001001000110100; 
        #1;
        $fdisplay(file, "scenario: 4, in = %d, out_hi = %d, out_lo = %d", in, out_hi, out_lo);

        // Scenario 5
        in = 16'b1111000011110000; 
        #1;
        $fdisplay(file, "scenario: 5, in = %d, out_hi = %d, out_lo = %d", in, out_hi, out_lo);

        // Scenario 6
        in = 16'b0000111100001111; 
        #1;
        $fdisplay(file, "scenario: 6, in = %d, out_hi = %d, out_lo = %d", in, out_hi, out_lo);

        // Scenario 7
        in = 16'b0101010101010101; 
        #1;
        $fdisplay(file, "scenario: 7, in = %d, out_hi = %d, out_lo = %d", in, out_hi, out_lo);

        // Scenario 8
        in = 16'b1100110011001100; 
        #1;
        $fdisplay(file, "scenario: 8, in = %d, out_hi = %d, out_lo = %d", in, out_hi, out_lo);

        // Scenario 9
        in = 16'b0000000011111111; 
        #1;
        $fdisplay(file, "scenario: 9, in = %d, out_hi = %d, out_lo = %d", in, out_hi, out_lo);

        // Scenario 10
        in = 16'b1111111100000000; 
        #1;
        $fdisplay(file, "scenario: 10, in = %d, out_hi = %d, out_lo = %d", in, out_hi, out_lo);

        $fclose(file);
        $finish;
    end

endmodule
