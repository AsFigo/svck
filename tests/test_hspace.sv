# ----------------------------------------------------
# SPDX-FileCopyrightText: AsFigo Technologies, UK
# SPDX-FileCopyrightText: VerifWorks, India
# SPDX-License-Identifier: MIT
# ----------------------------------------------------

//Memory Controller
module test_hspace;
  logic [31:0] rd_data, wr_data;
  // this code is too wide even inside a comment, should not be more than 70 columns, this one is 100+ characters in length
  assign rd_data                        = wr_data;

endmodule
