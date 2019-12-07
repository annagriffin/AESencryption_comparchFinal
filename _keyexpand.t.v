//testbench for _keyexpand.v, which solves for all the round keys used in encryption
`include "_keyexpand.v"


module test_wholekeyexpand();
  reg clk;
  reg[15:0][7:0] state;
  reg[15:0][7:0] key;
  wire [159:0][7:0] out;


  wholekeyexpand test1(.out(out), .clk(clk), .state(state), .key(key));
//print all of the round keys used in encryption, so that we can use them to decrypt
  initial begin
  state[0]=8'h34; state[1]=8'ha2; state[2]=8'h8d; state[3]=8'ha8;
  state[4]=8'h07; state[5]=8'h98; state[6]=8'h30; state[7]=8'hf6;
  state[8]=8'h37; state[9]=8'h31; state[10]=8'h5a; state[11]=8'h43;
  state[12]=8'he0; state[13]=8'h31; state[14]=8'h88; state[15]=8'h32;

  key[0]=8'h3c; key[1]=8'h88; key[2]=8'ha6; key[3]=8'h16;
  key[4]=8'h4f; key[5]=8'h15; key[6]=8'hd2; key[7]=8'h15;
  key[8]=8'hcf; key[9]=8'hf7; key[10]=8'hae; key[11]=8'h7e;
  key[12]=8'h09; key[13]=8'hab; key[14]=8'h28; key[15]=8'h2b; #1000

  $display("%h  %h  %h  %h", out[15], out[14], out[13], out[12]); #1000
  $display("%h  %h  %h  %h", out[11], out[10], out[9], out[8]); #1000
  $display("%h  %h  %h  %h", out[7], out[6], out[5], out[4]); #1000
  $display("%h  %h  %h  %h", out[3], out[2], out[1], out[0]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[31], out[30], out[29], out[28]); #1000
  $display("%h  %h  %h  %h", out[27], out[26], out[25], out[24]); #1000
  $display("%h  %h  %h  %h", out[23], out[22], out[21], out[20]); #1000
  $display("%h  %h  %h  %h", out[19], out[18], out[17], out[16]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[47], out[46], out[45], out[44]); #1000
  $display("%h  %h  %h  %h", out[43], out[42], out[41], out[40]); #1000
  $display("%h  %h  %h  %h", out[39], out[38], out[37], out[36]); #1000
  $display("%h  %h  %h  %h", out[35], out[34], out[33], out[32]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[63], out[62], out[61], out[60]); #1000
  $display("%h  %h  %h  %h", out[59], out[58], out[57], out[56]); #1000
  $display("%h  %h  %h  %h", out[55], out[54], out[53], out[52]); #1000
  $display("%h  %h  %h  %h", out[51], out[50], out[49], out[48]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[79], out[78], out[77], out[76]); #1000
  $display("%h  %h  %h  %h", out[75], out[74], out[73], out[72]); #1000
  $display("%h  %h  %h  %h", out[71], out[70], out[69], out[68]); #1000
  $display("%h  %h  %h  %h", out[67], out[66], out[65], out[64]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[95], out[94], out[93], out[92]); #1000
  $display("%h  %h  %h  %h", out[91], out[90], out[89], out[88]); #1000
  $display("%h  %h  %h  %h", out[87], out[86], out[85], out[84]); #1000
  $display("%h  %h  %h  %h", out[83], out[82], out[81], out[80]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[111], out[110], out[109], out[108]); #1000
  $display("%h  %h  %h  %h", out[107], out[106], out[105], out[104]); #1000
  $display("%h  %h  %h  %h", out[103], out[102], out[101], out[100]); #1000
  $display("%h  %h  %h  %h", out[99], out[98], out[97], out[96]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[127], out[126], out[125], out[124]); #1000
  $display("%h  %h  %h  %h", out[123], out[122], out[121], out[120]); #1000
  $display("%h  %h  %h  %h", out[119], out[118], out[117], out[116]); #1000
  $display("%h  %h  %h  %h", out[115], out[114], out[113], out[112]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[143], out[142], out[141], out[140]); #1000
  $display("%h  %h  %h  %h", out[139], out[138], out[137], out[136]); #1000
  $display("%h  %h  %h  %h", out[135], out[134], out[133], out[132]); #1000
  $display("%h  %h  %h  %h", out[131], out[130], out[129], out[128]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[159], out[158], out[157], out[156]); #1000
  $display("%h  %h  %h  %h", out[155], out[154], out[153], out[152]); #1000
  $display("%h  %h  %h  %h", out[151], out[150], out[149], out[148]); #1000
  $display("%h  %h  %h  %h", out[147], out[146], out[145], out[144]);

  end
endmodule
