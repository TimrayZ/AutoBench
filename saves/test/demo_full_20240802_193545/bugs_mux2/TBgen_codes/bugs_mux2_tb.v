`timescale 1ns/1ps

module tb_top_module;

    // Input signals
    reg sel;
    reg [7:0] a;
    reg [7:0] b;

    // Output signal
    wire [7:0] out;

    // Instantiate the DUT
    top_module dut (
        .sel(sel),
        .a(a),
        .b(b),
        .out(out)
    );

    // File handling for exporting signals
    integer file;

    initial begin
        // Open the file for writing
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        sel = 0; a = 8'b10101010; b = 8'b01010101; #1;
        $fdisplay(file, "scenario: 1, sel = %d, a = %d, b = %d, out = %d", sel, a, b, out);

        // Scenario 2
        sel = 1; a = 8'b10101010; b = 8'b01010101; #1;  // Added 'a' and 'b' definition for scenario 2
        $fdisplay(file, "scenario: 2, sel = %d, a = %d, b = %d, out = %d", sel, a, b, out);

        // Scenario 3
        sel = 0; a = 8'b00000000; b = 8'b11111111; #1;
        $fdisplay(file, "scenario: 3, sel = %d, a = %d, b = %d, out = %d", sel, a, b, out);

        // Scenario 4
        sel = 1; a = 8'b00000000; b = 8'b11111111; #1; // Added 'a' and 'b' definition for scenario 4
        $fdisplay(file, "scenario: 4, sel = %d, a = %d, b = %d, out = %d", sel, a, b, out);

        // Scenario 5
        sel = 0; a = 8'b11001100; b = 8'b00110011; #1;
        $fdisplay(file, "scenario: 5, sel = %d, a = %d, b = %d, out = %d", sel, a, b, out);

        // Scenario 6
        sel = 1; a = 8'b11001100; b = 8'b00110011; #1; 
        $fdisplay(file, "scenario: 6, sel = %d, a = %d, b = %d, out = %d", sel, a, b, out);

        // Scenario 7: Rapid changes to sel
        a = 8'b10101010; b = 8'b01010101; 
        sel = 0; #1;
        $fdisplay(file, "scenario: 7a, sel = %d, a = %d, b = %d, out = %d", sel, a, b, out);
        sel = 1; #1;
        $fdisplay(file, "scenario: 7b, sel = %d, a = %d, b = %d, out = %d", sel, a, b, out);
        sel = 0; #1;
        $fdisplay(file, "scenario: 7c, sel = %d, a = %d, b = %d, out = %d", sel, a, b, out);
        sel = 1; #1;
        $fdisplay(file, "scenario: 7d, sel = %d, a = %d, b = %d, out = %d", sel, a, b, out);

        // Closing the multiple toggles for scenario 7 as per checklist
        sel = 0; #1;
        $fdisplay(file, "scenario: 7e, sel = %d, a = %d, b = %d, out = %d", sel, a, b, out);
        sel = 1; #1;
        $fdisplay(file, "scenario: 7f, sel = %d, a = %d, b = %d, out = %d", sel, a, b, out);

        // Close the file
        $fclose(file);
    end

endmodule
