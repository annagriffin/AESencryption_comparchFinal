`include "keyexpand.v"


module test_keyexpand();
  reg[15:0][7:0] key;
  reg[3:0] rc;
  wire[15:0][7:0] keyout;

  keyexpand test (.key(key), .rc(rc), .keyout(keyout));

  initial begin
  $display("keyexpand");
  rc=4'h0;
  key[0]=8'h3c; key[1]=8'h88; key[2]=8'ha6; key[3]=8'h16;
  key[4]=8'h4f; key[5]=8'h15; key[6]=8'hd2; key[7]=8'h15;
  key[8]=8'hcf; key[9]=8'hf7; key[10]=8'hae; key[11]=8'h7e;
  key[12]=8'h09; key[13]=8'hab; key[14]=8'h28; key[15]=8'h2b;


  $display(); #1000
  $display("%h  %h  %h  %h", key[15], key[14], key[13], key[12]); #1000
  $display("%h  %h  %h  %h", key[11], key[10], key[9], key[8]); #1000
  $display("%h  %h  %h  %h", key[7], key[6], key[5], key[4]); #1000
  $display("%h  %h  %h  %h", key[3], key[2], key[1], key[0]); #1000

  $display(); #1000

  $display(); #1000
  $display("%h  %h  %h  %h", keyout[15], keyout[14], keyout[13], keyout[12]); #1000
  $display("%h  %h  %h  %h", keyout[11], keyout[10], keyout[9], keyout[8]); #1000
  $display("%h  %h  %h  %h", keyout[7], keyout[6], keyout[5], keyout[4]); #1000
  $display("%h  %h  %h  %h", keyout[3], keyout[2], keyout[1], keyout[0]);





  end
  // $display("Shift Rows test");
  // state={8'b00111100,8'b00010000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
  // key={8'b00100100,8'b11111111, 8'b01111111, 8'b00111111, 8'b00011111, 8'b00001111, 8'b00000111, 8'b00000011, 8'b00000001, 8'b10101010, 8'b11010101, 8'b11101010, 8'b11110101, 8'b11111010, 8'b11111101, 8'b11111110}; #1000
  // $display("%b + %b = %b", state[15],key[15],newstate[15]);
  // $display("%b + %b = %b", state[14],key[14],newstate[14]);
  // $display("%b + %b = %b", state[13],key[13],newstate[13]);
  // $display("%b + %b = %b", state[12],key[12],newstate[12]);
  // $display("%b + %b = %b", state[11],key[11],newstate[11]);
  // $display("%b + %b = %b", state[10],key[10],newstate[10]);
  // $display("%b + %b = %b", state[9],key[9],newstate[9]);
  // $display("%b + %b = %b", state[8],key[8],newstate[8]);
  // $display("%b + %b = %b", state[7],key[7],newstate[7]);
  // $display("%b + %b = %b", state[6],key[6],newstate[6]);
  // $display("%b + %b = %b", state[5],key[5],newstate[5]);
  // $display("%b + %b = %b", state[4],key[4],newstate[4]);
  // $display("%b + %b = %b", state[3],key[3],newstate[3]);
  // $display("%b + %b = %b", state[2],key[2],newstate[2]);
  // $display("%b + %b = %b", state[1],key[1],newstate[1]);
  // $display("%b + %b = %b", state[0],key[0],newstate[0]);

endmodule

//00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 == 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
//62 63 63 63 62 63 63 63 62 63 63 63 62 63 63 63
//9b 98 98 c9 f9 fb fb aa 9b 98 98 c9 f9 fb fb aa
//90 97 34 50 69 6c cf fa f2 f4 57 33 0b 0f ac 99
//ee 06 da 7b 87 6a 15 81 75 9e 42 b2 7e 91 ee 2b
//7f 2e 2b 88 f8 44 3e 09 8d da 7c bb f3 4b 92 90
//ec 61 4b 85 14 25 75 8c 99 ff 09 37 6a b4 9b a7
//21 75 17 87 35 50 62 0b ac af 6b 3c c6 1b f0 9b
//0e f9 03 33 3b a9 61 38 97 06 0a 04 51 1d fa 9f
//b1 d4 d8 e2 8a 7d b9 da 1d 7b b3 de 4c 66 49 41
//b4 ef 5b cb 3e 92 e2 11 23 e9 51 cf 6f 8f 18 8e

//69 20 e2 99 a5 20 2a 6d 65 6e 63 68 69 74 6f 2a
//69 20 e2 99 a5 20 2a 6d 65 6e 63 68 69 74 6f 2a
//fa 88 07 60 5f a8 2d 0d 3a c6 4e 65 53 b2 21 4f
//cf 75 83 8d 90 dd ae 80 aa 1b e0 e5 f9 a9 c1 aa
//18 0d 2f 14 88 d0 81 94 22 cb 61 71 db 62 a0 db
//ba ed 96 ad 32 3d 17 39 10 f6 76 48 cb 94 d6 93
//88 1b 4a b2 ba 26 5d 8b aa d0 2b c3 61 44 fd 50
//b3 4f 19 5d 09 69 44 d6 a3 b9 6f 15 c2 fd 92 45
//a7 00 77 78 ae 69 33 ae 0d d0 5c bb cf 2d ce fe
//ff 8b cc f2 51 e2 ff 5c 5c 32 a3 e7 93 1f 6d 19
//24 b7 18 2e 75 55 e7 72 29 67 44 95 ba 78 29 8c
//ae 12 7c da db 47 9b a8 f2 20 df 3d 48 58 f6 b1
