//AES invsubst module just calls inverse s box, uses as look up table to substitute
`timescale 1 ns / 1 ps
// `include "invsbox.v"
module inv_substitute
(
    output [15:0][7:0] newstate,
    input [15:0][7:0] state
);

    // substitute row 1 values
    inv_sbox a0(.result(newstate[15]), .addr(state[15]));
    inv_sbox a1(.result(newstate[14]), .addr(state[14]));
    inv_sbox a2(.result(newstate[13]), .addr(state[13]));
    inv_sbox a3(.result(newstate[12]), .addr(state[12]));

    // substitute row 2 values
    inv_sbox b0(.result(newstate[11]), .addr(state[11]));
    inv_sbox b1(.result(newstate[10]), .addr(state[10]));
    inv_sbox b2(.result(newstate[9]), .addr(state[9]));
    inv_sbox b3(.result(newstate[8]), .addr(state[8]));

    // substitute row 3 values
    inv_sbox c0(.result(newstate[7]), .addr(state[7]));
    inv_sbox c1(.result(newstate[6]), .addr(state[6]));
    inv_sbox c2(.result(newstate[5]), .addr(state[5]));
    inv_sbox c3(.result(newstate[4]), .addr(state[4]));

    // substitute row 4 values
    inv_sbox d0(.result(newstate[3]), .addr(state[3]));
    inv_sbox d1(.result(newstate[2]), .addr(state[2]));
    inv_sbox d2(.result(newstate[1]), .addr(state[1]));
    inv_sbox d3(.result(newstate[0]), .addr(state[0]));

    // assign newstate = newstate;
endmodule

//substitute just one column, for key expand
module invsubstituteOneColumn
(
    output [3:0][7:0] newstate,
    input [3:0][7:0] state
);

    inv_sbox d0(.result(newstate[3]), .addr(state[3]));
    inv_sbox d1(.result(newstate[2]), .addr(state[2]));
    inv_sbox d2(.result(newstate[1]), .addr(state[1]));
    inv_sbox d3(.result(newstate[0]), .addr(state[0]));

endmodule
