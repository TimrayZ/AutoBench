`timescale 1ns / 1ps

module tb_top_module;

    // Testbench signals
    reg [2:0] sel;
    reg [3:0] data0, data1, data2, data3, data4, data5;
    wire [3:0] out;

    // Instantiate the DUT
    top_module DUT (
        .sel(sel),
        .data0(data0),
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .data4(data4),
        .data5(data5),
        .out(out)
    );

    // File descriptor for output
    integer file;

    initial begin
        // Open file to write
        file = $fopen("TBout.txt", "w");

        // Initialize data inputs
        data0 = 4'b0001; 
        data1 = 4'b0010; 
        data2 = 4'b0011; 
        data3 = 4'b0100; 
        data4 = 4'b0101; 
        data5 = 4'b0110;

        // Test Scenario 1: sel = 0
        sel = 3'b000; 
        #1; // Wait for 1 time unit
        $fdisplay(file, "scenario: 1, sel = %d, data0 = %d, data1 = %d, data2 = %d, data3 = %d, data4 = %d, data5 = %d, out = %d", sel, data0, data1, data2, data3, data4, data5, out);

        // Test Scenario 2: sel = 1
        sel = 3'b001; 
        #1;
        $fdisplay(file, "scenario: 2, sel = %d, data0 = %d, data1 = %d, data2 = %d, data3 = %d, data4 = %d, data5 = %d, out = %d", sel, data0, data1, data2, data3, data4, data5, out);

        // Test Scenario 3: sel = 2
        sel = 3'b010; 
        #1;
        $fdisplay(file, "scenario: 3, sel = %d, data0 = %d, data1 = %d, data2 = %d, data3 = %d, data4 = %d, data5 = %d, out = %d", sel, data0, data1, data2, data3, data4, data5, out);

        // Test Scenario 4: sel = 3
        sel = 3'b011; 
        #1;
        $fdisplay(file, "scenario: 4, sel = %d, data0 = %d, data1 = %d, data2 = %d, data3 = %d, data4 = %d, data5 = %d, out = %d", sel, data0, data1, data2, data3, data4, data5, out);

        // Test Scenario 5: sel = 4
        sel = 3'b100; 
        #1;
        $fdisplay(file, "scenario: 5, sel = %d, data0 = %d, data1 = %d, data2 = %d, data3 = %d, data4 = %d, data5 = %d, out = %d", sel, data0, data1, data2, data3, data4, data5, out);

        // Test Scenario 6: sel = 5
        sel = 3'b101; 
        #1;
        $fdisplay(file, "scenario: 6, sel = %d, data0 = %d, data1 = %d, data2 = %d, data3 = %d, data4 = %d, data5 = %d, out = %d", sel, data0, data1, data2, data3, data4, data5, out);

        // Test Scenario 7: sel = 6 (using default data inputs)
        sel = 3'b110; 
        #1;
        $fdisplay(file, "scenario: 7, sel = %d, data0 = %d, data1 = %d, data2 = %d, data3 = %d, data4 = %d, data5 = %d, out = %d", sel, data0, data1, data2, data3, data4, data5, out);

        // Test Scenario 8: sel = 7 (using default data inputs)
        sel = 3'b111; 
        #1;
        $fdisplay(file, "scenario: 8, sel = %d, data0 = %d, data1 = %d, data2 = %d, data3 = %d, data4 = %d, data5 = %d, out = %d", sel, data0, data1, data2, data3, data4, data5, out);

        // Close file
        $fclose(file);
        $finish;
    end

endmodule
