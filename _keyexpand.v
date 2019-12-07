//AES wholekeyexpand solves for all RoundKeys and saves in array out
`include "keyexpand.v"

module wholekeyexpand (
    input clk,
    input [15:0][7:0] state,
    input [15:0][7:0] key,
    output [159:0][7:0] out
);


wire [15:0][7:0] k0,k1,k2,k3,k4,k5,k6,k7,k8,k9;

//Run key expand for each round and save key in variable out
keyexpand zero (.key(key), .rc(4'h0), .keyout(k0));
assign out[15:0] = k0;
keyexpand one (.key(k0), .rc(4'h1), .keyout(k1));
assign out[31:16] =k1;
keyexpand two (.key(k1), .rc(4'h2), .keyout(k2));
assign out[47:32]=k2;
keyexpand three (.key(k2), .rc(4'h3), .keyout(k3));
assign out[63:48]=k3;
keyexpand four (.key(k3), .rc(4'h4), .keyout(k4));
assign out[79:64]=k4;
keyexpand five (.key(k4), .rc(4'h5), .keyout(k5));
assign out[95:80]=k5;
keyexpand six (.key(k5), .rc(4'h6), .keyout(k6));
assign out[111:96]=k6;
keyexpand seven (.key(k6), .rc(4'h7), .keyout(k7));
assign out[127:112]=k7;
keyexpand eight (.key(k7), .rc(4'h8), .keyout(k8));
assign out[143:128]=k8;
keyexpand nine (.key(k8), .rc(4'h9), .keyout(k9));
assign out[159:144]=k9;

endmodule
