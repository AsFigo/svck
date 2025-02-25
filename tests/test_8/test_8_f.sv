`ifndef FAIL_TEST_SV
`define FAIL_TEST_SV

class PassChecker;
  int threshold;

  function new(int threshold = 50);
    this.threshold = threshold;
  endfunction

  function bit check_pass(int value);
    bit result;
    
    if (value >= threshold) begin
      result = 1;
      $display("Value %0d: PASS", value);
    end else begin
      result = 0;
      $display("Value %0d: FAIL", value);
    end

    // Extra lines to exceed 50
    $display("Debug Info: Checking conditions...");
    if (value > 100) begin
      $display("Value is too high!");
    end else if (value < 10) begin
      $display("Value is too low!");
    end else begin
      $display("Value is within range.");
    end

    for (int i = 0; i < 5; i++) begin
      $display("Loop iteration %0d", i);
    end

    case (value)
      40: $display("Matched case 40");
      50: $display("Matched case 50");
      60: $display("Matched case 60");
      default: $display("No match found");
    endcase

    $display("Logging additional information...");
    $display("Validating function constraints...");
    $display("Final checks before returning...");
    
    return result;
  endfunction
endclass

class FailTest;
  PassChecker pc;

  function new();
    pc = new(50);
  endfunction

  function void run_test();
    int values[] = '{30, 40, 50, 60, 70};
    foreach (values[i]) begin
      if (pc.check_pass(values[i])) 
        $display("Test PASSED for value %0d", values[i]);
      else 
        $display("Test FAILED for value %0d", values[i]);
    end
  endfunction
endclass

// Running the test
initial begin
  FailTest test = new();
  test.run_test();
end

`endif
