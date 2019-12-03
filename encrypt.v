`include "round.v"


module encrypt(
    input clk,
    input [15:0][7:0] state,
    input [15:0][7:0] key,
    output [15:0][7:0] out

);


wire [15:0][7:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,k0,k1,k2,k3,k4,k5,k6,k7,k8,shftrw,subst,keyout;

//not sure how we get the round keys to start? His seem to just appear...
assign r0=state^key;
round one(.clk(clk),.key(key),.keyout(k0),.r_out(r1),.data(r0),.rc(4'h0));
round two(.clk(clk),.key(k0),.keyout(k1),.r_out(r2),.data(r1),.rc(4'h1));
round three(.clk(clk),.key(k1),.keyout(k2),.r_out(r3),.data(r2),.rc(4'h2));
round four(.clk(clk),.key(k2),.keyout(k3),.r_out(r4),.data(r3),.rc(4'h3));
round five(.clk(clk),.key(k3),.keyout(k4),.r_out(r5),.data(r4),.rc(4'h4));
round six(.clk(clk),.key(k4),.keyout(k5),.r_out(r6),.data(r5),.rc(4'h5));
round seven(.clk(clk),.key(k5),.keyout(k6),.r_out(r7),.data(r6),.rc(4'h6));
round eight(.clk(clk),.key(k6),.keyout(k7),.r_out(r8),.data(r7),.rc(4'h7));
round nine(.clk(clk),.key(k7),.keyout(k8),.r_out(r9),.data(r8),.rc(4'h8));

// last weird round
// r9 goes in here somewhere
keyexpand test (.key(k8), .rc(4'h9), .keyout(keyout));
substitute sub(.state(r9),.newstate(subst));
shiftrows shft (.state(subst),.newstate(shftrw));
//assign out=keyout^shftrw;
keyadd test2 (.state(shftrw),.newstate(out),.key(keyout));


endmodule
