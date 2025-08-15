`timescale 1ns/1ns

module tb();

initial
begin
   $dumpfile("dump.vcd");
   $dumpvars(0,tb);
end

  logic clk;

  initial 
  begin
    clk = 0;
    forever 
      #5 clk = ~clk;
  end

  logic rst='0;
  initial 
  begin
    rst = 1'b0;
    #10
    rst = 1'b1;
    #50
    rst = 1'b0;
    #100
    $finish;
  end

  wire [31:0] mem_addr   ;
  wire        mem_wr_en  ;
  wire [31:0] mem_wr_data;
  wire [31:0] mem_rd_data;
  
  memory u_memory
  (
    .clk          (clk        ),
    .rst          (rst        ),
    .mem_addr     (mem_addr   ),
    .mem_wr_en    (mem_wr_en  ),
    .mem_wr_data  (mem_wr_data),
    .mem_rd_data  (mem_rd_data)
  
  );
  
  processor DUT
  (
    .clk          (clk        ),
    .rst          (rst        ),
    .mem_addr     (mem_addr   ),
    .mem_wr_en    (mem_wr_en  ),
    .mem_wr_data  (mem_wr_data),
    .mem_rd_data  (mem_rd_data)
  
  );

endmodule