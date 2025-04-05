// ----------------------------------------------------
//SPDX-FileCopyrightText: AsFigo Technologies, UK
//SPDX-FileCopyrightText: VerifWorks, India
// SPDX-License-Identifier: MIT
//-----------------------------------------------------

class Transaction;
  int data;
  
  function new();
    data = 0;
  endfunction

  function void display();
    $display("Transaction Data: %0d", data);
  endfunction
endclass

class Driver;
  Transaction txn;

  function new();
    txn = new();
  endfunction

  function void drive();
    txn.data = 100;
    txn.display();
  endfunction
endclass

module fail_test;
  Driver drv;  //  No namespace, potential conflict if another Driver class exists

  initial begin
    drv = new();
    drv.drive();
    #10;
    $finish;
  end
endmodule

