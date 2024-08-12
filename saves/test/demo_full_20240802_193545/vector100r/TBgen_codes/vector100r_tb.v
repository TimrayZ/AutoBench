module tb_top_module;

  // Parameters
  reg [99:0] in;
  wire [99:0] out;

  // DUT Instantiation
  top_module DUT (
    .in(in),
    .out(out)
  );

  // File handle for exporting signals
  integer file;

  // Initialize simulation
  initial begin
    // Open the output file
    file = $fopen("TBout.txt", "w");

    // Scenario 1
    in = 100'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    #1; 
    $fdisplay(file, "scenario: 1, in = %b, out = %b", in, out);

    // Scenario 2
    in = 100'b10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010;
    #1; 
    $fdisplay(file, "scenario: 2, in = %b, out = %b", in, out);

    // Scenario 3
    in = 100'b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    #1; 
    $fdisplay(file, "scenario: 3, in = %b, out = %b", in, out);

    // Scenario 4
    in = 100'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001;
    #1; 
    $fdisplay(file, "scenario: 4, in = %b, out = %b", in, out);

    // Scenario 5
    in = 100'b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111;
    #1; 
    $fdisplay(file, "scenario: 5, in = %b, out = %b", in, out);

    // Scenario 6
    in = 100'b01111000011010100010101011101110011100001111001101010101001000001111011010100001100010001000000110000;
    #1; 
    $fdisplay(file, "scenario: 6, in = %b, out = %b", in, out);

    // Scenario 7
    in = 100'b00000000000000000000000000000000000000000000000000000000000000001111111110000000000000000000000000000000;
    #1; 
    $fdisplay(file, "scenario: 7, in = %b, out = %b", in, out);

    // Scenario 8
    in = 100'b10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    #1; 
    $fdisplay(file, "scenario: 8, in = %b, out = %b", in, out);

    // Scenario 9
    in = 100'b00001111000011110000111100001111000011110000111100001111000011110000;
    #1; 
    $fdisplay(file, "scenario: 9, in = %b, out = %b", in, out);

    // Scenario 10
    in = 100'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001;
    #1; 
    $fdisplay(file, "scenario: 10, in = %b, out = %b", in, out);

    // Close the file
    $fclose(file);

    // End simulation
    $finish;
  end

endmodule
