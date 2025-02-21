# ----------------------------------------------------
# SPDX-FileCopyrightText: AsFigo Technologies, UK
# SPDX-FileCopyrightText: VerifWorks, India
# SPDX-License-Identifier: MIT
# ----------------------------------------------------

//Memory Controller
  module mem_d#(parameter DATA_WIDTH=32,ADDR_WIDTH=16)
                (input       clk,             
		input       rst_n,
		input  [DATA_WIDTH-1:0]wr_data,
		input       rd_wr_mem,
		input       rd_wr_valid,
		input [ADDR_WIDTH-1:0]mem_addr,
	
		output reg [DATA_WIDTH-1:0]rd_data);  
/*
  //Internal Signal Declarations	
  reg [DATA_WIDTH-1:0]mem[2**ADDR_WIDTH-1:0]; //MEM Declarations for 4KB MEMORY

 //READ-WRITE ACCESS OF MEMORY
  always @ (posedge clk or negedge rst_n)
    begin:MEMORY_ACCESS
      if(!rst_n)
        begin : RESET
          rd_data <= 8'd0;
        end //RESET
      else if(rd_wr_valid)
        begin :WRITE_READ
          if(rd_wr_mem)
	    mem[mem_addr] <= wr_data;
          else
            rd_data <= mem[mem_addr];
        end //WRITE_READ
    end //MEMORY ACCESS

    */
endmodule
