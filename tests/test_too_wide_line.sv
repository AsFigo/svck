# ----------------------------------------------------
# SPDX-FileCopyrightText: AsFigo Technologies, UK
# SPDX-FileCopyrightText: VerifWorks, India
# SPDX-License-Identifier: MIT
# ----------------------------------------------------

//Memory Controller
module test_too_wide_line #(
    parameter int DATA_WIDTH = 32,
    int ADDR_WIDTH = 16
) (
    input                  clk,
    input                  rst_n,
    input [DATA_WIDTH-1:0] wr_data,
    input                  rd_wr_mem,
    input                  rd_wr_valid,
    input [ADDR_WIDTH-1:0] mem_addr,

    output logic [DATA_WIDTH-1:0] rd_data
);
  // this code is too wide even inside a comment, should not be more than 70 columns, this one is 100+ characters in length
  assign rd_data = wr_data + wr_data + wr_data + wr_data + wr_data + wr_data + wr_data + wr_data + wr_data;

endmodule
