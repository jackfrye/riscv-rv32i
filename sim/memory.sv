
module memory
(
  input               clk        ,
  input               rst        ,

  // Memory interface
  input  logic [31:0] mem_addr   ,
  input  logic        mem_wr_en  ,
  input  logic [31:0] mem_wr_data,
  output       [31:0] mem_rd_data

);

  reg [31:0] memArray[131:0]; 
   initial begin
     $readmemh("./programs/assembly/helloworld/helloworld.hex", memArray);
   end
   
   always @(posedge clk) begin
     if (mem_wr_en) begin 
       memArray[mem_addr[9:0]] <= mem_wr_data; 
     end
   end
   
   assign mem_rd_data = memArray[mem_addr[9:0]];

endmodule