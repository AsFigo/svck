// ----------------------------------------------------
//SPDX-FileCopyrightText: AsFigo Technologies, UK
//SPDX-FileCopyrightText: VerifWorks, India
// SPDX-License-Identifier: MIT
//-----------------------------------------------------

class Packet;
    typedef enum {NORMAL, SPECIAL} pkt_type_t;
    typedef enum {OK, ERROR} pkt_status_t;

    // Public variables
    pkt_type_t pkt_type;
    pkt_status_t status;
    bit [7:0] dest;
    bit [31:0] payload;
    
    function new(pkt_type_t t, pkt_status_t s, bit [7:0] d, bit [31:0] p);
        pkt_type = t;
        status = s;
        dest = d;
        payload = p;
    endfunction
endclass

// Processor class with deep nesting (FAIL CASE)
class Processor;
    function void process_packet(Packet my_packet);
        if (my_packet != null) begin  // Level 1
            if (my_packet.status != Packet::ERROR) begin  // Level 2
                case (my_packet.pkt_type)  // Level 3
                    Packet::NORMAL: begin
                        if (my_packet.dest == 8'hFF) begin  // Level 4 (Too Deep!)
                            $display("Sending normal packet to all receivers");
                        end 
                        else begin
                            if (my_packet.payload != 0) begin  // Level 5 (VERY DEEP!)
                                $display("Sending normal packet to %0d with payload %0h", 
                                         my_packet.dest, my_packet.payload);
                            end 
                            else begin
                                $display("Error: Empty normal packet");
                            end
                        end
                    end
                    Packet::SPECIAL: begin
                        if (my_packet.dest == 8'hFF) begin  // Level 4 (Too Deep!)
                            if (my_packet.payload[31] == 1'b1) begin  // Level 5 (VERY DEEP!)
                                $display("Sending special packet with high payload bit set");
                            end 
                            else begin
                                $display("Sending special packet to all receivers");
                            end
                        end 
                        else begin
                            if (my_packet.payload != 0) begin  // Level 5 (VERY DEEP!)
                                $display("Sending special packet to %0d", my_packet.dest);
                            end 
                            else begin
                                $display("Error: Empty special packet");
                            end
                        end
                    end
                endcase
            end 
            else begin
                $display("Handling error packet");
            end
        end 
        else begin
            $display("Error: Packet is null!");
        end
    endfunction
endclass

module test;
    initial begin
        Packet pkt = new(Packet::NORMAL, Packet::OK, 8'hFF, 32'hDEADBEEF);
        Processor p = new();
        p.process_packet(pkt); // Too many nested conditions (FAIL)
    end
endmodule

