`timescale 1ns / 1ps

module tb_top_module;

    reg [2:0] vec;
    wire [2:0] outv;
    wire o2, o1, o0;

    // Instantiate the DUT
    top_module DUT (
        .vec(vec),
        .outv(outv),
        .o2(o2),
        .o1(o1),
        .o0(o0)
    );

    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");
        
        // Scenario 1: Apply input vector '000'
        vec = 3'b000;
        #1; // Wait for a clock cycle
        $fdisplay(file, "scenario: 1, vec = %d, outv = %d, o2 = %d, o1 = %d, o0 = %d", vec, outv, o2, o1, o0);

        // Scenario 2: Apply input vector '001'
        vec = 3'b001;
        #1; // Wait for a clock cycle
        $fdisplay(file, "scenario: 2, vec = %d, outv = %d, o2 = %d, o1 = %d, o0 = %d", vec, outv, o2, o1, o0);

        // Scenario 3: Apply input vector '010'
        vec = 3'b010;
        #1; // Wait for a clock cycle
        $fdisplay(file, "scenario: 3, vec = %d, outv = %d, o2 = %d, o1 = %d, o0 = %d", vec, outv, o2, o1, o0);

        // Scenario 4: Apply input vector '011'
        vec = 3'b011;
        #1; // Wait for a clock cycle
        $fdisplay(file, "scenario: 4, vec = %d, outv = %d, o2 = %d, o1 = %d, o0 = %d", vec, outv, o2, o1, o0);

        // Scenario 5: Apply input vector '100'
        vec = 3'b100;
        #1; // Wait for a clock cycle
        $fdisplay(file, "scenario: 5, vec = %d, outv = %d, o2 = %d, o1 = %d, o0 = %d", vec, outv, o2, o1, o0);

        // Scenario 6: Apply input vector '101'
        vec = 3'b101;
        #1; // Wait for a clock cycle
        $fdisplay(file, "scenario: 6, vec = %d, outv = %d, o2 = %d, o1 = %d, o0 = %d", vec, outv, o2, o1, o0);

        // Scenario 7: Apply input vector '110'
        vec = 3'b110;
        #1; // Wait for a clock cycle
        $fdisplay(file, "scenario: 7, vec = %d, outv = %d, o2 = %d, o1 = %d, o0 = %d", vec, outv, o2, o1, o0);

        // Scenario 8: Apply input vector '111'
        vec = 3'b111;
        #1; // Wait for a clock cycle
        $fdisplay(file, "scenario: 8, vec = %d, outv = %d, o2 = %d, o1 = %d, o0 = %d", vec, outv, o2, o1, o0);

        // Close the output file
        $fclose(file);
        
        // End simulation
        $finish;
    end

endmodule
