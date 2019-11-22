`include "shiftrows.v"

module test_shiftrows();
  reg [15:0][7:0]state;
  wire [15:0][7:0]newstate;

  shiftrows test (.state(state),.newstate(newstate));

  initial begin
  $display("Shift Rows test");
  state={8'b00000000, 8'b00000001, 8'b00000010, 8'b00000011, 8'b00000100, 8'b00000101,8'b00000111,8'b00001000,8'b00001001,8'b00001010,8'b00000000,8'b10000000,8'b11000000,8'b11100000,8'b11110000,8'b11111001}; #1000
  $display("%b",state[0]);
  $display("%b",state[1]);
  $display("%b",state[2]);
  $display("%b",state[3]);
  $display("%b",state[4]);
  $display("%b",state[5]);
  $display("%b",state[6]);
  $display("%b",state[7]);
  $display("%b",state[8]);
  $display("%b",state[9]);
  $display("%b",state[10]);
  $display("%b",state[11]);
  $display("%b",state[12]);
  $display("%b",state[13]);
  $display("%b",state[14]);
  $display("%b",state[15]);
  end
endmodule
