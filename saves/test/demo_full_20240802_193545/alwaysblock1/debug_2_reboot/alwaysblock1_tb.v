`timescale 1ns / 1ps

module tb_top_module;
    reg a;
    reg b;
    wire out_assign;
    reg out_alwaysblock;
    
    // Instantiate the DUT
    top_module uut (
        .a(a),
        .b(b),
        .out_assign(out_assign),
        .out_alwaysblock(out_alwaysblock)
    );

    integer file;
    
    initial begin
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        a = 0; b = 0; #1;
        $fdisplay(file, "scenario: 1, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);
        
        // Scenario 2
        a = 0; b = 1; #1;
        $fdisplay(file, "scenario: 2, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);
        
        // Scenario 3
        a = 1; b = 0; #1;
        $fdisplay(file, "scenario: 3, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);
        
        // Scenario 4
        a = 1; b = 1; #1;
        $fdisplay(file, "scenario: 4, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);
        
        // Scenario 5
        a = 0; b = 0; #1;
        $fdisplay(file, "scenario: 5a, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);
        a = 1; #1;
        $fdisplay(file, "scenario: 5b, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);
        
        // Scenario 6
        a = 0; b = 0; #1;
        $fdisplay(file, "scenario: 6a, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);
        b = 1; #1;
        $fdisplay(file, "scenario: 6b, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);
        
        // Scenario 7
        a = 0; b = 0; #1;
        $fdisplay(file, "scenario: 7a, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);
        a = 1; b = 1; #1;
        $fdisplay(file, "scenario: 7b, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);
        
        // Scenario 8
        a = 0; b = 0; #1;
        $fdisplay(file, "scenario: 8a, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);
        // For simulation purpose, we use a tri-state representation as 1'bz.
        a = 1'bz; b = 1'bz; #1;
        $fdisplay(file, "scenario: 8b, a = %d, b = %d, out_assign = %d, out_alwaysblock = %d", a, b, out_assign, out_alwaysblock);
        
        $fclose(file);
        $finish;
    end

endmodule
