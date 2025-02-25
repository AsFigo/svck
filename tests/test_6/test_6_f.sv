int global_data; 

class Transmitter;
  function void send();
    global_data = 1; //  Modifying a global variable
    $display("Transmitter set global_data = %0d", global_data);
  endfunction
endclass

class Receiver;
  function void receive();
    $display("Receiver read global_data = %0d", global_data); // Using a global variable
  endfunction
endclass

module test;
  Transmitter tx;
  Receiver rx;

  initial begin
    tx = new();
    rx = new();
    tx.send();
    rx.receive();
  end
endmodule

