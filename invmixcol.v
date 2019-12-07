//AES mix columns file
`include "multiply.v"
//Mix only one column
module invMixOneColumn
(
  input[3:0][7:0] in,
  output[3:0][7:0] out

);

wire[3:0][7:0] mul9, mul11, mul13, mul14;
//call the necessary multiplication module
multiply9   x9(.product(mul9),   .in(in));
multiply11 x11(.product(mul11),  .in(in));
multiply13 x13(.product(mul13),  .in(in));
multiply14 x14(.product(mul14),  .in(in));

//Assign to output, whenre ^ indicates XOR
assign out[0] = mul14[0] ^ mul11[1] ^ mul13[2] ^  mul9[3];
assign out[1] =  mul9[0]  ^ mul14[1] ^ mul11[2] ^ mul13[3];
assign out[2] = mul13[0] ^ mul9[1]  ^ mul14[2] ^ mul11[3];
assign out[3] = mul11[0] ^ mul13[1] ^ mul9[2]  ^ mul14[3];


endmodule


//mix the whole state object by calling mixonecol on each of the four columns
module invMixColumns
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


invMixOneColumn column0(.out(colOut0), .in(col0));
invMixOneColumn column1(.out(colOut1), .in(col1));
invMixOneColumn column2(.out(colOut2), .in(col2));
invMixOneColumn column3(.out(colOut3), .in(col3));

//assign mixed col values to out
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
