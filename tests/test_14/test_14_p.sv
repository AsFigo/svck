package fifo_pkg;
  
  // FIFO parameters  
  parameter int FIFO_DEPTH = 16;
  parameter int DATA_WIDTH = 8;
  
  // FIFO structure  
  typedef struct {
    logic [DATA_WIDTH-1:0] data;
    logic valid;
  } fifo_entry_t;

  // Function to check if FIFO is empty  
  function automatic bit is_fifo_empty(int count);
    return (count == 0);
  endfunction

endpackage : fifo_pkg  // Properly labeled endpackage for clarity



module top;
  import fifo_pkg::*;  

  initial begin
    automatic int count = 0; 
    fifo_entry_t entry;

    entry.data = 8'hAB;  
    entry.valid = 1'b1;

  
    $display("FIFO Entry Data: %h, Valid: %b", entry.data, entry.valid);
    $display("FIFO Empty: %b", is_fifo_empty(count));
  end
endmodule






