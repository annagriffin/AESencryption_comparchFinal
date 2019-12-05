`include "invsubst.v"
module test_invsubstitute();
  reg [15:0][7:0]state;
  wire [15:0][7:0]newstate;

  inv_substitute test(.state(state),.newstate(newstate));

  initial begin
  $display("Inverse Substitute");

  state[15]=8'hd4; state[11]=8'h27; state[7]=8'h11; state[3]=8'hae;
  state[14]=8'he0; state[10]=8'hbf; state[6]=8'h98; state[2]=8'hf1;
  state[13]=8'hb8; state[9]=8'hb4; state[5]=8'h5d; state[1]=8'he5;
  state[12]=8'h1e; state[8]=8'h41; state[4]=8'h52; state[0]=8'h30;
   #1000

  $display("%h  %h  %h  %h", state[15], state[14], state[13], state[12]); #1000
  $display("%h  %h  %h  %h", state[11], state[10], state[9], state[8]); #1000
  $display("%h  %h  %h  %h", state[7], state[6], state[5], state[4]); #1000
  $display("%h  %h  %h  %h", state[3], state[2], state[1], state[0]); #1000

  $display(); #1000

  $display("%h  %h  %h  %h", newstate[15], newstate[14], newstate[13], newstate[12]); #1000
  $display("%h  %h  %h  %h", newstate[11], newstate[10], newstate[9], newstate[8]); #1000
  $display("%h  %h  %h  %h", newstate[7], newstate[6], newstate[5], newstate[4]); #1000
  $display("%h  %h  %h  %h", newstate[3], newstate[2], newstate[1], newstate[0]);
  end
endmodule
