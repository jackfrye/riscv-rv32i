
module processor 
(
  input               clk        ,
  input               rst        ,

  // Memory interface
  output       [31:0] mem_addr   ,
  output logic        mem_wr_en  ,
  output logic [31:0] mem_wr_data,
  input        [31:0] mem_rd_data

);

  logic [31:0] pc;
  assign mem_addr = pc;
  always @(posedge clk)
  begin
    if(rst)
    begin
        pc <= 32'h00000000;
    end
    else 
    begin
      pc <= pc+1;    
    end
  end

endmodule