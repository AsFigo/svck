// ----------------------------------------------------
//SPDX-FileCopyrightText: AsFigo Technologies, UK
//SPDX-FileCopyrightText: VerifWorks, India
// SPDX-License-Identifier: MIT
//-----------------------------------------------------


class Transmitter;
  protected int data; 

  function new();
    data = 0;
  endfunction

  function void send();
    data = 1; //  Data is modified internally
    $display("Transmitter set data = %0d", data);
  endfunction

  function int get_data();
    return data; //  Controlled access
  endfunction
endclass

class Receiver;
  Transmitter tx; //  Using class reference instead of global variable

  function new(Transmitter t);
    tx = t; //  Dependency Injection: Pass an instance of Transmitter
  endfunction

  function void receive();
    $display("Receiver read data = %0d", tx.get_data()); //Controlled access
  endfunction
endclass

module test;
  Transmitter tx;
  Receiver rx;

  initial begin
    tx = new();
    rx = new(tx); // Passing the Transmitter instance instead of using a global variable
    tx.send();
    rx.receive();
  end
endmodule

