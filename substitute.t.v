//test bench for substitute.v
`include "substitute.v"
module test_substitute();
  reg [15:0][7:0]state;
  wire [15:0][7:0]newstate;

  substitute test(.state(state),.newstate(newstate));

  initial begin
  $display("Substitute");
//initialize state object
  state[15]=8'h19; state[11]=8'h3d; state[7]=8'he3; state[3]=8'hbe;
  state[14]=8'ha0; state[10]=8'hf4; state[6]=8'he2; state[2]=8'h2b;
  state[13]=8'h9a; state[9]=8'hc6; state[5]=8'h8d; state[1]=8'h2a;
  state[12]=8'he9; state[8]=8'hf8; state[4]=8'h48; state[0]=8'h08;
   #1000
//print origional object
  $display("%h  %h  %h  %h", state[15], state[14], state[13], state[12]); #1000
  $display("%h  %h  %h  %h", state[11], state[10], state[9], state[8]); #1000
  $display("%h  %h  %h  %h", state[7], state[6], state[5], state[4]); #1000
  $display("%h  %h  %h  %h", state[3], state[2], state[1], state[0]); #1000

  $display(); #1000
//print substituted object
  $display("%h  %h  %h  %h", newstate[15], newstate[14], newstate[13], newstate[12]); #1000
  $display("%h  %h  %h  %h", newstate[11], newstate[10], newstate[9], newstate[8]); #1000
  $display("%h  %h  %h  %h", newstate[7], newstate[6], newstate[5], newstate[4]); #1000
  $display("%h  %h  %h  %h", newstate[3], newstate[2], newstate[1], newstate[0]); #1000

  $display(); #1000
  $display(); #1000

  state[15]=8'h49; state[11]=8'h66; state[7]=8'h20; state[3]=8'h6e;
  state[14]=8'h6f; state[10]=8'h74; state[6]=8'h20; state[2]=8'h6e;
  state[13]=8'h6f; state[9]=8'h77; state[5]=8'h20; state[1]=8'h77;
  state[12]=8'h68; state[8]=8'h65; state[4]=8'h6e; state[0]=8'h3f;
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
