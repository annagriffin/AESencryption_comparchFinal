`include "mixcolumns.v"

// module test_mixOneColumn();
//   reg [3:0][7:0]in;

//   wire [3:0][7:0]out;

//   transformOneColumn test (.out(out), .in(in));

//   initial begin
//   $display("Mix one column");


//   in[0]=8'hdb; in[1]=8'h13; in[2]=8'h53; in[3]=8'h45;
//   #1000
//   $display("%h  %h  %h  %h", in[0], in[1], in[2], in[3]); #1000
// //   $display("%h", [8'h04, 8'h66, 8'h81, 8'he5]);
//   $display("%h  %h  %h  %h", out[0], out[1], out[2], out[3]);
//   end
//

module test_mixColumns();
  reg[15:0][7:0]in;
  wire [15:0][7:0]out;

  transformColumns test1(.out(out), .in(in));

  initial begin
  $display("Mix one column");


  in[0]=8'hd4; in[1]=8'hbf; in[2]=8'h5d; in[3]=8'h30;
  in[4]=8'he0; in[5]=8'hb4; in[6]=8'h52; in[7]=8'hae;
  in[8]=8'hb8; in[9]=8'h41; in[10]=8'h11; in[11]=8'hf1;
  in[12]=8'h1e; in[13]=8'h27; in[14]=8'h98; in[15]=8'he5;

  $display("%h  %h  %h  %h", in[0], in[4], in[8], in[12]); #1000
  $display("%h  %h  %h  %h", in[1], in[5], in[9], in[13]); #1000
  $display("%h  %h  %h  %h", in[2], in[6], in[10], in[14]); #1000
  $display("%h  %h  %h  %h", in[3], in[7], in[11], in[15]); #1000

  $display(); #1000
//   $display("%h", [8'h04, 8'h66, 8'h81, 8'he5]);
  $display("%h  %h  %h  %h", out[0], out[4], out[8], out[12]); #1000
  $display("%h  %h  %h  %h", out[1], out[5], out[9], out[13]); #1000
  $display("%h  %h  %h  %h", out[2], out[6], out[10], out[14]); #1000
  $display("%h  %h  %h  %h", out[3], out[7], out[11], out[15]);

  end

endmodule


