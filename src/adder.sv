
module adder #(
  parameter integer WIDTH = 32  
)
(
  input              clk ,
  input              rst ,
  input  [WIDTH-1:0] a   ,
  input  [WIDTH-1:0] b   ,
  input              cin ,
  output [WIDTH-1:0] c   ,
  output             cout    
);

  wire [WIDTH:0] full_add;

  assign full_add = a+b+cin;
  assign c        = full_add[WIDTH-1:0];
  assign cout     = full_add[WIDTH];

endmodule