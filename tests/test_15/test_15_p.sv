// ----------------------------------------------------
//SPDX-FileCopyrightText: AsFigo Technologies, UK
//SPDX-FileCopyrightText: VerifWorks, India
// SPDX-License-Identifier: MIT
//-----------------------------------------------------

package my_pkg;  // Encapsulating related classes

  class Transaction;
   local int data;
    
    function new();
      data = 0;
    endfunction

    function void display();
      $display("Transaction Data: %0d", data);
    endfunction
  endclass

  class Driver;
   local Transaction txn;

    function new();
      txn = new();
    endfunction

    function void drive();
      txn.data = 100;
      txn.display();
    endfunction
  endclass

endpackage : my_pkg  // Proper package encapsulation

module pass_test;
  import my_pkg::*;  // Importing package for namespace management

  my_pkg::Driver drv;  // ✅ Using namespaced class reference

  initial begin
    drv = new();
    drv.drive();
    #10;
    $finish;
  end
endmodule

