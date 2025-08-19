
module register_file
(
  input          clk   ,
  input          rst   , 
  input  [4:0]   addr1 ,
  input  [4:0]   addr2 ,
  input  [4:0]   addr3 ,
  input  [31:0]  wdata3,
  input          wen3  ,
  output [31:0]  rd1   ,
  output [31:0]  rd2
);

  reg [31:0] regs [31:0];

  assign rd1 = regs[addr1];
  assign rd2 = regs[addr2];

  always @(posedge clk)
  begin
    if(rst)
    begin
      regs[0]  <= 32'h00000000;
      regs[1]  <= 32'h00000000;
      regs[2]  <= 32'h00000000;
      regs[3]  <= 32'h00000000;
      regs[4]  <= 32'h00000000;
      regs[5]  <= 32'h00000000;
      regs[6]  <= 32'h00000000;
      regs[7]  <= 32'h00000000;
      regs[8]  <= 32'h00000000;
      regs[9]  <= 32'h00000000;
      regs[10] <= 32'h00000000;
      regs[11] <= 32'h00000000;
      regs[12] <= 32'h00000000;
      regs[13] <= 32'h00000000;
      regs[14] <= 32'h00000000;
      regs[15] <= 32'h00000000;
      regs[16] <= 32'h00000000;
      regs[17] <= 32'h00000000;
      regs[18] <= 32'h00000000;
      regs[19] <= 32'h00000000;
      regs[20] <= 32'h00000000;
      regs[21] <= 32'h00000000;
      regs[22] <= 32'h00000000;
      regs[23] <= 32'h00000000;
      regs[24] <= 32'h00000000;
      regs[25] <= 32'h00000000;
      regs[26] <= 32'h00000000;
      regs[27] <= 32'h00000000;
      regs[28] <= 32'h00000000;
      regs[29] <= 32'h00000000;
      regs[30] <= 32'h00000000;
      regs[31] <= 32'h00000000;
    end
    else
    begin
      if(wen3)
      begin
        case(addr3)
          5'h01: regs[1] <= wdata3;
          5'h02: regs[2] <= wdata3;
          5'h03: regs[3] <= wdata3;
          5'h04: regs[4] <= wdata3;
          5'h05: regs[5] <= wdata3;
          5'h06: regs[6] <= wdata3;
          5'h07: regs[7] <= wdata3;
          5'h08: regs[8] <= wdata3;
          5'h09: regs[9] <= wdata3;
          5'h0a: regs[10] <= wdata3;
          5'h0b: regs[11] <= wdata3;
          5'h0c: regs[12] <= wdata3;
          5'h0d: regs[13] <= wdata3;
          5'h0e: regs[14] <= wdata3;
          5'h0f: regs[15] <= wdata3;
          5'h10: regs[16] <= wdata3;
          5'h11: regs[17] <= wdata3;
          5'h12: regs[18] <= wdata3;
          5'h13: regs[19] <= wdata3;
          5'h14: regs[20] <= wdata3;
          5'h15: regs[21] <= wdata3;
          5'h16: regs[22] <= wdata3;
          5'h17: regs[23] <= wdata3;
          5'h18: regs[24] <= wdata3;
          5'h19: regs[25] <= wdata3;
          5'h1a: regs[26] <= wdata3;
          5'h1b: regs[27] <= wdata3;
          5'h1c: regs[28] <= wdata3;
          5'h1d: regs[29] <= wdata3;
          5'h1e: regs[30] <= wdata3;
          5'h1f: regs[31] <= wdata3;
          default: regs[0] <= '0;
        endcase
      end
    end
  end


endmodule