//Look up table "SBox" for AES Encryption, to be used in substitute.v
`timescale 1ns / 1ps

module sbox
(
output reg[7:0] result,
input[7:0] addr,
output[3:0] row,
output[3:0] column
);

// column
wire[3:0] column;
assign column = addr[3:0];

// row
wire[3:0] row;
assign row = addr[7:4];
//Input look up table row by row
always @(addr)
case(row)
  4'h0:
    case(column)
      4'h0: result = 8'h63;
      4'h1: result = 8'h7c;
      4'h2: result = 8'h77;
      4'h3: result = 8'h7b;
      4'h4: result = 8'hf2;
      4'h5: result = 8'h6b;
      4'h6: result = 8'h6f;
      4'h7: result = 8'hc5;
      4'h8: result = 8'h30;
      4'h9: result = 8'h01;
      4'ha: result = 8'h67;
      4'hb: result = 8'h2b;
      4'hc: result = 8'hfe;
      4'hd: result = 8'hd7;
      4'he: result = 8'hab;
      4'hf: result = 8'h76;
    endcase
   4'h1:
    case(column)
      4'h0: result = 8'hca;
      4'h1: result = 8'h82;
      4'h2: result = 8'hc9;
      4'h3: result = 8'h7d;
      4'h4: result = 8'hfa;
      4'h5: result = 8'h59;
      4'h6: result = 8'h47;
      4'h7: result = 8'hf0;
      4'h8: result = 8'had;
      4'h9: result = 8'hd4;
      4'ha: result = 8'ha2;
      4'hb: result = 8'haf;
      4'hc: result = 8'h9c;
      4'hd: result = 8'ha4;
      4'he: result = 8'h72;
      4'hf: result = 8'hc0;
    endcase
  4'h2:
    case(column)
      4'h0: result = 8'hb7;
      4'h1: result = 8'hfd;
      4'h2: result = 8'h93;
      4'h3: result = 8'h26;
      4'h4: result = 8'h36;
      4'h5: result = 8'h3f;
      4'h6: result = 8'hf7;
      4'h7: result = 8'hcc;
      4'h8: result = 8'h34;
      4'h9: result = 8'ha5;
      4'ha: result = 8'he5;
      4'hb: result = 8'hf1;
      4'hc: result = 8'h71;
      4'hd: result = 8'hd8;
      4'he: result = 8'h31;
      4'hf: result = 8'h15;
     endcase
  4'h3:
    case(column)
      4'h0: result = 8'h04;
      4'h1: result = 8'hc7;
      4'h2: result = 8'h23;
      4'h3: result = 8'hc3;
      4'h4: result = 8'h18;
      4'h5: result = 8'h96;
      4'h6: result = 8'h05;
      4'h7: result = 8'h9a;
      4'h8: result = 8'h07;
      4'h9: result = 8'h12;
      4'ha: result = 8'h80;
      4'hb: result = 8'he2;
      4'hc: result = 8'heb;
      4'hd: result = 8'h27;
      4'he: result = 8'hb2;
      4'hf: result = 8'h75;
    endcase

  4'h4:
  case(column)
    4'h0: result = 8'h09;
    4'h1: result = 8'h83;
    4'h2: result = 8'h2c;
    4'h3: result = 8'h1a;
    4'h4: result = 8'h1b;
    4'h5: result = 8'h6e;
    4'h6: result = 8'h5a;
    4'h7: result = 8'ha0;
    4'h8: result = 8'h52;
    4'h9: result = 8'h3b;
    4'ha: result = 8'hd6;
    4'hb: result = 8'hb3;
    4'hc: result = 8'h29;
    4'hd: result = 8'he3;
    4'he: result = 8'h2f;
    4'hf: result = 8'h84;
  endcase
  4'h5:
  case(column)
    4'h0: result = 8'h53;
    4'h1: result = 8'hd1;
    4'h2: result = 8'h00;
    4'h3: result = 8'hed;
    4'h4: result = 8'h20;
    4'h5: result = 8'hfc;
    4'h6: result = 8'hb1;
    4'h7: result = 8'h5b;
    4'h8: result = 8'h6a;
    4'h9: result = 8'hcb;
    4'ha: result = 8'hbe;
    4'hb: result = 8'h39;
    4'hc: result = 8'h4a;
    4'hd: result = 8'h4c;
    4'he: result = 8'h58;
    4'hf: result = 8'hcf;
  endcase

  4'h6:
  case(column)
    4'h0: result = 8'hd0;
    4'h1: result = 8'hef;
    4'h2: result = 8'haa;
    4'h3: result = 8'hfb;
    4'h4: result = 8'h43;
    4'h5: result = 8'h4d;
    4'h6: result = 8'h33;
    4'h7: result = 8'h85;
    4'h8: result = 8'h45;
    4'h9: result = 8'hf9;
    4'ha: result = 8'h02;
    4'hb: result = 8'h7f;
    4'hc: result = 8'h50;
    4'hd: result = 8'h3c;
    4'he: result = 8'h9f;
    4'hf: result = 8'ha8;
  endcase

  4'h7:
  case(column)
    4'h0: result = 8'h51;
    4'h1: result = 8'ha3;
    4'h2: result = 8'h40;
    4'h3: result = 8'h8f;
    4'h4: result = 8'h92;
    4'h5: result = 8'h9d;
    4'h6: result = 8'h38;
    4'h7: result = 8'hf5;
    4'h8: result = 8'hbc;
    4'h9: result = 8'hb6;
    4'ha: result = 8'hda;
    4'hb: result = 8'h21;
    4'hc: result = 8'h10;
    4'hd: result = 8'hff;
    4'he: result = 8'hf3;
    4'hf: result = 8'hd2;
  endcase

  4'h8:
  case(column)
    4'h0: result = 8'hcd;
    4'h1: result = 8'h0c;
    4'h2: result = 8'h13;
    4'h3: result = 8'hec;
    4'h4: result = 8'h5f;
    4'h5: result = 8'h97;
    4'h6: result = 8'h44;
    4'h7: result = 8'h17;
    4'h8: result = 8'hc4;
    4'h9: result = 8'ha7;
    4'ha: result = 8'h7e;
    4'hb: result = 8'h3d;
    4'hc: result = 8'h64;
    4'hd: result = 8'h5d;
    4'he: result = 8'h19;
    4'hf: result = 8'h73;
  endcase

  4'h9:
  case(column)
    4'h0: result = 8'h60;
    4'h1: result = 8'h81;
    4'h2: result = 8'h4f;
    4'h3: result = 8'hdc;
    4'h4: result = 8'h22;
    4'h5: result = 8'h2a;
    4'h6: result = 8'h90;
    4'h7: result = 8'h88;
    4'h8: result = 8'h46;
    4'h9: result = 8'hee;
    4'ha: result = 8'hb8;
    4'hb: result = 8'h14;
    4'hc: result = 8'hde;
    4'hd: result = 8'h5e;
    4'he: result = 8'h0b;
    4'hf: result = 8'hdb;
  endcase

  4'ha:
  case(column)
    4'h0: result = 8'he0;
    4'h1: result = 8'h32;
    4'h2: result = 8'h3a;
    4'h3: result = 8'h0a;
    4'h4: result = 8'h49;
    4'h5: result = 8'h06;
    4'h6: result = 8'h24;
    4'h7: result = 8'h5c;
    4'h8: result = 8'hc2;
    4'h9: result = 8'hd3;
    4'ha: result = 8'hac;
    4'hb: result = 8'h62;
    4'hc: result = 8'h91;
    4'hd: result = 8'h95;
    4'he: result = 8'he4;
    4'hf: result = 8'h79;
  endcase

  4'hb:
  case(column)
    4'h0: result = 8'he7;
    4'h1: result = 8'hc8;
    4'h2: result = 8'h37;
    4'h3: result = 8'h6d;
    4'h4: result = 8'h8d;
    4'h5: result = 8'hd5;
    4'h6: result = 8'h4e;
    4'h7: result = 8'ha9;
    4'h8: result = 8'h6c;
    4'h9: result = 8'h56;
    4'ha: result = 8'hf4;
    4'hb: result = 8'hea;
    4'hc: result = 8'h65;
    4'hd: result = 8'h7a;
    4'he: result = 8'hae;
    4'hf: result = 8'h08;
  endcase

  4'hc:
  case(column)
    4'h0: result = 8'hba;
    4'h1: result = 8'h78;
    4'h2: result = 8'h25;
    4'h3: result = 8'h2e;
    4'h4: result = 8'h1c;
    4'h5: result = 8'ha6;
    4'h6: result = 8'hb4;
    4'h7: result = 8'hc6;
    4'h8: result = 8'he8;
    4'h9: result = 8'hdd;
    4'ha: result = 8'h74;
    4'hb: result = 8'h1f;
    4'hc: result = 8'h4b;
    4'hd: result = 8'hbd;
    4'he: result = 8'h8b;
    4'hf: result = 8'h8a;
  endcase

  4'hd:
  case(column)
    4'h0: result = 8'h70;
    4'h1: result = 8'h3e;
    4'h2: result = 8'hb5;
    4'h3: result = 8'h66;
    4'h4: result = 8'h48;
    4'h5: result = 8'h03;
    4'h6: result = 8'hf6;
    4'h7: result = 8'h0e;
    4'h8: result = 8'h61;
    4'h9: result = 8'h35;
    4'ha: result = 8'h57;
    4'hb: result = 8'hb9;
    4'hc: result = 8'h86;
    4'hd: result = 8'hc1;
    4'he: result = 8'h1d;
    4'hf: result = 8'h9e;
  endcase

  4'he:
  case(column)
    4'h0: result = 8'he1;
    4'h1: result = 8'hf8;
    4'h2: result = 8'h98;
    4'h3: result = 8'h11;
    4'h4: result = 8'h69;
    4'h5: result = 8'hd9;
    4'h6: result = 8'h8e;
    4'h7: result = 8'h94;
    4'h8: result = 8'h9b;
    4'h9: result = 8'h1e;
    4'ha: result = 8'h87;
    4'hb: result = 8'he9;
    4'hc: result = 8'hce;
    4'hd: result = 8'h55;
    4'he: result = 8'h28;
    4'hf: result = 8'hdf;
  endcase

  4'hf:
  case(column)
    4'h0: result = 8'h8c;
    4'h1: result = 8'ha1;
    4'h2: result = 8'h89;
    4'h3: result = 8'h0d;
    4'h4: result = 8'hbf;
    4'h5: result = 8'he6;
    4'h6: result = 8'h42;
    4'h7: result = 8'h68;
    4'h8: result = 8'h41;
    4'h9: result = 8'h99;
    4'ha: result = 8'h2d;
    4'hb: result = 8'h0f;
    4'hc: result = 8'hb0;
    4'hd: result = 8'h54;
    4'he: result = 8'hbb;
    4'hf: result = 8'h16;
  endcase

endcase

endmodule
