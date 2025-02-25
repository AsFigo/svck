class PassFIFO;
  protected int queue[$];

  function new();
    $display("FIFO Created");
  endfunction

  function void push(int data);
    queue.push_back(data);
  endfunction

  function int pop();
    if (queue.size() == 0) begin
      $display("FIFO is empty");
      return -1;
    end
    return queue.pop_front();
  endfunction
endclass

module pass_test;
  PassFIFO fifo;

  initial begin
    fifo = new();
    
    fifo.push(10);
    fifo.push(20);
    
    $display("Popped: %0d", fifo.pop());
    
    #10;
    $finish;
  end
endmodule

