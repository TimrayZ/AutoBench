`timescale 1ns/1ps

module tb_top_module;
    // DUT instantiation
    wire one;

    top_module DUT (
        .one(one)
    );

    // File descriptor
    integer fd;

    initial begin
        // Open the output file
        fd = $fopen("TBout.txt", "w");

        // Scenario 1: Instantiate the DUT and monitor output 'one' immediately after simulation starts
        #0; // Monitor output at simulation start
        $fdisplay(fd, "scenario: 1, one = %d", one);

        // Scenario 2: Monitor output 'one' for the next 10 clock cycles (10ns to 100ns)
        repeat (10) begin
            #10; // Delay for the next time point
            $fdisplay(fd, "scenario: 2, one = %d", one);
        end

        // Scenario 3: Observe output 'one' after 100ns for an additional 100ns
        #100; // Delay for the duration
        #10; // Delay to ensure signals are stable
        $fdisplay(fd, "scenario: 3, one = %d", one);

        // Scenario 4: Final checks at 200ns and 300ns
        #90; // Delay to reach 200ns
        #10; // Delay to ensure signals are stable
        $fdisplay(fd, "scenario: 4a, one = %d", one); // At 200ns
        #100; // Delay to reach 300ns
        #10; // Delay to ensure signals are stable
        $fdisplay(fd, "scenario: 4b, one = %d", one); // At 300ns

        // Additional check for the first clock cycle after DUT instantiation
        #10; // Wait for the first clock cycle to complete
        $fdisplay(fd, "scenario: 1a, one = %d", one); // Check the output during the first clock cycle

        // Close the output file
        $fclose(fd);
        $finish;
    end
endmodule
