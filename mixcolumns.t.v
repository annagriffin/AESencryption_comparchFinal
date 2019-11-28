`include "mixcolumns.v"

module test_mixcolumns();
  reg  [7:0]in0;
  reg [7:0]in1;
  reg [7:0]in2;
  reg [7:0]in3;

  wire [7:0]out0;
  wire [7:0]out1;
  wire [7:0]out2;
  wire [7:0]out3;

  transformColumn test (.out0(out0), .out1(out1), .out2(out2), .out3(out3), .in0(in0), .in1(in1), .in2(in2), .in3(in3));

  initial begin
  $display("Mix one column");


  in0=8'hdb; in1=8'h13; in2=8'h53; in3=8'h45;
  #1000
  $display("%h  %h  %h  %h", in0, in1, in2, in3); #1000
//   $display("%h", [8'h04, 8'h66, 8'h81, 8'he5]);
  $display("%h  %h  %h  %h", out0, out1, out2, out3);
  end
endmodule
