`timescale 1ns / 1ps

module tb_top_module;

    // Declare input signals
    reg a;
    reg b;
    reg c;

    // Declare output signals
    wire w;
    wire x;
    wire y;
    wire z;

    // Instantiate the DUT
    top_module uut (
        .a(a),
        .b(b),
        .c(c),
        .w(w),
        .x(x),
        .y(y),
        .z(z)
    );

    // File descriptor for output
    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");

        // Test scenario 1
        a = 0; b = 0; c = 0;
        #1; // Wait for signals to stabilize
        $fdisplay(file, "scenario: 1, a = %d, b = %d, c = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, w, x, y, z);

        // Test scenario 2
        a = 1; b = 0; c = 0;
        #1;
        $fdisplay(file, "scenario: 2, a = %d, b = %d, c = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, w, x, y, z);

        // Test scenario 3
        a = 0; b = 1; c = 0;
        #1;
        $fdisplay(file, "scenario: 3, a = %d, b = %d, c = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, w, x, y, z);

        // Test scenario 4
        a = 0; b = 0; c = 1;
        #1;
        $fdisplay(file, "scenario: 4, a = %d, b = %d, c = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, w, x, y, z);

        // Test scenario 5
        a = 1; b = 1; c = 0;
        #1;
        $fdisplay(file, "scenario: 5, a = %d, b = %d, c = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, w, x, y, z);

        // Test scenario 6
        a = 1; b = 0; c = 1;
        #1;
        $fdisplay(file, "scenario: 6, a = %d, b = %d, c = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, w, x, y, z);

        // Test scenario 7
        a = 0; b = 1; c = 1;
        #1;
        $fdisplay(file, "scenario: 7, a = %d, b = %d, c = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, w, x, y, z);

        // Test scenario 8
        a = 1; b = 1; c = 1;
        #1;
        $fdisplay(file, "scenario: 8, a = %d, b = %d, c = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, w, x, y, z);

        // Test scenario 9
        a = 0; b = 1; c = 0;
        #1;
        $fdisplay(file, "scenario: 9a, a = %d, b = %d, c = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, w, x, y, z);
        a = 1; b = 1; c = 0;
        #1;
        $fdisplay(file, "scenario: 9b, a = %d, b = %d, c = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, w, x, y, z);

        // Test scenario 10
        a = 1; b = 1; c = 1;
        #1;
        $fdisplay(file, "scenario: 10a, a = %d, b = %d, c = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, w, x, y, z);
        a = 0; b = 0; c = 0;
        #1;
        $fdisplay(file, "scenario: 10b, a = %d, b = %d, c = %d, w = %d, x = %d, y = %d, z = %d", a, b, c, w, x, y, z);

        // Close the output file
        $fclose(file);
    end

endmodule
