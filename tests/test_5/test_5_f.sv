module parity_checker_test;


    bit [7:0] test_value; // 8-bit random test value
    bit parity;           // Stores calculated parity result

    // Function to compute even parity
    function bit calculate_parity(bit [7:0] value);
        return ^value; // XOR reduction gives even parity
    endfunction

  /*  initial begin
        // Loop to generate multiple test cases
        for (int i = 0; i < 5; i++) begin
            test_value = $random; // Generate a random 8-bit value
            parity = calculate_parity(test_value); // Compute parity

            // Displaying test case results for verification
            $display("Test %0d: Value = %b, Parity = %b", i, test_value, parity);
        end
    end
*/
endmodule
