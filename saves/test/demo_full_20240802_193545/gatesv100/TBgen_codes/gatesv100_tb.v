`timescale 1ns / 1ps

module tb_top_module;

    // Testbench signals
    reg [99:0] in;
    wire [98:0] out_both;
    wire [99:1] out_any;
    wire [99:0] out_different;

    // Instantiate the DUT
    top_module dut (
        .in(in),
        .out_both(out_both),
        .out_any(out_any),
        .out_different(out_different)
    );

    // File handling
    integer file;
    
    initial begin
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        in = 100'b0; 
        #1;
        $fdisplay(file, "scenario: 1, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 2
        in = 100'b11111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000000000; 
        #1;
        $fdisplay(file, "scenario: 2, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 3
        in = 100'b10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010; 
        #1;
        $fdisplay(file, "scenario: 3, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 4
        in = 100'b11111111111111111111111111111111111111111111111111111111000000000000000000000000000000000000000000000; 
        #1;
        $fdisplay(file, "scenario: 4, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 5
        in = 100'b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111; 
        #1;
        $fdisplay(file, "scenario: 5, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 6
        in = 100'b10010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101; 
        #1;
        $fdisplay(file, "scenario: 6, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 7
        in = 100'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001; 
        #1;
        $fdisplay(file, "scenario: 7, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Scenario 8
        in = 100'b011100110011010100100000111001101001100110110111001010101100000110010101010101010101010100; 
        #1;
        $fdisplay(file, "scenario: 8, in = %b, out_both = %b, out_any = %b, out_different = %b", in, out_both, out_any, out_different);

        // Close file
        $fclose(file);
    end

endmodule
