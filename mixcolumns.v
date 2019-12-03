
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

wire[3:0][7:0] col0, col1, col2, col3;
wire[3:0][7:0] colOut0, colOut1, colOut2, colOut3;

assign col0 = {in[3], in[7], in[11], in[15]};
assign col1 = {in[2], in[6], in[10], in[14]};
assign col2 = {in[1], in[5], in[9], in[13]};
assign col3 = {in[0], in[4], in[8], in[12]};


mixOneColumn column0(.out(colOut0), .in(col0));
mixOneColumn column1(.out(colOut1), .in(col1));
mixOneColumn column2(.out(colOut2), .in(col2));
mixOneColumn column3(.out(colOut3), .in(col3));

// col0
assign out[15] = colOut0[0];
assign out[11] = colOut0[1];
assign out[7] =  colOut0[2];
assign out[3] =  colOut0[3];

// col1
assign out[14] = colOut1[0];
assign out[10] = colOut1[1];
assign out[6] =  colOut1[2];
assign out[2] =  colOut1[3];

// col2
assign out[13] = colOut2[0];
assign out[9] =  colOut2[1];
assign out[5] =  colOut2[2];
assign out[1] =  colOut2[3];

// col3
assign out[12] = colOut3[0];
assign out[8] =  colOut3[1];
assign out[4] =  colOut3[2];
assign out[0] =  colOut3[3];



endmodule