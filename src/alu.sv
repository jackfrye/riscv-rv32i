module alu
#(
  parameter integer WIDTH = 32
)
(
  input              clk          ,
  input              rst          ,
  input  [WIDTH-1:0] a            ,
  input  [WIDTH-1:0] b            ,
  input  [2:0]       alu_control  ,
  output [WIDTH-1:0] out          ,
  output             flag_overflow,
  output             flag_carry   ,
  output             flag_negative,
  output             flag_zero
);

  wire [WIDTH-1:0] n_b        ;
  wire [WIDTH-1:0] adder_b_sel;
  wire [WIDTH-1:0] c_adder    ;
  wire             adder_cout ;
  wire [WIDTH-1:0] c_and      ;
  wire [WIDTH-1:0] c_or       ;

  assign n_b = ~b;
  assign adder_b_sel = alu_control[0] ? n_b : b;

  assign flag_overflow = ~(a[WIDTH-1] ^ b[WIDTH-1] ^ alu_control[0]) & (c_adder[WIDTH-1] ^ a[WIDTH-1]) & alu_control[1];
  assign flag_carry    = alu_control[1] & adder_cout;
  assign flag_negative = out[WIDTH-1];
  assign flag_zero     = &(~out);

  adder #(
    .WIDTH (WIDTH)  
  ) u_adder
  (
    .clk    (clk           ),
    .rst    (rst           ),
    .a      (a             ),
    .b      (adder_b_sel   ),
    .cin    (alu_control[0]),
    .c      (c_adder       ),
    .cout   (adder_cout    )     
  );

  assign c_and = a & b;
  assign c_or  = a | b;

  always_comb 
  begin
    case(alu_control)
      2'h0: out <= c_adder;
      2'h1: out <= c_adder;
      2'h2: out <= c_and  ;
      2'h3: out <= c_or   ;
    endcase  
  end

endmodule