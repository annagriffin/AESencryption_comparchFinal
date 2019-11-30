`include "substitute.v"

module test_substitute();
  reg [15:0][7:0]state;
  wire [15:0][7:0]newstate;

  substitute test(.state(state),.newstate(newstate));

  initial begin
  $display("Substitute");

  state[0]=8'h19; state[1]=8'h3d; state[2]=8'he3; state[3]=8'hbe;
  state[4]=8'ha0; state[5]=8'hf4; state[6]=8'he2; state[7]=8'h2b;
  state[8]=8'h9a; state[9]=8'hc6; state[10]=8'h8d; state[11]=8'h2a;
  state[12]=8'he9; state[13]=8'hf8; state[14]=8'h48; state[15]=8'h08;
   #1000

  $display("%h  %h  %h  %h", state[0], state[4], state[8], state[12]); #1000
  $display("%h  %h  %h  %h", state[1], state[5], state[9], state[13]); #1000
  $display("%h  %h  %h  %h", state[2], state[6], state[10], state[14]); #1000
  $display("%h  %h  %h  %h", state[3], state[7], state[11], state[15]); #1000

    $display(); #1000
  $display("%h  %h  %h  %h", newstate[0], newstate[4], newstate[8], newstate[12]); #1000
  $display("%h  %h  %h  %h", newstate[1], newstate[5], newstate[9], newstate[13]); #1000
  $display("%h  %h  %h  %h", newstate[2], newstate[6], newstate[10], newstate[14]); #1000
  $display("%h  %h  %h  %h", newstate[3], newstate[7], newstate[11], newstate[15]);
  end
endmodule
