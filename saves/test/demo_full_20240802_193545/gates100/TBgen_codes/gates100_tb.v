`timescale 1ns/1ns

module tb_top_module;

    reg [99:0] in;
    wire out_and;
    wire out_or;
    wire out_xor;

    // Instantiate the DUT
    top_module dut (
        .in(in),
        .out_and(out_and),
        .out_or(out_or),
        .out_xor(out_xor)
    );

    integer file;

    initial begin
        file = $fopen("TBout.txt", "w");
        
        // Scenario 1
        in = 100'b0; // Set all inputs to 0
        #1;
        $fdisplay(file, "scenario: 1, in = %d, out_and = %b, out_or = %b, out_xor = %b", in, out_and, out_or, out_xor);

        // Scenario 2
        in = 100'b1; // Set all inputs to 1
        #1;
        $fdisplay(file, "scenario: 2, in = %d, out_and = %b, out_or = %b, out_xor = %b", in, out_and, out_or, out_xor);

        // Scenario 3
        in = 100'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001; // Set half of the inputs (in[49:0] = 1, in[99:50] = 0)
        #1;
        $fdisplay(file, "scenario: 3, in = %d, out_and = %b, out_or = %b, out_xor = %b", in, out_and, out_or, out_xor);

        // Scenario 4
        in = 100'b1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000; // Set half of the inputs (in[99:50] = 1, in[49:0] = 0)
        #1;
        $fdisplay(file, "scenario: 4, in = %d, out_and = %b, out_or = %b, out_xor = %b", in, out_and, out_or, out_xor);

        // Scenario 5
        in = 100'b0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101; // Alternating
        #1;
        $fdisplay(file, "scenario: 5, in = %d, out_and = %b, out_or = %b, out_xor = %b", in, out_and, out_or, out_xor);

        // Scenario 6
        in = 100'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111; // First 50 inputs 1, remaining 0
        #1;
        $fdisplay(file, "scenario: 6, in = %d, out_and = %b, out_or = %b, out_xor = %b", in, out_and, out_or, out_xor);

        // Scenario 7
        in = 100'b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010; // Random pattern
        #1;
        $fdisplay(file, "scenario: 7, in = %d, out_and = %b, out_or = %b, out_xor = %b", in, out_and, out_or, out_xor);

        // Scenario 8
        in = 100'b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010; // Preset pattern
        #1;
        $fdisplay(file, "scenario: 8, in = %d, out_and = %b, out_or = %b, out_xor = %b", in, out_and, out_or, out_xor);

        // Scenario 9: Set inputs in[49:0] = 1 and in[99:50] = 0 at clock cycle 6
        in = 100'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001; // 49 bits 1, 51 bits 0
        #1;
        $fdisplay(file, "scenario: 9, in = %d, out_and = %b, out_or = %b, out_xor = %b", in, out_and, out_or, out_xor);
        
        // Scenario 10: Set inputs in[99:50] to 1 and in[49:0] to 0 at clock cycle 7
        in = 100'b1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000; // 51 bits 1, 49 bits 0
        #1;
        $fdisplay(file, "scenario: 10, in = %d, out_and = %b, out_or = %b, out_xor = %b", in, out_and, out_or, out_xor);
        
        $fclose(file);
        $finish;
    end

endmodule
