`include "keyadd.v"

module test_keyadd();
  reg [15:0][7:0]state;
  reg [15:0][7:0]key;
  wire [15:0][7:0]newstate;

  keyadd test (.state(state),.newstate(newstate),.key(key));

  initial begin
  $display("Shift Rows test");
  state={8'b00111100,8'b00010000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
  key={8'b00100100,8'b11111111, 8'b01111111, 8'b00111111, 8'b00011111, 8'b00001111, 8'b00000111, 8'b00000011, 8'b00000001, 8'b10101010, 8'b11010101, 8'b11101010, 8'b11110101, 8'b11111010, 8'b11111101, 8'b11111110}; #1000
  $display("%b + %b = %b", state[15],key[15],newstate[15]);
  $display("%b + %b = %b", state[14],key[14],newstate[14]);
  $display("%b + %b = %b", state[13],key[13],newstate[13]);
  $display("%b + %b = %b", state[12],key[12],newstate[12]);
  $display("%b + %b = %b", state[11],key[11],newstate[11]);
  $display("%b + %b = %b", state[10],key[10],newstate[10]);
  $display("%b + %b = %b", state[9],key[9],newstate[9]);
  $display("%b + %b = %b", state[8],key[8],newstate[8]);
  $display("%b + %b = %b", state[7],key[7],newstate[7]);
  $display("%b + %b = %b", state[6],key[6],newstate[6]);
  $display("%b + %b = %b", state[5],key[5],newstate[5]);
  $display("%b + %b = %b", state[4],key[4],newstate[4]);
  $display("%b + %b = %b", state[3],key[3],newstate[3]);
  $display("%b + %b = %b", state[2],key[2],newstate[2]);
  $display("%b + %b = %b", state[1],key[1],newstate[1]);
  $display("%b + %b = %b", state[0],key[0],newstate[0]);
  end
endmodule
