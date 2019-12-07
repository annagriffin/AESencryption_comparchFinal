//test bench for mixonecol
`include "mixcolumns.v"


module test_mixOneColumn();
  reg [3:0][7:0]in;

  wire [3:0][7:0]out;

  mixOneColumn test (.out(out), .in(in));

  initial begin
  $display("Mix one column");

//initialize one col
  in[0]=8'hdb; in[1]=8'h13; in[2]=8'h53; in[3]=8'h45;
  #1000
  $display("%h  %h  %h  %h", in[0], in[1], in[2], in[3]); #1000
  //print mixed col
  $display("%h  %h  %h  %h", out[0], out[1], out[2], out[3]); #1000

  $display(); #1000
  //initialize one col
  in[0]=8'hd4; in[1]=8'hbf; in[2]=8'h5d; in[3]=8'h30;
  #1000
  $display("%h  %h  %h  %h", in[0], in[1], in[2], in[3]); #1000
  //print mixed col
  $display("%h  %h  %h  %h", out[0], out[1], out[2], out[3]);
  end

endmodule
