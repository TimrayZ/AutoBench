`timescale 1ns / 1ps

module tb_top_module;
    
    // Inputs
    reg [255:0] in;
    reg [7:0] sel;

    // Outputs
    wire out;

    // Instantiate the Device Under Test (DUT)
    top_module DUT (
        .in(in),
        .sel(sel),
        .out(out)
    );

    // File pointer
    integer fp;

    initial begin
        // Open the output file
        fp = $fopen("TBout.txt", "w");
        
        // Scenario 1
        in = 256'b0; // all bits are 0
        sel = 8'd0; // select in[0]
        #10; // Wait for stable signals
        $fdisplay(fp, "scenario: 1, in = %b, sel = %d, out = %b", in, sel, out);

        // Scenario 2
        in = {128'b0, 128'b1}; // first 128 bits are 0, the rest are 1
        sel = 8'd1; // select in[1]
        #10; // Wait for stable signals
        $fdisplay(fp, "scenario: 2, in = %b, sel = %d, out = %b", in, sel, out);

        // Scenario 3
        in = 256'b00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_11111111; // bits 0 to 7 are 1
        sel = 8'd2; // select in[2]
        #10; // Wait for stable signals
        $fdisplay(fp, "scenario: 3, in = %b, sel = %d, out = %b", in, sel, out);

        // Scenario 4
        in = 256'b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010; // random pattern for testing
        sel = 8'd255; // select in[255]
        #10; // Wait for stable signals
        $fdisplay(fp, "scenario: 4, in = %b, sel = %d, out = %b", in, sel, out);
        
        // Scenario 5
        in = 256'b0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101; // alternating bits
        sel = 8'd128; // select in[128]
        #10; // Wait for stable signals
        $fdisplay(fp, "scenario: 5, in = %b, sel = %d, out = %b", in, sel, out);

        // Scenario 6
        in = 256'b1; // All bits set to 1
        sel = 8'd255; // select in[255]
        #10; // Wait for stable signals
        $fdisplay(fp, "scenario: 6, in = %b, sel = %d, out = %b", in, sel, out);
        
        // Scenario 7
        in = 256'b0; 
        in[127] = 1'b1; // all bits are 0 except in[127]
        sel = 8'd127; // select in[127]
        #10; // Wait for stable signals
        $fdisplay(fp, "scenario: 7, in = %b, sel = %d, out = %b", in, sel, out);

        // Scenario 8
        in = 256'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111; // bits 0 to 4 are 1
        sel = 8'd4; // select in[4]
        #10; // Wait for stable signals
        $fdisplay(fp, "scenario: 8, in = %b, sel = %d, out = %b", in, sel, out);

        // Scenario 9
        in = 256'b0;
        in[64] = 1'b1; // in[64] is 1
        sel = 8'd64; // select in[64]
        #10; // Wait for stable signals
        $fdisplay(fp, "scenario: 9, in = %b, sel = %d, out = %b", in, sel, out);

        // Scenario 10
        in = 256'b1111000000000000111100000000000011110000000000001111000000000000; // alternating groups of bits (4 bits each)
        sel = 8'd32; // select in[32]
        #10; // Wait for stable signals
        $fdisplay(fp, "scenario: 10, in = %b, sel = %d, out = %b", in, sel, out);

        // Close the file
        $fclose(fp);
        
        // End simulation
        $stop;
    end
endmodule
