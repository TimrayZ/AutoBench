`timescale 1ns / 1ps

module tb_top_module;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg [3:0] c;
    reg [3:0] d;
    reg [3:0] e;

    // Outputs
    wire [3:0] q;

    // Instantiate the Device Under Test (DUT)
    top_module dut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .q(q)
    );

    // File handling
    integer file;

    initial begin
        // Open the file to write
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        a = 4'bx; b = 4'bx; c = 4'bx; d = 4'bx; e = 4'bx;
        #0; // Time 0ns
        $fdisplay(file, "scenario: 1, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);
        
        // Scenario 2
        #5; // Time 5ns
        $fdisplay(file, "scenario: 2, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);
        
        // Scenario 3
        #5; // Time 10ns
        $fdisplay(file, "scenario: 3, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);
        
        // Scenario 4
        a = 4'b0001; b = 4'b0010; c = 4'b0000; d = 4'b0011; e = 4'b0100; // Initialize inputs
        #5; // Time 15ns
        $fdisplay(file, "scenario: 4, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);
        
        // Scenario 5
        c = 4'b0001; // Change c to 1
        #5; // Time 20ns
        $fdisplay(file, "scenario: 5, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);
        
        // Scenario 6
        c = 4'b0010; // Change c to 2
        #5; // Time 25ns
        $fdisplay(file, "scenario: 6, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);
        
        // Scenario 7
        c = 4'b0011; // Change c to 3
        #5; // Time 30ns
        $fdisplay(file, "scenario: 7, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);
        
        // Scenario 8
        c = 4'b0100; // Change c to 4
        #5; // Time 35ns
        $fdisplay(file, "scenario: 8, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);

        // Scenario 9
        c = 4'b0101; // Change c to 5
        #5; // Time 40ns
        $fdisplay(file, "scenario: 9, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);

        // Scenario 10
        c = 4'b0110; // Change c to 6
        #5; // Time 45ns
        $fdisplay(file, "scenario: 10, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);

        // Scenario 11
        c = 4'b0111; // Change c to 7
        #5; // Time 50ns
        $fdisplay(file, "scenario: 11, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);

        // Scenario 12
        c = 4'b1000; // Change c to 8
        #5; // Time 55ns
        $fdisplay(file, "scenario: 12, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);

        // Scenario 13
        c = 4'b1001; // Change c to 9
        #5; // Time 60ns
        $fdisplay(file, "scenario: 13, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);

        // Scenario 14
        c = 4'b1010; // Change c to A
        #5; // Time 65ns
        $fdisplay(file, "scenario: 14, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);

        // Scenario 15
        c = 4'b1011; // Change c to B
        #5; // Time 70ns
        $fdisplay(file, "scenario: 15, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);
        
        // Scenario 16
        c = 4'b1100; // Change c to C
        #5; // Time 75ns
        $fdisplay(file, "scenario: 16, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);
        
        // Scenario 17
        c = 4'b1101; // Change c to D
        #5; // Time 80ns
        $fdisplay(file, "scenario: 17, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);
        
        // Scenario 18
        c = 4'b1110; // Change c to E
        #5; // Time 85ns
        $fdisplay(file, "scenario: 18, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);
        
        // Scenario 19
        c = 4'b1111; // Change c to F
        #5; // Time 90ns
        $fdisplay(file, "scenario: 19, a = %d, b = %d, c = %d, d = %d, e = %d, q = %d", a, b, c, d, e, q);

        // Close the file
        $fclose(file);
    end

endmodule
