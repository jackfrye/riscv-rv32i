module #(
  parameter integer WIDTH = 32  
) subtractor
(
  input              clk ,
  input              rst ,
  input  [WIDTH-1:0] a   ,
  input  [WIDTH-1:0] b   ,
  output [WIDTH-1:0] c   ,
);

  adder #(
    .WIDTH (32)  
  ) u_adder
  (
    .clk   (clk ),
    .rst   (rst ),
    .a     (a   ),
    .b     (~b  ),
    .cin   (1'b1),
    .c     (c   ),
    .cout  (    )    
  );

endmodule