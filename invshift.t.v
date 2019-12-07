//testbench for invshift
`include "invshift.v"

module test_invshift();
  reg [15:0][7:0]state;
  wire [15:0][7:0]newstate;

  invshiftrows test (.state(state),.newstate(newstate));
//initialize starrting state
  initial begin
  $display("Inv Shift Rows test");
  state={8'b00000000, 8'b00000001, 8'b00000010, 8'b00000011, 8'b00000100, 8'b00000101,8'b00000111,8'b00001000,8'b00001001,8'b00001010,8'b00000000,8'b10000000,8'b11000000,8'b11100000,8'b11110000,8'b11111001}; #1000
//print shifted state object
  $display("%b %b %b %b",state[15], state[14], state[13], state[12]); #1000
  $display("%b %b %b %b",state[11], state[10], state[9], state[8]); #1000
  $display("%b %b %b %b",state[7], state[6], state[5], state[4]); #1000
  $display("%b %b %b %b",state[3], state[2], state[1], state[0]); #1000
  $display("-----------------------------------------------"); #1000

  $display("%b %b %b %b",newstate[15], newstate[14], newstate[13], newstate[12]); #1000
  $display("%b %b %b %b",newstate[11], newstate[10], newstate[9], newstate[8]); #1000
  $display("%b %b %b %b",newstate[7], newstate[6], newstate[5], newstate[4]); #1000
  $display("%b %b %b %b",newstate[3], newstate[2], newstate[1], newstate[0]);

  end
endmodule
