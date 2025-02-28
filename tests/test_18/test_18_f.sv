class pixel;
  local bit [7:0] level;
  local enum {OFF, ON, BLINK, REVERSE} mode;

  covergroup g1; // Base covergroup
    a: coverpoint level;
    b: coverpoint mode;
  endgroup

  function new();
    g1 = new;
  endfunction
endclass

class colorpixel extends pixel;
  local enum {red, blue, green} color;

  covergroup extends g1; // Covergroup extension not supported in pre-1800-2023
    b: coverpoint mode { 
      ignore_bins ignore = {REVERSE}; //Cannot modify inherited coverpoints in older versions
    }
    cross level, color; //'level' inherited, but cross-coverpoints from different classes were unsupported
  endgroup
endclass

module test;
  colorpixel cp = new();
endmodule

