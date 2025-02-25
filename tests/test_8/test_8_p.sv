`ifndef PASS_TEST_SV
`define PASS_TEST_SV

class PassChecker;
  int threshold;

  function new(int threshold = 50);
    this.threshold = threshold;
  endfunction

  function bit check_pass(int value);
    return (value >= threshold);
  endfunction
endclass

class PassTest;
  PassChecker pc;

  function new();
    pc = new(50);
  endfunction

  function void run_test();
    int values[] = '{40, 50, 60};
    foreach (values[i]) begin
      if (pc.check_pass(values[i])) 
        $display("Value %0d: PASS", values[i]);
      else 
        $display("Value %0d: FAIL", values[i]);
    end
  endfunction
endclass

module top;
  initial begin
    PassTest test = new();
    test.run_test();
  end
endmodule

`endif
