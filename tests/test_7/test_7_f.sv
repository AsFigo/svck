class NamingConsistencyFailTest;
    // Mixing CamelCase and snake_case (inconsistent naming)
    rand int firstVariable;  // CamelCase
    rand int second_variable; // snake_case (violation)
    rand int ThirdVariable;  // CamelCase
    rand int fourth_variable; // snake_case (violation)

    function new();
        firstVariable  = 10;
        second_variable = 20; // Inconsistent with CamelCase
        ThirdVariable  = 30;
        fourth_variable = 40; // Inconsistent with CamelCase
    endfunction

    task run_test();
        $display("Testing Naming Consistency (Should Fail):");
        $display("First Variable: %0d", firstVariable);
        $display("Second Variable: %0d", second_variable);
        $display("Third Variable: %0d", ThirdVariable);
        $display("Fourth Variable: %0d", fourth_variable);
    endtask
endclass

module tb_naming_consistency_fail;
    initial begin
        NamingConsistencyFailTest test;
        test = new();
        test.run_test();
    end
endmodule

