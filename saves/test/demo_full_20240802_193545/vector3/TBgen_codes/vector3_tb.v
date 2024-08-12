`timescale 1ns / 1ps

module tb_top_module;

    // Inputs
    reg [4:0] a;
    reg [4:0] b;
    reg [4:0] c;
    reg [4:0] d;
    reg [4:0] e;
    reg [4:0] f;

    // Outputs
    wire [7:0] w;
    wire [7:0] x;
    wire [7:0] y;
    wire [7:0] z;

    // Instantiate the DUT
    top_module dut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .w(w),
        .x(x),
        .y(y),
        .z(z)
    );

    // File for exporting results
    integer file;

    initial begin
        // Open the file to write output
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        a = 5'b00001; b = 5'b00010; c = 5'b00011; d = 5'b00100; e = 5'b00101; f = 5'b00110;
        #10; // wait for signals to stabilize
        $fdisplay(file, "scenario: 1, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, d, e, f, w, x, y, z);
        
        // Scenario 2
        a = 5'b11111; b = 5'b11110; c = 5'b11101; d = 5'b11100; e = 5'b11011; f = 5'b11010;
        #10; // wait for signals to stabilize
        $fdisplay(file, "scenario: 2, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, d, e, f, w, x, y, z);
        
        // Scenario 3
        a = 5'b01010; b = 5'b10101; c = 5'b11000; d = 5'b00111; e = 5'b01001; f = 5'b10010;
        #10; // wait for signals to stabilize
        $fdisplay(file, "scenario: 3, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, d, e, f, w, x, y, z);
        
        // Scenario 4
        a = 5'b00000; b = 5'b11111; c = 5'b00001; d = 5'b11110; e = 5'b00010; f = 5'b11101;
        #10; // wait for signals to stabilize
        $fdisplay(file, "scenario: 4, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, d, e, f, w, x, y, z);
        
        // Scenario 5
        a = 5'b00111; b = 5'b01000; c = 5'b01001; d = 5'b01010; e = 5'b01011; f = 5'b01100;
        #10; // wait for signals to stabilize
        $fdisplay(file, "scenario: 5, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, d, e, f, w, x, y, z);
        
        // Scenario 6
        a = 5'b10000; b = 5'b10001; c = 5'b10010; d = 5'b10011; e = 5'b10100; f = 5'b10101;
        #10; // wait for signals to stabilize
        $fdisplay(file, "scenario: 6, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, d, e, f, w, x, y, z);
        
        // Scenario 7
        a = 5'b11001; b = 5'b11010; c = 5'b11011; d = 5'b11100; e = 5'b11101; f = 5'b11110;
        #10; // wait for signals to stabilize
        $fdisplay(file, "scenario: 7, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, d, e, f, w, x, y, z);
        
        // Scenario 8
        a = 5'b11111; b = 5'b00000; c = 5'b10101; d = 5'b10110; e = 5'b01000; f = 5'b01001;
        #10; // wait for signals to stabilize
        $fdisplay(file, "scenario: 8, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, d, e, f, w, x, y, z);

        // Close the file after completion
        $fclose(file);
        $finish;
    end

endmodule
