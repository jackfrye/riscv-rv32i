
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

  logic [4:0]   addr1 ;
  logic [4:0]   addr2 ;
  logic [4:0]   addr3 ;
  logic [31:0]  wdata3;
  logic         wen3  ;
  wire  [31:0]  rd1   ;
  wire  [31:0]  rd2   ;

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

  register_file u_reg_file
  (
    .clk    (clk   ),
    .rst    (rst   ), 
    .addr1  (addr1 ),
    .addr2  (addr2 ),
    .addr3  (addr3 ),
    .wdata3 (wdata3),
    .wen3   (wen3  ),
    .rd1    (rd1   ),
    .rd2    (rd2   )
  );


endmodule