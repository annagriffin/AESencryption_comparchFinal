module transformColumn
(
  input [7:0]in0,
  input [7:0]in1,
  input [7:0]in2,
  input [7:0]in3,

  output [7:0]out0,
  output [7:0]out1,
  output [7:0]out2,
  output [7:0]out3

);




// multiply by 2
//  shift over
// conditional xor


wire[7:0] a;
wire[7:0] b;
wire[7:0] c;
wire[7:0] d;

// shifted over 1
assign a = in0 << 1;
assign b = in1 << 1;
assign c = in2 << 1;
assign d = in3 << 1;


// signed
wire signed[7:0] signeda;
wire signed[7:0] signedb;
wire signed[7:0] signedc;
wire signed[7:0] signedd;

assign signeda = in0;
assign signedb = in1;
assign signedc = in2;
assign signedd = in3;

wire[7:0] overa;
wire[7:0] overb;
wire[7:0] overc;
wire[7:0] overd;

assign overa = signeda >>> 7;
assign overb = signedb >>> 7;
assign overc = signedc >>> 7;
assign overd = signedd >>> 7;







wire[7:0] namea;
assign namea = overa & 8'h1b;
wire[7:0] nameb;
assign nameb = overb & 8'h1b;
wire[7:0] namec;
assign namec = overc & 8'h1b;
wire[7:0] named;
assign named = overd & 8'h1b;

wire[7:0] multi2a;
wire[7:0] multi2b;
wire[7:0] multi2c;
wire[7:0] multi2d;

assign multi2a = a ^ namea;
assign multi2b = b ^ nameb;
assign multi2c = c ^ namec;
assign multi2d = d ^ named;


assign out0 = in2 ^ in3 ^ multi2a ^ multi2b ^ in1;


assign out1 = in0 ^ in3 ^ multi2b ^ multi2c ^ in2;
assign out2 = in0 ^ in1 ^ multi2c ^ multi2d ^ in3;
assign out3 = multi2a ^ in0 ^ multi2d ^ in2 ^ in1;















endmodule
