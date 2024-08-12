`timescale 1ns / 1ps

module tb_top_module;
    reg [7:0] in;
    wire [2:0] pos;

    // Instantiate the DUT
    top_module DUT (
        .in(in),
        .pos(pos)
    );

    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        in = 8'b00000000; 
        #1;
        $fdisplay(file, "scenario: 1, in = %d, pos = %d", in, pos);
        
        // Scenario 2
        in = 8'b00000001; 
        #1;
        $fdisplay(file, "scenario: 2, in = %d, pos = %d", in, pos);
        
        // Scenario 3
        in = 8'b00000010; 
        #1;
        $fdisplay(file, "scenario: 3, in = %d, pos = %d", in, pos);
        
        // Scenario 4
        in = 8'b00000100; 
        #1;
        $fdisplay(file, "scenario: 4, in = %d, pos = %d", in, pos);
        
        // Scenario 5
        in = 8'b00001000; 
        #1;
        $fdisplay(file, "scenario: 5, in = %d, pos = %d", in, pos);
        
        // Scenario 6
        in = 8'b10000000; 
        #1;
        $fdisplay(file, "scenario: 6, in = %d, pos = %d", in, pos);
        
        // Scenario 7
        in = 8'b01010101; 
        #1;
        $fdisplay(file, "scenario: 7, in = %d, pos = %d", in, pos);
        
        // Scenario 8
        in = 8'b11111111; 
        #1;
        $fdisplay(file, "scenario: 8, in = %d, pos = %d", in, pos);
        
        // Scenario 9
        in = 8'b00101000; 
        #1;
        $fdisplay(file, "scenario: 9, in = %d, pos = %d", in, pos);
        
        // Scenario 10
        in = 8'b00001111; 
        #1;
        $fdisplay(file, "scenario: 10, in = %d, pos = %d", in, pos);

        // Close the output file
        $fclose(file);
        $finish;
    end
endmodule
