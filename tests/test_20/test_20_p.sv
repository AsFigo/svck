// ----------------------------------------------------
//SPDX-FileCopyrightText: AsFigo Technologies, UK
//SPDX-FileCopyrightText: VerifWorks, India
// SPDX-License-Identifier: MIT
//-----------------------------------------------------

class Packet;
    typedef enum {NORMAL, SPECIAL} pkt_type_t; 
    typedef enum {OK, ERROR} pkt_status_t; 

    local pkt_type_t pkt_type;
    local pkt_status_t status;
    local bit [7:0] dest;
    local bit [31:0] payload;
    
    // Constructor
    function new(pkt_type_t t, pkt_status_t s, bit [7:0] d, bit [31:0] p);
        pkt_type = t;
        status = s;
        dest = d;
        payload = p;
    endfunction
    
    function pkt_status_t get_status();
        return status;
    endfunction

    function pkt_type_t get_type();
        return pkt_type;
    endfunction

    function bit [7:0] get_destination();
        return dest;
    endfunction

    function bit [31:0] get_payload();
        return payload;
    endfunction
endclass

class Processor;
    local int num_packets_processed;  
    local string processor_name;  

    // Constructor
    function new(string name);
        processor_name = name;
        num_packets_processed = 0;
    endfunction

    // Getter for num_packets_processed
    function int get_num_packets_processed();
        return num_packets_processed;
    endfunction

    // Getter for processor_name
    function string get_processor_name();
        return processor_name;
    endfunction

    // Process packet with minimal nesting
    function void process_packet(Packet my_packet);
        assert (my_packet != null) else begin
            $display("Error: Packet is null!");
            return; // Early exit
        end

        if (my_packet.get_status() == Packet::ERROR) begin
            $display("Handling error packet");
            return;
        end

        case (my_packet.get_type())
            Packet::NORMAL: send_normal_packet(my_packet);
            Packet::SPECIAL: send_special_packet(my_packet);
        endcase

        num_packets_processed++;  // Update counter
    endfunction

    // Sends a normal packet (avoiding deep nesting)
    function void send_normal_packet(Packet my_packet);
        string dest_str = (my_packet.get_destination() == 8'hFF) ? "all receivers" :
                          $sformatf("%0d", my_packet.get_destination());
        $display("Sending normal packet to %s", dest_str);
    endfunction

    // Sends a special packet (avoiding deep nesting)
    function void send_special_packet(Packet my_packet);
        string dest_str = (my_packet.get_destination() == 8'hFF) ? "all receivers" :
                          $sformatf("%0d", my_packet.get_destination());
        $display("Sending special packet to %s", dest_str);
    endfunction
endclass

module test;
    initial begin
        automatic Packet pkt = new(Packet::NORMAL, Packet::OK, 8'hFF, 32'hDEADBEEF);
        automatic Processor p = new("PacketProcessor");

        p.process_packet(pkt); // This will trigger packet processing
    end
endmodule

