// ----------------------------------------------------
//SPDX-FileCopyrightText: AsFigo Technologies, UK
//SPDX-FileCopyrightText: VerifWorks, India
// SPDX-License-Identifier: MIT
//-----------------------------------------------------

class base;
  protected int signal; // PROTECTED: Controlled access

  function new();
    signal = 0;
  endfunction

  function void set_signal(int val);
    signal = val; // Modification only through a method
  endfunction

  function int get_signal();
    return signal; // Controlled read access
  endfunction
endclass

module test;
  base b;

  initial begin
    b = new();
    b.set_signal(100); // Controlled access
    $display("Signal Value: %0d", b.get_signal());
  end
endmodule

