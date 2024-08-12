`timescale 1ns/1ps

module tb_top_module;

    // Inputs
    reg [1:0] A;
    reg [1:0] B;

    // Output
    wire z;

    // Instantiate the Device Under Test (DUT)
    top_module DUT (
        .A(A),
        .B(B),
        .z(z)
    );

    // File for output
    integer file;

    initial begin
        // Open the output file
        file = $fopen("TBout.txt", "w");
        
        // Scenario 1
        A = 2'b00; B = 2'b00;
        #0; // At time 0 clock cycles
        $fdisplay(file, "scenario: 1, A = %d, B = %d, z = %d", A, B, z);

        // Scenario 2
        A = 2'b01; B = 2'b01;
        #10; // At time 1 clock cycle
        $fdisplay(file, "scenario: 2, A = %d, B = %d, z = %d", A, B, z);

        // Scenario 3
        A = 2'b10; B = 2'b10;
        #10; // At time 2 clock cycles
        $fdisplay(file, "scenario: 3, A = %d, B = %d, z = %d", A, B, z);

        // Scenario 4
        A = 2'b11; B = 2'b11;
        #10; // At time 3 clock cycles
        $fdisplay(file, "scenario: 4, A = %d, B = %d, z = %d", A, B, z);

        // Scenario 5
        A = 2'b00; B = 2'b01;
        #10; // At time 4 clock cycles
        $fdisplay(file, "scenario: 5, A = %d, B = %d, z = %d", A, B, z);

        // Scenario 6
        A = 2'b01; B = 2'b10;
        #10; // At time 5 clock cycles
        $fdisplay(file, "scenario: 6, A = %d, B = %d, z = %d", A, B, z);

        // Scenario 7
        A = 2'b10; B = 2'b11;
        #10; // At time 6 clock cycles
        $fdisplay(file, "scenario: 7, A = %d, B = %d, z = %d", A, B, z);

        // Scenario 8
        A = 2'b11; B = 2'b00;
        #10; // At time 7 clock cycles
        $fdisplay(file, "scenario: 8, A = %d, B = %d, z = %d", A, B, z);

        // Scenario 9
        A = 2'b01; B = 2'b11;
        #10; // At time 8 clock cycles
        $fdisplay(file, "scenario: 9, A = %d, B = %d, z = %d", A, B, z);

        // Scenario 10
        A = 2'b10; B = 2'b01;
        #10; // At time 9 clock cycles
        $fdisplay(file, "scenario: 10, A = %d, B = %d, z = %d", A, B, z);

        // Close the output file
        $fclose(file);
        $finish;
    end

endmodule
