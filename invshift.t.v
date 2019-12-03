`include "invshift.v"

module test_invshift();
  reg [15:0][7:0]state;
  wire [15:0][7:0]newstate;

  invshiftrows test (.state(state),.newstate(newstate));

  initial begin
  $display(" Inv Shift Rows test");
  state={8'b00000000, 8'b00000001, 8'b00000010, 8'b00000011, 8'b00000100, 8'b00000101,8'b00000111,8'b00001000,8'b00001001,8'b00001010,8'b00000000,8'b10000000,8'b11000000,8'b11100000,8'b11110000,8'b11111001}; #1000
  $display("%b",newstate[15]);
  $display("%b",newstate[14]);
  $display("%b",newstate[13]);
  $display("%b",newstate[12]);
  $display("%b",newstate[11]);
  $display("%b",newstate[10]);
  $display("%b",newstate[9]);
  $display("%b",newstate[8]);
  $display("%b",newstate[7]);
  $display("%b",newstate[6]);
  $display("%b",newstate[5]);
  $display("%b",newstate[4]);
  $display("%b",newstate[3]);
  $display("%b",newstate[2]);
  $display("%b",newstate[1]);
  $display("%b",newstate[0]);
  end
endmodule
