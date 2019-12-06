`include "invround.v"
`include "_keyexpand.v"


module decrypt(
    input clk,
    input [15:0][7:0] state,
    input [15:0][7:0] key,
    output [15:0][7:0] out

);

wire [159:0][7:0] wholekeyout;

wire [15:0][7:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,shftrw,subst,keyout;

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

assign r0=state^k9;



invround one(.clk(clk),.key(k8),.r_out(r1),.data(r0),.rc(4'h9));
invround two(.clk(clk),.key(k7),.r_out(r2),.data(r1),.rc(4'h8));
invround three(.clk(clk),.key(k6),.r_out(r3),.data(r2),.rc(4'h7));
invround four(.clk(clk),.key(k5),.r_out(r4),.data(r3),.rc(4'h6));
invround five(.clk(clk),.key(k4),.r_out(r5),.data(r4),.rc(4'h5));
invround six(.clk(clk),.key(k3),.r_out(r6),.data(r5),.rc(4'h4));
invround seven(.clk(clk),.key(k2),.r_out(r7),.data(r6),.rc(4'h3));
invround eight(.clk(clk),.key(k1),.r_out(r8),.data(r7),.rc(4'h2));
invround nine(.clk(clk),.key(k0),.r_out(r9),.data(r8),.rc(4'h1));

inv_substitute sub(.state(r9),.newstate(subst));
invshiftrows shft (.state(subst),.newstate(shftrw));
invkeyadd test2 (.state(shftrw),.newstate(out), .key(k9));




endmodule
