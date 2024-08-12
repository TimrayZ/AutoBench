`timescale 1ns / 1ps

module testbench;
    // Parameters
    reg a;
    reg b;
    wire out;

    // DUT Instance
    top_module uut (
        .a(a),
        .b(b),
        .out(out)
    );

    // File Descriptor
    integer fd;

    initial begin
        // Open file for writing
        fd = $fopen("TBout.txt", "w");
        
        // Scenario 1
        a = 0; b = 0; #1;
        $fdisplay(fd, "scenario: 1, a = %d, b = %d, out = %d", a, b, out);
        
        // Scenario 2
        a = 0; b = 1; #1;
        $fdisplay(fd, "scenario: 2, a = %d, b = %d, out = %d", a, b, out);
        
        // Scenario 3
        a = 1; b = 0; #1;
        $fdisplay(fd, "scenario: 3, a = %d, b = %d, out = %d", a, b, out);
        
        // Scenario 4
        a = 1; b = 1; #1;
        $fdisplay(fd, "scenario: 4, a = %d, b = %d, out = %d", a, b, out);
        
        // Scenario 5
        a = 0; b = 0; #1;
        $fdisplay(fd, "scenario: 5a, a = %d, b = %d, out = %d", a, b, out);
        a = 1; b = 0; #1;
        $fdisplay(fd, "scenario: 5b, a = %d, b = %d, out = %d", a, b, out);
        
        // Scenario 6
        a = 1; b = 1; #1;
        $fdisplay(fd, "scenario: 6, a = %d, b = %d, out = %d", a, b, out);
        
        // Scenario 7
        a = 0; b = 0; #1;
        $fdisplay(fd, "scenario: 7, a = %d, b = %d, out = %d", a, b, out);
        
        // Close file
        $fclose(fd);
        $finish;
    end
endmodule
