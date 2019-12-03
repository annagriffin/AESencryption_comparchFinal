`timescale 1ns/1ps
`include "keyexpand.v"
`include "mixcolumns.v"
`include "shiftrows.v"
`include "substitute.v"
`include "sbox.v"
`include "keyadd.v"

module round(clk,key,keyout,r_out, data,rc);
input clk;
input [3:0]rc;
input [15:0][7:0] key;
input [15:0][7:0] data;
output [15:0][7:0] keyout;
output [15:0][7:0] r_out;

wire [15:0][7:0] sub_out,shift_out,mix_out;


keyexpand test (.key(key), .rc(rc), .keyout(keyout));
substitute sub(.state(data),.newstate(sub_out));
shiftrows shft (.state(sub_out),.newstate(shift_out));
mixColumns test1(.out(mix_out), .in(shift_out));
keyadd test2 (.state(mix_out),.newstate(r_out),.key(keyout));
//assign r_out=keyout^mix_out;

endmodule
