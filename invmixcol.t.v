//test bench for invmix colums
`include "invmixcol.v"


module test_invMixColumns();
  reg[15:0][7:0]in;
  wire [15:0][7:0]out;

  invMixColumns test1(.out(out), .in(in));

  initial begin
  $display("Inverse Mix columns");

  // set input

  in[0]=8'h4c; in[1]=8'h7a; in[2]=8'h9a; in[3]=8'he5;
  in[4]=8'h26; in[5]=8'hd3; in[6]=8'h19; in[7]=8'h81;
  in[8]=8'h06; in[9]=8'hf8; in[10]=8'hcb; in[11]=8'h66;
  in[12]=8'h28; in[13]=8'h48; in[14]=8'he0; in[15]=8'h04;

  $display("%h  %h  %h  %h", in[15], in[14], in[13], in[12]); #1000
  $display("%h  %h  %h  %h", in[11], in[10], in[9], in[8]); #1000
  $display("%h  %h  %h  %h", in[7], in[6], in[5], in[4]); #1000
  $display("%h  %h  %h  %h", in[3], in[2], in[1], in[0]); #1000
//print mixed columns
  $display(); #1000
  $display("%h  %h  %h  %h", out[15], out[14], out[13], out[12]); #1000
  $display("%h  %h  %h  %h", out[11], out[10], out[9], out[8]); #1000
  $display("%h  %h  %h  %h", out[7], out[6], out[5], out[4]); #1000
  $display("%h  %h  %h  %h", out[3], out[2], out[1], out[0]);

  end

endmodule
