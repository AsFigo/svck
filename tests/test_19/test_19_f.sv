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
    // Unsafe object handling (failing case)
    task automatic test_unsafe_handle();
        some_class my_handle;

        // No initialization, directly using the handle
        my_handle.some_method(); 
    endtask

    initial begin
        $display("[%0t] TEST STARTED", $time);
        
        // Run the test with unsafe handle usage
        test_unsafe_handle();
        
        $display("[%0t] TEST COMPLETED", $time);
    end
endmodule


