`timescale 1ns / 1ps

module tb_top_module;

    reg [31:0] in;
    wire [31:0] out;
    
    // Instantiate the DUT
    top_module DUT (
        .in(in),
        .out(out)
    );

    integer outfile;

    initial begin
        // Open the output file
        outfile = $fopen("TBout.txt", "w");
        
        // Scenario 1
        in = 32'h00000000; 
        #1;
        $fdisplay(outfile, "scenario: 1, in = %h, out = %h", in, out);
        
        // Scenario 2
        in = 32'hFFFFFFFF; 
        #1;
        $fdisplay(outfile, "scenario: 2, in = %h, out = %h", in, out);
        
        // Scenario 3
        in = 32'hAABBCCDD; 
        #1;
        $fdisplay(outfile, "scenario: 3, in = %h, out = %h", in, out);
        
        // Scenario 4
        in = 32'h12345678; 
        #1;
        $fdisplay(outfile, "scenario: 4, in = %h, out = %h", in, out);
        
        // Scenario 5
        in = 32'hDEADBEEF; 
        #1;
        $fdisplay(outfile, "scenario: 5, in = %h, out = %h", in, out);
        
        // Scenario 6
        in = 32'h0F0E0D0C; 
        #1;
        $fdisplay(outfile, "scenario: 6, in = %h, out = %h", in, out);
        
        // Scenario 7 - Added missing scenario
        in = 32'h11112222; // changed from 32'h1111222233334444 to 32'h11112222 as it should be 32 bits
        #1;
        $fdisplay(outfile, "scenario: 7, in = %h, out = %h", in, out);
        
        // Scenario 8
        in = 32'h87654321; 
        #1;
        $fdisplay(outfile, "scenario: 8, in = %h, out = %h", in, out);
        
        // Scenario 9
        in = 32'hFFFFFFFF; 
        #1;
        $fdisplay(outfile, "scenario: 9a, in = %h, out = %h", in, out);
        in = 32'h00000001; 
        #1;
        $fdisplay(outfile, "scenario: 9b, in = %h, out = %h", in, out);
        
        // Scenario 10
        in = 32'h12345678; 
        #1;
        $fdisplay(outfile, "scenario: 10a, in = %h, out = %h", in, out);
        in = 32'hFFFFFFFF; 
        #1;
        $fdisplay(outfile, "scenario: 10b, in = %h, out = %h", in, out);
        
        // Close the output file
        $fclose(outfile);
        
        // Finish the simulation
        $finish;
    end

endmodule
