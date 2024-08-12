`timescale 1ns / 1ps

module tb_top_module;

  // Parameters
  reg [15:0] a;
  reg [15:0] b;
  reg [15:0] c;
  reg [15:0] d;
  reg [15:0] e;
  reg [15:0] f;
  reg [15:0] g;
  reg [15:0] h;
  reg [15:0] i;
  reg [3:0] sel;
  wire [15:0] out;

  // Instantiate the DUT
  top_module dut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g),
    .h(h),
    .i(i),
    .sel(sel),
    .out(out)
  );

  // Testbench file descriptor
  integer fd;

  initial begin
    // Open the output file
    fd = $fopen("TBout.txt", "w");
    if (fd == 0) begin
      $display("Failed to open TBout.txt");
      $finish;
    end

    // Scenario 1
    sel = 4'b0000; a = 16'h0001; b = 16'h0002; c = 16'h0003; d = 16'h0004; 
    e = 16'h0005; f = 16'h0006; g = 16'h0007; h = 16'h0008; 
    i = 16'h0009; 
    #1;
    $fdisplay(fd, "scenario: 1, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Scenario 2
    sel = 4'b0001; a = 16'h0001; b = 16'h0010; c = 16'h0011; d = 16'h0012; e = 16'h0013; f = 16'h0014; g = 16'h0015; h = 16'h0016; i = 16'h0017;
    #1;
    $fdisplay(fd, "scenario: 2, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Scenario 3
    sel = 4'b0010; a = 16'h0001; b = 16'h0020; c = 16'h0021; d = 16'h0022; e = 16'h0023; f = 16'h0024; g = 16'h0025; h = 16'h0026; i = 16'h0027;
    #1;
    $fdisplay(fd, "scenario: 3, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Scenario 4
    sel = 4'b0011; a = 16'h0001; b = 16'h0030; c = 16'h0031; d = 16'h0032; e = 16'h0033; f = 16'h0034; g = 16'h0035; h = 16'h0036; i = 16'h0037;
    #1;
    $fdisplay(fd, "scenario: 4, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Scenario 5
    sel = 4'b0100; a = 16'h0001; b = 16'h0040; c = 16'h0041; d = 16'h0042; e = 16'h0043; f = 16'h0044; g = 16'h0045; h = 16'h0046; i = 16'h0047;
    #1;
    $fdisplay(fd, "scenario: 5, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Scenario 6
    sel = 4'b0101; a = 16'h0001; b = 16'h0050; c = 16'h0051; d = 16'h0052; e = 16'h0053; f = 16'h0054; g = 16'h0055; h = 16'h0056; i = 16'h0057;
    #1;
    $fdisplay(fd, "scenario: 6, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Scenario 7
    sel = 4'b0110; a = 16'h0001; b = 16'h0060; c = 16'h0061; d = 16'h0062; e = 16'h0063; f = 16'h0064; g = 16'h0065; h = 16'h0066; i = 16'h0067;
    #1;
    $fdisplay(fd, "scenario: 7, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Scenario 8
    sel = 4'b0111; a = 16'h0001; b = 16'h0070; c = 16'h0071; d = 16'h0072; e = 16'h0073; f = 16'h0074; g = 16'h0075; h = 16'h0076; i = 16'h0077;
    #1;
    $fdisplay(fd, "scenario: 8, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Scenario 9
    sel = 4'b1000; a = 16'h0001; b = 16'h0080; c = 16'h0081; d = 16'h0082; e = 16'h0083; f = 16'h0084; g = 16'h0085; h = 16'h0086; i = 16'h0087;
    #1;
    $fdisplay(fd, "scenario: 9, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Scenario 10
    sel = 4'b1001; a = 16'h0001; b = 16'h0090; c = 16'h0091; d = 16'h0092; e = 16'h0093; f = 16'h0094; g = 16'h0095; h = 16'h0096; i = 16'h0097;
    #1;
    $fdisplay(fd, "scenario: 10, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Scenario 11
    sel = 4'b1010; a = 16'h0001; b = 16'h00A0; c = 16'h00A1; d = 16'h00A2; e = 16'h00A3; f = 16'h00A4; g = 16'h00A5; h = 16'h00A6; i = 16'h00A7;
    #1;
    $fdisplay(fd, "scenario: 11, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Scenario 12
    sel = 4'b1011; a = 16'h0001; b = 16'h00B0; c = 16'h00B1; d = 16'h00B2; e = 16'h00B3; f = 16'h00B4; g = 16'h00B5; h = 16'h00B6; i = 16'h00B7;
    #1;
    $fdisplay(fd, "scenario: 12, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Scenario 13
    sel = 4'b1100; a = 16'h0001; b = 16'h00C0; c = 16'h00C1; d = 16'h00C2; e = 16'h00C3; f = 16'h00C4; g = 16'h00C5; h = 16'h00C6; i = 16'h00C7;
    #1;
    $fdisplay(fd, "scenario: 13, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Scenario 14
    sel = 4'b1101; a = 16'h0001; b = 16'h00D0; c = 16'h00D1; d = 16'h00D2; e = 16'h00D3; f = 16'h00D4; g = 16'h00D5; h = 16'h00D6; i = 16'h00D7;
    #1;
    $fdisplay(fd, "scenario: 14, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Scenario 15
    sel = 4'b1110; a = 16'h0001; b = 16'h00E0; c = 16'h00E1; d = 16'h00E2; e = 16'h00E3; f = 16'h00E4; g = 16'h00E5; h = 16'h00E6; i = 16'h00E7;
    #1;
    $fdisplay(fd, "scenario: 15, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Scenario 16
    sel = 4'b1111; a = 16'h0001; b = 16'h00F0; c = 16'h00F1; d = 16'h00F2; e = 16'h00F3; f = 16'h00F4; g = 16'h00F5; h = 16'h00F6; i = 16'h00F7;
    #1;
    $fdisplay(fd, "scenario: 16, a = %d, b = %d, c = %d, d = %d, e = %d, f = %d, g = %d, h = %d, i = %d, sel = %d, out = %d", a, b, c, d, e, f, g, h, i, sel, out);

    // Close the file
    $fclose(fd);
    $finish;
  end

endmodule
