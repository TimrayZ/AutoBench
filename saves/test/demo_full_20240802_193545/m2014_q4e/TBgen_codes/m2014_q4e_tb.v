module tb_top_module;

  reg in1;
  reg in2;
  wire out;

  // Instantiate the Device Under Test (DUT)
  top_module dut (
    .in1(in1),
    .in2(in2),
    .out(out)
  );

  // File descriptor for exporting signals
  integer file;

  initial begin
    // Open the output file
    file = $fopen("TBout.txt", "w");
    
    // Scenario 1: Apply inputs in1 = 0 and in2 = 0 for clock cycle 0.
    in1 = 0;
    in2 = 0;
    #1; // Delay to ensure signal stability
    $fdisplay(file, "scenario: 1, in1 = %d, in2 = %d, out = %d", in1, in2, out);

    // Scenario 2: Apply inputs in1 = 0 and in2 = 1 for clock cycle 1.
    in1 = 0;
    in2 = 1;
    #1; // Delay to ensure signal stability
    $fdisplay(file, "scenario: 2, in1 = %d, in2 = %d, out = %d", in1, in2, out);

    // Scenario 3: Apply inputs in1 = 1 and in2 = 0 for clock cycle 2.
    in1 = 1;
    in2 = 0;
    #1; // Delay to ensure signal stability
    $fdisplay(file, "scenario: 3, in1 = %d, in2 = %d, out = %d", in1, in2, out);

    // Scenario 4: Apply inputs in1 = 1 and in2 = 1 for clock cycle 3.
    in1 = 1;
    in2 = 1;
    #1; // Delay to ensure signal stability
    $fdisplay(file, "scenario: 4, in1 = %d, in2 = %d, out = %d", in1, in2, out);

    // Close the output file
    $fclose(file);
    
    // End the testbench
    $finish;
  end

endmodule
