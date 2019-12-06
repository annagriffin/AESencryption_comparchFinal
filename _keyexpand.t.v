`include "_keyexpand.v"


module test_wholekeyexpand();
  reg clk;
  reg[15:0][7:0] state;
  reg[15:0][7:0] key;
  wire [159:0][7:0] out;


  wholekeyexpand test1(.out(out), .clk(clk), .state(state), .key(key));

  initial begin
  state[0]=8'h34; state[1]=8'ha2; state[2]=8'h8d; state[3]=8'ha8;
  state[4]=8'h07; state[5]=8'h98; state[6]=8'h30; state[7]=8'hf6;
  state[8]=8'h37; state[9]=8'h31; state[10]=8'h5a; state[11]=8'h43;
  state[12]=8'he0; state[13]=8'h31; state[14]=8'h88; state[15]=8'h32;

  key[0]=8'h3c; key[1]=8'h88; key[2]=8'ha6; key[3]=8'h16;
  key[4]=8'h4f; key[5]=8'h15; key[6]=8'hd2; key[7]=8'h15;
  key[8]=8'hcf; key[9]=8'hf7; key[10]=8'hae; key[11]=8'h7e;
  key[12]=8'h09; key[13]=8'hab; key[14]=8'h28; key[15]=8'h2b; #1000

  $display("%h  %h  %h  %h", out[0], out[1], out[2], out[3]); #1000
  $display("%h  %h  %h  %h", out[4], out[5], out[6], out[7]); #1000
  $display("%h  %h  %h  %h", out[8], out[9], out[10], out[11]); #1000
  $display("%h  %h  %h  %h", out[12], out[13], out[14], out[15]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[16], out[17], out[18], out[19]); #1000
  $display("%h  %h  %h  %h", out[20], out[21], out[22], out[23]); #1000
  $display("%h  %h  %h  %h", out[24], out[25], out[26], out[27]); #1000
  $display("%h  %h  %h  %h", out[28], out[29], out[30], out[31]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[32], out[33], out[34], out[35]); #1000
  $display("%h  %h  %h  %h", out[36], out[37], out[38], out[39]); #1000
  $display("%h  %h  %h  %h", out[40], out[41], out[42], out[43]); #1000
  $display("%h  %h  %h  %h", out[44], out[45], out[46], out[47]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[48], out[49], out[50], out[51]); #1000
  $display("%h  %h  %h  %h", out[52], out[53], out[54], out[55]); #1000
  $display("%h  %h  %h  %h", out[56], out[57], out[58], out[59]); #1000
  $display("%h  %h  %h  %h", out[60], out[61], out[62], out[63]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[64], out[65], out[66], out[67]); #1000
  $display("%h  %h  %h  %h", out[68], out[69], out[70], out[71]); #1000
  $display("%h  %h  %h  %h", out[72], out[73], out[74], out[75]); #1000
  $display("%h  %h  %h  %h", out[76], out[77], out[78], out[79]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[80], out[81], out[82], out[83]); #1000
  $display("%h  %h  %h  %h", out[84], out[85], out[86], out[87]); #1000
  $display("%h  %h  %h  %h", out[88], out[89], out[90], out[91]); #1000
  $display("%h  %h  %h  %h", out[92], out[93], out[94], out[95]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[96], out[97], out[98], out[99]); #1000
  $display("%h  %h  %h  %h", out[100], out[101], out[102], out[103]); #1000
  $display("%h  %h  %h  %h", out[104], out[105], out[106], out[107]); #1000
  $display("%h  %h  %h  %h", out[108], out[109], out[110], out[111]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[112], out[113], out[114], out[115]); #1000
  $display("%h  %h  %h  %h", out[116], out[117], out[118], out[119]); #1000
  $display("%h  %h  %h  %h", out[120], out[121], out[122], out[123]); #1000
  $display("%h  %h  %h  %h", out[124], out[125], out[126], out[127]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[128], out[129], out[130], out[131]); #1000
  $display("%h  %h  %h  %h", out[132], out[133], out[134], out[135]); #1000
  $display("%h  %h  %h  %h", out[136], out[137], out[138], out[139]); #1000
  $display("%h  %h  %h  %h", out[140], out[141], out[142], out[143]); #1000
  $display(); #1000
  $display("%h  %h  %h  %h", out[144], out[145], out[146], out[147]); #1000
  $display("%h  %h  %h  %h", out[148], out[149], out[150], out[151]); #1000
  $display("%h  %h  %h  %h", out[152], out[153], out[154], out[155]); #1000
  $display("%h  %h  %h  %h", out[156], out[157], out[158], out[159]);


  end

endmodule