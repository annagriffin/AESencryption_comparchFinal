`include "decrypt.v"


module test_decrypt();
  reg clk;
  reg[15:0][7:0] state;
  reg[15:0][7:0] key;
  wire [15:0][7:0] out;


  decrypt test1(.out(out), .clk(clk), .state(state), .key(key));

  initial begin
  $display("Decrypt");

  // NEED TO ADD IN EXPECTED VALUES TO PRINT STATMENTS

  state[0]=8'h32; state[1]=8'h97; state[2]=8'hfb; state[3]=8'h1d;
  state[4]=8'h0b; state[5]=8'h85; state[6]=8'h09; state[7]=8'h84;
  state[8]=8'h6a; state[9]=8'h11; state[10]=8'hdc; state[11]=8'h25;
  state[12]=8'h19; state[13]=8'hdc; state[14]=8'h02; state[15]=8'h39;

  // key[0]=8'ha6; key[1]=8'hc8; key[2]=8'h89; key[3]=8'ha8;
  // key[4]=8'h0c; key[5]=8'h0c; key[6]=8'h25; key[7]=8'hf9;
  // key[8]=8'h63; key[9]=8'h3f; key[10]=8'hee; key[11]=8'h14;
  // key[12]=8'hb6; key[13]=8'he1; key[14]=8'hc9; key[15]=8'd0;

  key[0]=8'h3c; key[1]=8'h88; key[2]=8'ha6; key[3]=8'h16;
  key[4]=8'h4f; key[5]=8'h15; key[6]=8'hd2; key[7]=8'h15;
  key[8]=8'hcf; key[9]=8'hf7; key[10]=8'hae; key[11]=8'h7e;
  key[12]=8'h09; key[13]=8'hab; key[14]=8'h28; key[15]=8'h2b;

  $display("%h  %h  %h  %h", state[15], state[14], state[13], state[12]); #1000
  $display("%h  %h  %h  %h", state[11], state[10], state[9], state[8]); #1000
  $display("%h  %h  %h  %h", state[7], state[6], state[5], state[4]); #1000
  $display("%h  %h  %h  %h", state[3], state[2], state[1], state[0]); #1000

  $display(); #1000
  $display("%h  %h  %h  %h | %h  %h  %h  %h", out[15], out[14], out[13], out[12], 8'h32, 8'h88, 8'h31, 8'he0); #1000
  $display("%h  %h  %h  %h | %h  %h  %h  %h", out[11], out[10], out[9], out[8], 8'h43, 8'h5a, 8'h31, 8'h37); #1000
  $display("%h  %h  %h  %h | %h  %h  %h  %h", out[7], out[6], out[5], out[4], 8'hf6, 8'h30, 8'h98, 8'h07); #1000
  $display("%h  %h  %h  %h | %h  %h  %h  %h", out[3], out[2], out[1], out[0], 8'ha8, 8'h8d, 8'ha2, 8'h34);

  end

endmodule