`timescale 1ns / 1ps

module tb_top_module;

    reg [1023:0] in;
    reg [7:0] sel;
    wire [3:0] out;

    // Instantiate DUT
    top_module DUT (
        .in(in),
        .sel(sel),
        .out(out)
    );

    // File to write outputs
    integer file;
    
    initial begin
        file = $fopen("TBout.txt", "w");

        // Scenario 1
        in = {256'b00000001, 256'b00000000, 256'b00000000, 256'b00000000}; // Set inputs from 0 to 255
        sel = 8'd0;
        #1; // Wait 1 time unit
        $fdisplay(file, "scenario: 1, in = %d, sel = %d, out = %d", in, sel, out);

        // Scenario 2
        sel = 8'd1;
        #1; // Wait 1 time unit
        $fdisplay(file, "scenario: 2, in = %d, sel = %d, out = %d", in, sel, out);

        // Scenario 3
        sel = 8'd2;
        #1; // Wait 1 time unit
        $fdisplay(file, "scenario: 3, in = %d, sel = %d, out = %d", in, sel, out);

        // Scenario 4
        sel = 8'd255;
        #1; // Wait 1 time unit
        $fdisplay(file, "scenario: 4, in = %d, sel = %d, out = %d", in, sel, out);

        // Scenario 5
        in = 1024'b01010101010101010101010101010101010101010101010101010101010101010101010101010101; // Updated to a pattern with 0's and 1's
        for (integer i = 0; i < 16; i = i + 1) begin
            sel = $urandom_range(0, 255);
            #1; // Wait 1 time unit
            $fdisplay(file, "scenario: 5, in = %d, sel = %d, out = %d", in, sel, out); 
        end

        // Scenario 6
        in = 1024'b0; // All bits zero
        for (integer j = 0; j < 16; j = j + 1) begin
            sel = $urandom_range(0, 255);
            #1; // Wait 1 time unit
            $fdisplay(file, "scenario: 6, in = %d, sel = %d, out = %d", in, sel, out); 
        end

        // Scenario 7
        in = {4'd4, 4'd8, 4'd12, 4'd16, 4'd20, 4'd24, 4'd28, 4'd32, 4'd36, 4'd40, 4'd44, 4'd48,
              4'd52, 4'd56, 4'd60, 4'd64, 4'd68, 4'd72, 4'd76, 4'd80, 4'd84, 4'd88,
              4'd92, 4'd96, 4'd100, 4'd104, 4'd108, 4'd112, 4'd116, 4'd120, 4'd124,
              4'd128, 4'd132, 4'd136, 4'd140, 4'd144, 4'd148, 4'd152, 4'd156, 4'd160,
              4'd164, 4'd168, 4'd172, 4'd176, 4'd180, 4'd184, 4'd188, 4'd192, 4'd196,
              4'd200, 4'd204, 4'd208, 4'd212, 4'd216, 4'd220, 4'd224, 4'd228, 4'd232,
              4'd236, 4'd240, 4'd244, 4'd248, 4'd252, 4'd0};
        sel = 8'd0;
        #1; // Wait 1 time unit
        $fdisplay(file, "scenario: 7, in = %d, sel = %d, out = %d", in, sel, out);
        
        sel = 8'd128;
        #1; // Wait 1 time unit
        $fdisplay(file, "scenario: 7, in = %d, sel = %d, out = %d", in, sel, out);
        
        sel = 8'd255;
        #1; // Wait 1 time unit
        $fdisplay(file, "scenario: 7, in = %d, sel = %d, out = %d", in, sel, out);
        
        $fclose(file);
        $finish;
    end

endmodule
