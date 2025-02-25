
class base;
  int signal; //  Should be private or protected

  function new();
    signal = 0;
  endfunction

  function void set_signal(int val);
    signal = val;
  endfunction
endclass

module test;
  base b;
  
  initial begin
    b = new();
    b.signal = 100; //  Direct modification
    $display("Signal Value: %0d", b.signal);
  end
endmodule

