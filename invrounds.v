`timescale 1ns/1ps
`include "invkeyexpand.v"
`include "invmixcol.v"
`include "invshift.v"
`include "invsubst.v"
`include "invsbox.v"
`include "invkeyadd.v"

module invround(clk,key,keyout,r_out, data,rc);
input clk;
input [3:0]rc;
input [15:0][7:0] key;
input [15:0][7:0] data;
output [15:0][7:0] keyout;
output [15:0][7:0] r_out;

wire [15:0][7:0] sub_out,shift_out,mix_out;

keyexpand test (.key(key), .rc(rc), .keyout(keyout));
invkeyadd test2 (.state(mix_out),.newstate(r_out),.key(keyout));
invmixColumns test1(.out(mix_out), .in(shift_out));

invshiftrows shft (.state(sub_out),.newstate(shift_out));
inv_substitute sub(.state(data),.newstate(sub_out));


endmodule
