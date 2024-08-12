`timescale 1ns / 1ps

module tb_top_module;

    reg a, b, c, d;
    wire q;

    // Instantiate DUT
    top_module DUT (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .q(q)
    );

    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");
        
        // Scenario 1
        a = 0; b = 0; c = 0; d = 0; 
        #20;                      
        $fdisplay(file, "scenario: 1, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Scenario 2
        d = 1; 
        #5;                       
        $fdisplay(file, "scenario: 2, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Scenario 3
        c = 1; 
        #5;                       
        $fdisplay(file, "scenario: 3, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Scenario 4
        b = 1; 
        #5;                       
        $fdisplay(file, "scenario: 4, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Scenario 5
        a = 0; b = 1; c = 0; d = 0; 
        #5;                       
        $fdisplay(file, "scenario: 5, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Scenario 6
        d = 1; 
        #5;                       
        $fdisplay(file, "scenario: 6, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Scenario 7
        c = 1; 
        #5;                       
        $fdisplay(file, "scenario: 7, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Scenario 8
        d = 1; 
        #5;                       
        $fdisplay(file, "scenario: 8, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Scenario 9
        a = 1; b = 0; c = 0; d = 0; 
        #5;                       
        $fdisplay(file, "scenario: 9, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Scenario 10
        d = 1; 
        #5;                       
        $fdisplay(file, "scenario: 10, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Scenario 11
        c = 1; 
        #5;                       
        $fdisplay(file, "scenario: 11, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Scenario 12
        d = 1; 
        #5;                       
        $fdisplay(file, "scenario: 12, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Scenario 13
        b = 1; c = 0; d = 0;
        #5;                       
        $fdisplay(file, "scenario: 13, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Scenario 14
        d = 1; 
        #5;                       
        $fdisplay(file, "scenario: 14, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Scenario 15
        c = 1; 
        #5;                       
        $fdisplay(file, "scenario: 15, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Scenario 16
        #5;                       
        $fdisplay(file, "scenario: 16, a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Final state after last scenario
        a = 1; b = 1; c = 1; d = 1; 
        #5; // Wait a while longer to ensure we observe the state
        $fdisplay(file, "Final state: a = %d, b = %d, c = %d, d = %d, q = %d", a, b, c, d, q);
        
        // Close the output file
        $fclose(file);
        
        // Finish simulation
        $finish;
    end

endmodule
