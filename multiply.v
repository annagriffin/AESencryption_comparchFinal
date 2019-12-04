
module multiply2 (
  input[3:0][7:0] in,
  output[3:0][7:0] product
);

wire[3:0][7:0] shifted;
assign shifted[0] = in[0] << 1;
assign shifted[1] = in[1] << 1;
assign shifted[2] = in[2] << 1;
assign shifted[3] = in[3] << 1;

wire signed[7:0] isSigneda;
assign isSigneda = in[0];
wire signed[7:0] isSignedb;
assign isSignedb = in[1];
wire signed[7:0] isSignedc;
assign isSignedc = in[2];
wire signed[7:0] isSignedd;
assign isSignedd = in[3];

wire[3:0][7:0] highBit;

assign highBit[0] = isSigneda >>> 7;
assign highBit[1] = isSignedb >>> 7;
assign highBit[2] = isSignedc >>> 7;
assign highBit[3] = isSignedd >>> 7;

wire[3:0][7:0] conditional;
assign conditional[0] = highBit[0] & 8'h1b;
assign conditional[1] = highBit[1] & 8'h1b;
assign conditional[2] = highBit[2] & 8'h1b;
assign conditional[3] = highBit[3] & 8'h1b;



wire[3:0][7:0] product;

assign product[0] = conditional[0] ^ shifted[0];
assign product[1] = conditional[1] ^ shifted[1];
assign product[2] = conditional[2] ^ shifted[2];
assign product[3] = conditional[3] ^ shifted[3];

endmodule


module multiply9
(
  input[3:0][7:0] in,
  output[3:0][7:0] product
);

// ( ( ( x * 2 ) * 2 ) * 2 ) + x
wire[3:0][7:0] mul2;
wire[3:0][7:0] mul4;
wire[3:0][7:0] mul8;

multiply2 x2(.product(mul2), .in(in));
multiply2 x4(.product(mul4), .in(mul2));
multiply2 x8(.product(mul8), .in(mul4));

assign product = mul8 ^ in;

endmodule


module multiply11
(
  input[3:0][7:0] in,
  output[3:0][7:0] product
);

// ( ( ( ( x * 2 ) * 2 ) ^ x ) * 2) ^ x
wire[3:0][7:0] mul2;
wire[3:0][7:0] mul4;
wire[3:0][7:0] mul5;
wire[3:0][7:0] mul10;

multiply2 x2(.product(mul2), .in(in));
multiply2 x4(.product(mul4), .in(mul2));
assign mul5 = mul4 ^ in;
multiply2 x10(.product(mul10), .in(mul5));

assign product = mul10 ^ in;

endmodule

module multiply6
(
  input[3:0][7:0] in,
  output[3:0][7:0] product
);

// ( ( ( x * 2 ) ^ x ) * 2 )
wire[3:0][7:0] mul2, mul3;
multiply2 x2(.product(mul2), .in(in));
assign mul3 = mul2 ^ in;
multiply2 x6(.product(product), .in(mul3));

endmodule

module multiply13
(
  input[3:0][7:0] in,
  output[3:0][7:0] product
);

wire[3:0][7:0] mul6, mul12;
multiply6 x6(.product(mul6), .in(in));
multiply2 x12(.product(mul12), .in(mul6));
assign product = mul12 ^ in;

endmodule

module multiply14
(
  input[3:0][7:0] in,
  output[3:0][7:0] product
);

wire[3:0][7:0] mul6, mul7;
multiply6 x6(.product(mul6), .in(in));
assign mul7 = mul6 ^ in;
multiply2 x14(.product(product), .in(mul7));

endmodule


