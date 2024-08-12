`timescale 1ns / 1ps
module testbench;
reg  clk;
reg [7:0] in;
reg  reset;
wire [23:0] out_bytes;
wire  done;

integer file, scenario;
// DUT instantiation
top_module DUT (
	.clk(clk),
	.in(in),
	.reset(reset),
	.out_bytes(out_bytes),
	.done(done)
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
    reset = 1;
    in = 8'b00000000;
    repeat(3) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done);
        #10;
    end
    reset = 0;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10; 

    // scenario 2
    scenario = 2;
    in = 8'b00000000;
    repeat(5) begin
        $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done);
        #10;
    end
    in = 8'b00001000; // now in[3]=1
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10; 

    // scenario 3
    scenario = 3;
    in = 8'b00000001;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10;
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done);
    in = 8'b00000010; // second byte
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done);

    // Completing the message
    in = 8'b00001001; // third byte
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10; 

    // scenario 4
    scenario = 4;
    in = 8'b00000000; // invalid byte
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done);
    in = 8'b00001010; // valid byte
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10; 

    // scenario 5
    scenario = 5;
    reset = 1; // asserting reset
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done);
    reset = 0; // releasing reset
    #10; $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10; 
    $fdisplay(file, "[check]scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10; 

    // scenario 6
    scenario = 6;
    in = 8'b00001011; // first valid byte
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done);
    in = 8'b00000000; // second byte
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done);
    in = 8'b00000001; // third byte
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done);
    
    in = 8'b00001001; // second message start
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done);
    in = 8'b00000010; // second byte of message
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done);
    in = 8'b00000011; // third byte of message
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10; 

    // scenario 7
    scenario = 7;
    reset = 1; // applying reset
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done);
    reset = 0; // releasing reset
    #10;
    in = 8'b00001000; // valid start
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10; 

    // scenario 8
    scenario = 8;
    in = 8'b00000000; // invalid stream
    repeat(10) begin
        $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done);
        #10;
    end

    // scenario 9
    scenario = 9;
    in = 8'b00001111; // valid byte
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done); #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done);
    reset = 1; // applying reset
    #10;
    $fdisplay(file, "scenario: %d, clk = %d, in = %d, reset = %d, out_bytes = %d, done = %d", scenario, clk, in, reset, out_bytes, done);

    $fclose(file);
    $finish;
end

endmodule
