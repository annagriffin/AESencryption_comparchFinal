`timescale 1 ns / 1 ps
`include "sbox.v"


module substitute
(
    output [15:0][7:0] newstate,
    input [15:0][7:0] state
);

    // substitute row 1 values
    sbox a0(.result(newState[15][7:0]), .addr(state[15][7:0]));
    sbox a1(.result(newState[14][7:0]), .addr(state[14][7:0]));
    sbox a2(.result(newState[13][7:0]), .addr(state[13][7:0]));
    sbox a3(.result(newState[12][7:0]), .addr(state[12][7:0]));

    // substitute row 2 values
    sbox b0(.result(newState[11][7:0]), .addr(state[11][7:0]));
    sbox b1(.result(newState[10][7:0]), .addr(state[10][7:0]));
    sbox b2(.result(newState[9][7:0]), .addr(state[9][7:0]));
    sbox b3(.result(newState[8][7:0]), .addr(state[8][7:0]));

    // substitute row 3 values
    sbox c0(.result(newState[7][7:0]), .addr(state[7][7:0]));
    sbox c1(.result(newState[6][7:0]), .addr(state[6][7:0]));
    sbox c2(.result(newState[5][7:0]), .addr(state[5][7:0]));
    sbox c3(.result(newState[4][7:0]), .addr(state[4][7:0]));

    // substitute row 4 values
    sbox d0(.result(newState[3][7:0]), .addr(state[3][7:0]));
    sbox d1(.result(newState[2][7:0]), .addr(state[2][7:0]));
    sbox d2(.result(newState[1][7:0]), .addr(state[1][7:0]));
    sbox d3(.result(newState[0][7:0]), .addr(state[0][7:0]));

endmodule
