// ----------------------------------------------------
//SPDX-FileCopyrightText: AsFigo Technologies, UK
//SPDX-FileCopyrightText: VerifWorks, India
// SPDX-License-Identifier: MIT
//-----------------------------------------------------
class some_class;
    function void some_method();
        $display("[%0t] INFO: Method executed successfully!", $time);
    endfunction
endclass

module tb;
    // safe object handling
    task automatic test_safe_handle();
        some_class my_handle;

        // Check if handle is initialized before use
        if (my_handle == null) begin
            $display("[%0t] WARNING: Handle is null, initializing now.", $time);
            my_handle = new();
        end
        
        my_handle.some_method(); // Safe usage
    endtask

    initial begin
        $display("[%0t] TEST STARTED", $time);
        
        // Run the test with safe handle assignment
        test_safe_handle();
        
        $display("[%0t] TEST COMPLETED", $time);
    end
endmodule
