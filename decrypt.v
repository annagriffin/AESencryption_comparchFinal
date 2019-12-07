`include "invround.v"
`include "_keyexpand.v"


module decrypt(
    input clk,
    input [15:0][7:0] state,
    input [15:0][7:0] key,
    output [15:0][7:0] out

);

wire [159:0][7:0] wholekeyout;

wire [15:0][7:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,shftrw,subst,addrw;

wholekeyexpand wke(.key(key), .clk(clk), .state(state), .out(wholekeyout));

assign  k0= wholekeyout[15:0];
assign  k1= wholekeyout[31:16];
assign  k2= wholekeyout[47:32];
assign  k3= wholekeyout[63:48];
assign  k4= wholekeyout[79:64];
assign k5=  wholekeyout[95:80];
assign k6= wholekeyout[111:96];
assign k7=wholekeyout[127:112];
assign k8=wholekeyout[143:128];
assign k9 =wholekeyout[159:144];


assign addrw = state^k9; // add key step
invshiftrows shft (.state(addrw),.newstate(shftrw));
inv_substitute sub(.state(shftrw),.newstate(subst));


invround one  (.clk(clk),.key(k8),.r_out(r8),.data(subst));
invround two  (.clk(clk),.key(k7),.r_out(r7),.data(r8));
invround three(.clk(clk),.key(k6),.r_out(r6),.data(r7));
invround four (.clk(clk),.key(k5),.r_out(r5),.data(r6));
invround five (.clk(clk),.key(k4),.r_out(r4),.data(r5));
invround six  (.clk(clk),.key(k3),.r_out(r3),.data(r4));
invround seven(.clk(clk),.key(k2),.r_out(r2),.data(r3));
invround eight(.clk(clk),.key(k1),.r_out(r1),.data(r2));
invround nine (.clk(clk),.key(k0),.r_out(r0),.data(r1));

assign out = r0^key;


endmodule
