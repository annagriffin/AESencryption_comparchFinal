module transformColumn
(
  input [7:0]in0,
  input [7:0]in1,
  input [7:0]in2,
  input [7:0]in3,

  output [7:0]out0,
  output [7:0]out1,
  output [7:0]out2,
  output [7:0]out3

);

// multiply by 1: do nothing
// multiply by 2: shift by 1 to the left
// multiply by 3:

wire[7:0] a;
wire[7:0] b;
wire[7:0] c;
wire[7:0] d;

assign a = in0 << 1;
assign c = a ^ 8'h1b;

wire signed[7:0] temp;
assign temp = in0;


assign b = in1 << 1;
assign d = b ^ 8'h0 ^ in1;


assign out0 = d ^ c ^ in2 ^ in3;


assign out1 = temp >>> 7;
assign out2 = 8'h1b;
assign out3 = 8'b0;















endmodule
