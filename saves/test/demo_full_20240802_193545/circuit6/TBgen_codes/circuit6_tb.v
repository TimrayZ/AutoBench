`timescale 1ns / 1ps

module tb_top_module;

    reg [2:0] a;
    wire [15:0] q;

    // Instantiate DUT
    top_module DUT (
        .a(a),
        .q(q)
    );

    // File descriptor for output
    integer output_file;

    initial begin
        // Open the output file
        output_file = $fopen("TBout.txt", "w");

        // Test scenarios
        // Scenario 1
        a = 3'bx; 
        #0; 
        $fdisplay(output_file, "scenario: 1, a = %d, q = %d", a, q);

        // Scenario 2
        a = 3'bx;
        #5;
        $fdisplay(output_file, "scenario: 2, a = %d, q = %d", a, q);

        // Scenario 3
        a = 3'bx;
        #5;
        $fdisplay(output_file, "scenario: 3, a = %d, q = %d", a, q);

        // Scenario 4
        a = 3'b000; 
        #5; 
        $fdisplay(output_file, "scenario: 4, a = %d, q = %d", a, q);

        // Scenario 5
        a = 3'b001;
        #5;
        $fdisplay(output_file, "scenario: 5, a = %d, q = %d", a, q);

        // Scenario 6
        a = 3'b010; 
        #5; 
        $fdisplay(output_file, "scenario: 6, a = %d, q = %d", a, q);

        // Scenario 7
        a = 3'b011; 
        #5; 
        $fdisplay(output_file, "scenario: 7, a = %d, q = %d", a, q);

        // Scenario 8
        a = 3'b100; 
        #5; 
        $fdisplay(output_file, "scenario: 8, a = %d, q = %d", a, q);

        // Scenario 9
        a = 3'b101; 
        #5; 
        $fdisplay(output_file, "scenario: 9, a = %d, q = %d", a, q);

        // Scenario 10
        a = 3'b110; 
        #5; 
        $fdisplay(output_file, "scenario: 10, a = %d, q = %d", a, q);

        // Scenario 11
        a = 3'b111; 
        #5; 
        $fdisplay(output_file, "scenario: 11, a = %d, q = %d", a, q);

        // Scenario 12
        a = 3'b000; 
        #5; 
        $fdisplay(output_file, "scenario: 12, a = %d, q = %d", a, q);

        // Scenario 13
        a = 3'b001; 
        #5; 
        $fdisplay(output_file, "scenario: 13, a = %d, q = %d", a, q);

        // Scenario 14
        a = 3'b010; 
        #5; 
        $fdisplay(output_file, "scenario: 14, a = %d, q = %d", a, q);

        // Scenario 15
        a = 3'b100; 
        #5; 
        $fdisplay(output_file, "scenario: 15, a = %d, q = %d", a, q);

        // Scenario 16
        a = 3'b001; 
        #5; 
        $fdisplay(output_file, "scenario: 16, a = %d, q = %d", a, q);

        // Scenario 17
        a = 3'b001; 
        #5; 
        $fdisplay(output_file, "scenario: 17, a = %d, q = %d", a, q);

        // Scenario 18
        a = 3'b011; 
        #5; 
        $fdisplay(output_file, "scenario: 18, a = %d, q = %d", a, q);

        // Scenario 19
        a = 3'b101; 
        #5; 
        $fdisplay(output_file, "scenario: 19, a = %d, q = %d", a, q);
        
        // Close the output file
        $fclose(output_file);
        $finish;
    end

endmodule
