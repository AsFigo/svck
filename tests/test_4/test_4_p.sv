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
	    // line kept  ≤ 80 characters 
            $display("Test %0d: Value = %b, Parity = %b",   i, test_value, parity); 
        end
    endtask
endclass

module testbench;
    initial begin
        ParityChecker pc = new();
        pc.run_test();
    end
endmodule

