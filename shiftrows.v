//Shift Rows module for AES encryption
module shiftrows(state,newstate);
  input [15:0][7:0] state;
  output [15:0][7:0] newstate;

//Shfiting some rows!

//row 1 has no change
assign newstate[15][7:0]=state[15][7:0];
assign newstate[14][7:0]=state[14][7:0];
assign newstate[13][7:0]=state[13][7:0];
assign newstate[12][7:0]=state[12][7:0];


//row 2 shifts by 1
assign newstate[11][7:0]=state[10][7:0];
assign newstate[10][7:0]=state[9][7:0];
assign newstate[9][7:0]=state[8][7:0];
assign newstate[8][7:0]=state[11][7:0];


//row 3 shifts by 2
assign newstate[7][7:0]=state[5][7:0];
assign newstate[6][7:0]=state[4][7:0];
assign newstate[5][7:0]=state[7][7:0];
assign newstate[4][7:0]=state[6][7:0];


//row 4 shifts by 3
assign newstate[3][7:0]=state[0][7:0];
assign newstate[2][7:0]=state[3][7:0];
assign newstate[1][7:0]=state[2][7:0];
assign newstate[0][7:0]=state[1][7:0];
endmodule
