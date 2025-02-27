class NamingConsistencyTest;
    // Using CamelCase naming convention consistently
    rand int firstVariable; 
    rand int secondVariable; 
    rand int thirdVariable;

    function new();
        firstVariable  = 10;
        secondVariable = 20;
        thirdVariable  = 30;
    endfunction

    task run_test();
        $display("Testing Naming Consistency:");
        $display("First Variable: %0d", firstVariable);
        $display("Second Variable: %0d", secondVariable);
        $display("Third Variable: %0d", thirdVariable);
    endtask
endclass

module tb_naming_consistency;
    initial begin
        NamingConsistencyTest test;
        test = new();
        test.run_test();
    end
endmodule

