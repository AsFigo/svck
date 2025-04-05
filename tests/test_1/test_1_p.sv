// ----------------------------------------------------
//SPDX-FileCopyrightText: AsFigo Technologies, UK
//SPDX-FileCopyrightText: VerifWorks, India
// SPDX-License-Identifier: MIT
//-----------------------------------------------------

class Pass;
  protected int data; 

  function new();
    data = 0;
  endfunction

  function void send();
    $display("Data value: %0d", data);
  endfunction
endclass

module pass_test;
  Pass obj; 

  initial begin
    obj = new(); 
    obj.send(); 
    #10; 
    $finish; 
  end
endmodule
