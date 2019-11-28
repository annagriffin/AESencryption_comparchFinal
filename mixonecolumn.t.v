`include "mixcolumns.v"


module test_mixOneColumn();
  reg [3:0][7:0]in;

  wire [3:0][7:0]out;

  mixOneColumn test (.out(out), .in(in));

  initial begin
  $display("Mix one column");

  // NEED TO ADD IN EXPECTED VALUES TO PRINT STATMENTS


  in[0]=8'hdb; in[1]=8'h13; in[2]=8'h53; in[3]=8'h45;
  #1000
  $display("%h  %h  %h  %h", in[0], in[1], in[2], in[3]); #1000
  $display("%h  %h  %h  %h", out[0], out[1], out[2], out[3]);
  end
