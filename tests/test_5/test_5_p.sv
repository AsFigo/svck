module parity_checker_test;
 
    bit [7:0] test_value; 
    bit parity;          
    // Function to compute even parity
    function bit calculate_parity(bit [7:0] value);
        return ^value; // XOR reduction gives even parity
    endfunction

    initial begin
        // Loop to generate multiple test cases
        for (int i = 0; i < 5; i++) begin
            test_value = $random;
            parity = calculate_parity(test_value);

            $display("Test %0d: Value = %b, Parity = %b", i, test_value, parity);
        end
    end
endmodule

