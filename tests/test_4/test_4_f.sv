class ParityChecker;
    bit [7:0] test_value;  
    bit parity;            

   
    function bit calculate_parity(bit [7:0] value);
        return ^value;  
    endfunction

   
    task run_test();
        for (int i = 0; i < 5; i++) begin
            test_value = $random;  
            parity = calculate_parity(test_value); 
          //Line exceeds 80 characters
            $display("Test case number %0d: The generated value is %b and its calculated parity is %b",  i, test_value, parity);
        end
    endtask
endclass

module parity_checker_test;
    initial begin
        ParityChecker pc = new();
        pc.run_test();
    end
endmodule

