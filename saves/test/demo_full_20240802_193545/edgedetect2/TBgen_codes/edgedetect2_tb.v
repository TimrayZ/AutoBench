`timescale 1ns / 1ps
module testbench;
reg  clk;
reg [7:0] in;
wire [7:0] anyedge;

integer file, scenario;
// DUT instantiation
top_module DUT (
    .clk(clk),
    .in(in),
    .anyedge(anyedge)
);
// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    file = $fopen("TBout.txt", "w");
end
// Scenario Based Test
initial begin

    // scenario 1
    scenario = 1;
    in = 8'b00000000;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); 
    #10;
    in = 8'b00000001;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); #10;  
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge);
        #10;
    end

    // scenario 2
    scenario = 2;
    in = 8'b11111111;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); 
    #10;
    in = 8'b11111110;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); 
    #10;
    in = 8'b11111111;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); #10;  
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge);
        #10;
    end

    // scenario 3
    scenario = 3;
    in = 8'b00000010;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); 
    #10;
    in = 8'b00000110;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); #10;  
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge);
        #10;
    end

    // scenario 4
    scenario = 4;
    in = 8'b00000000;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); 
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); #10;
    in = 8'b00000011;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); #10;  
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge);
        #10;
    end
    in = 8'b00000000;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); #10;  
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge);
        #10;
    end

    // scenario 5
    scenario = 5;
    in = 8'b10101010;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); 
    #10;
    in = 8'b10101011;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); 
    #10;
    in = 8'b10111011;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); #10;  
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge);
        #10;
    end

    // scenario 6
    scenario = 6;
    in = 8'b00000001;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); 
    #10;
    in = 8'b00000000;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); 
    #10;
    in = 8'b00000001';  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); #10;  
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge);
        #10;
    end

    // scenario 7
    scenario = 7;
    in = 8'b11110000;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); 
    #10;
    in = 8'b11111000;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); 
    #10;
    in = 8'b11100000;  
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge); #10;  
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, anyedge = %d", scenario, clk, in, anyedge);
        #10;
    end

    $fclose(file);
    $finish;
end

endmodule
