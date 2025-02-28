class pixel;
  local bit [7:0] level;
  local enum {OFF, ON, BLINK, REVERSE} mode;
  
  covergroup g1;
    a: coverpoint level;
    b: coverpoint mode;
  endgroup
  
  function new();
    g1 = new;
  endfunction
endclass

class colorpixel extends pixel;
  local enum {red, blue, green} color;
  
  // Covergroup extension - Supported only in IEEE 1800-2023
  covergroup extends g1;
    b: coverpoint mode {
      ignore_bins ignore = {REVERSE}; // Modified coverpoint from base class
    }
    cross level, color; // Crossing inherited coverpoint with a new one
  endgroup
  
endclass

module test;
  colorpixel cp;
  initial begin
    cp = new(); // Object instantiation
    $display("Covergroup extension test passed.");
  end
endmodule
