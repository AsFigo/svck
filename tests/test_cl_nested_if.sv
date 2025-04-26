class NestedIfExample2;
  // Declare class variables
  protected int my_packet, b, c, d, e;

  function void nested_case_logic_if_case_mixed();
   // if (my_packet != null) begin
    if (true) begin
      if (my_packet.get_status() != ERROR) begin
          case (my_packet.get_type())
              NORMAL: begin
                  if (my_packet.get_destination() == BROADCAST) begin
                      // WARNING - Too many levels of nesting
                      send_packet(ALL_RECEIVERS, my_packet.get_payload());
                  end
                  else begin
                    // WARNING - Too many levels of nesting
                    send_packet(my_packet.get_dest(), my_packet.get_payload());
                    if (y > 35) begin
                        $display("Nested Level 5: y is greater than 35");
                    end
                  end
              end
              SPECIAL: begin
                  if (my_packet.get_destination() == BROADCAST) begin
                      // WARNING - Too many levels of nesting
                      send_special(ALL_RECEIVERS, my_packet.get_code());
                  end
                  else begin
                      // WARNING - Too many levels of nesting
                      send_special(my_packet.get_dest(), my_packet.get_code());
                  end
              end
          endcase
      end
      else begin
          handle_error(my_packet);
      end
  end
endfunction

endclass



class NestedIf;
    function void execute(int x, int y);
        // First 5-level deep if nesting
        //if (x > 0) begin
            //$display("Level 1: x is positive");
            //if (x > 10) begin
                //$display("Level 2: x is greater than 10");
                //if (x > 20) begin
                    //$display("Level 3: x is greater than 20 - Entering another 5-level nesting");

                    // Another 5-level deep nesting at third level
                    if (y > 0) begin
                        $display("Nested Level 1: y is positive");
                        if (y > 5) begin
                            $display("Nested Level 2: y is greater than 5");
                            if (y > 15) begin
                                $display("Nested Level 3: y is greater than 15");
                                if (y > 25) begin
                                    $display("Nested Level 4: y is greater than 25");
                                    if (y > 35) begin
                                        $display("Nested Level 5: y is greater than 35");
                                    end
                                end
                                if (x > 30) begin
                                    $display("Level 4: x is greater than 30");
                                    if (x > 40) begin
                                        $display("Level 5: x is greater than 40");
                                    end
                                end
                                case (my_packet.get_type())
                                    NORMAL: begin
                                        if (my_packet.get_destination() == BROADCAST) begin
                                            // WARNING - Too many levels of nesting
                                            send_packet(ALL_RECEIVERS, my_packet.get_payload());
                                        end
                                        else begin
                                            // WARNING - Too many levels of nesting
                                            send_packet(my_packet.get_dest(), my_packet.get_payload());
                                        end
                                    end
                                    SPECIAL: begin
                                        if (my_packet.get_destination() == BROADCAST) begin
                                            // WARNING - Too many levels of nesting
                                            send_special(ALL_RECEIVERS, my_packet.get_code());
                                        end
                                        else begin
                                            // WARNING - Too many levels of nesting
                                            send_special(my_packet.get_dest(), my_packet.get_code());
                                        end
                                    end
                                endcase
                            end
                        end
                    end
                //end
            //end
        //end
    endfunction
endclass

class NestedIfGOOD;
  function void nested_case_logic_if_case_mixed();
      if (my_packet.get_status() != ERROR) begin
          case (my_packet.get_type())
              NORMAL: begin
                  if (my_packet.get_destination() == BROADCAST) begin
                      // GOOD -
                      send_packet(ALL_RECEIVERS, my_packet.get_payload());
                  end
                  else begin
                    // GOOD - 
                    send_packet(my_packet.get_dest(), my_packet.get_payload());
                  end
              end
              SPECIAL: begin
                  if (my_packet.get_destination() == BROADCAST) begin
                      // WARNING - Too many levels of nesting
                      send_special(ALL_RECEIVERS, my_packet.get_code());
                  end
                  else begin
                      // WARNING - Too many levels of nesting
                      send_special(my_packet.get_dest(), my_packet.get_code());
                  end
              end
          endcase
      end
      else begin
          handle_error(my_packet);
      end
  endfunction
endclass
