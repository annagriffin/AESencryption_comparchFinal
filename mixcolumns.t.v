`include "mixcolumns.v"


module test_mixColumns();
  reg[15:0][7:0]in;
  wire [15:0][7:0]out;

  mixColumns test1(.out(out), .in(in));

  initial begin
  $display("Mix columns");

  // NEED TO ADD IN EXPECTED VALUES TO PRINT STATMENTS

  in[0]=8'he5; in[1]=8'hf1; in[2]=8'hae; in[3]=8'h30;
  in[4]=8'h98; in[5]=8'h11; in[6]=8'h52; in[7]=8'h5d;
  in[8]=8'h27; in[9]=8'h41; in[10]=8'hb4; in[11]=8'hbf;
  in[12]=8'h1e; in[13]=8'hb8; in[14]=8'he0; in[15]=8'hd4;

  $display("%h  %h  %h  %h", in[15], in[14], in[13], in[12]); #1000
  $display("%h  %h  %h  %h", in[11], in[10], in[9], in[8]); #1000
  $display("%h  %h  %h  %h", in[7], in[6], in[5], in[4]); #1000
  $display("%h  %h  %h  %h", in[3], in[2], in[1], in[0]); #1000

  $display(); #1000
  $display("%h  %h  %h  %h", out[15], out[14], out[13], out[12]); #1000
  $display("%h  %h  %h  %h", out[11], out[10], out[9], out[8]); #1000
  $display("%h  %h  %h  %h", out[7], out[6], out[5], out[4]); #1000
  $display("%h  %h  %h  %h", out[3], out[2], out[1], out[0]);

  end

endmodule


