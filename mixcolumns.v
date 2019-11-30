
module mixOneColumn
(
  input[3:0][7:0] in,
  output[3:0][7:0] out

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



wire[3:0][7:0] mul2;

assign mul2[0] = conditional[0] ^ shifted[0];
assign mul2[1] = conditional[1] ^ shifted[1];
assign mul2[2] = conditional[2] ^ shifted[2];
assign mul2[3] = conditional[3] ^ shifted[3];

assign out[0] = in[2] ^ in[3] ^ mul2[0] ^ mul2[1] ^ in[1];
assign out[1] = in[0] ^ in[3] ^ mul2[1] ^ mul2[2] ^ in[2];
assign out[2] = in[0] ^ in[1] ^ mul2[2] ^ mul2[3] ^ in[3];
assign out[3] = mul2[0] ^ in[0] ^ mul2[3] ^ in[2] ^ in[1];


endmodule


module mixColumns
(
  input[15:0][7:0] in,
  output[15:0][7:0] out
);

mixOneColumn col0(.out(out[3:0]), .in(in[3:0]));
mixOneColumn col1(.out(out[7:4]), .in(in[7:4]));
mixOneColumn col2(.out(out[8:11]), .in(in[8:11]));
mixOneColumn col3(.out(out[12:15]), .in(in[12:15]));

endmodule