`timescale 1ns / 1ps

module tb_top_module;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire out_assign;
    reg out_alwaysblock;

    // Instantiate the DUT
    top_module dut (
        .a(a),
        .b(b),
        .out_assign(out_assign),
        .out_alwaysblock(out_alwaysblock)
    );

    // File handling
    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");

        // Scenario 1: a = 0, b = 0
        a = 0; b = 0;
        #1;
        $fdisplay(file, "scenario: 1, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);

        // Scenario 2: a = 0, b = 1
        a = 0; b = 1;
        #1;
        $fdisplay(file, "scenario: 2, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);

        // Scenario 3: a = 1, b = 0
        a = 1; b = 0;
        #1;
        $fdisplay(file, "scenario: 3, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);

        // Scenario 4: a = 1, b = 1
        a = 1; b = 1;
        #1;
        $fdisplay(file, "scenario: 4, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);

        // Scenario 5: Toggle a from 0 to 1 with b fixed at 0
        a = 0; b = 0;
        #1;
        $fdisplay(file, "scenario: 5a, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);
        a = 1; 
        #1;
        $fdisplay(file, "scenario: 5b, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);

        // Scenario 6: Toggle b from 0 to 1 with a fixed at 0
        a = 0; b = 0;
        #1;
        $fdisplay(file, "scenario: 6a, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);
        b = 1; 
        #1;
        $fdisplay(file, "scenario: 6b, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);

        // Scenario 7: Toggle both a and b from 0 to 1
        a = 0; b = 0;
        #1;
        $fdisplay(file, "scenario: 7a, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);
        a = 1; b = 1;
        #1;
        $fdisplay(file, "scenario: 7b, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);

        // Scenario 8: Set a and b to high impedance (only if simulator supports it)
        // Assuming a high impedance state is implemented in the simulator
        a = 1'bz; b = 1'bz; 
        #1;
        $fdisplay(file, "scenario: 8, a = %d (high Z), b = %d (high Z), out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);

        // Close the file
        $fclose(file);
        $stop;
    end

endmodule
