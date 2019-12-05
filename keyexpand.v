`include "substitute.v"

module keyexpand(
    input [15:0][7:0] key,
    input [3:0] rc,
    output [15:0][7:0] keyout
);

    wire [3:0][7:0] col0, col1, col2, col3;


    assign col0 = {key[3], key[7], key[11], key[15]};
    assign col1 = {key[2], key[6], key[10], key[14]};
    assign col2 = {key[1], key[5], key[9], key[13]};
    assign col3 = {key[0], key[4], key[8], key[12]};

    wire[3:0][7:0] newVals;
    assign newVals[0] = col3[1];
    assign newVals[1] = col3[2];
    assign newVals[2] = col3[3];
    assign newVals[3] = col3[0];

    // substitute la
    wire[3:0][7:0] subVals;
    substituteOneColumn sub0(.state(newVals), .newstate(subVals));

    wire[3:0][7:0] testResult0, testResult1, testResult2, testResult3;
    assign testResult0 = col0 ^ subVals ^ rcon(rc);
    assign testResult1 = testResult0 ^ col1;
    assign testResult2 = testResult1 ^ col2;
    assign testResult3 = testResult2 ^ col3;

    // col0
    assign keyout[15] = testResult0[0];
    assign keyout[11] = testResult0[1];
    assign keyout[7] =  testResult0[2];
    assign keyout[3] =  testResult0[3];

    // col1
    assign keyout[14] = testResult1[0];
    assign keyout[10] = testResult1[1];
    assign keyout[6] =  testResult1[2];
    assign keyout[2] =  testResult1[3];

    // col2
    assign keyout[13] = testResult2[0];
    assign keyout[9] =  testResult2[1];
    assign keyout[5] =  testResult2[2];
    assign keyout[1] =  testResult2[3];

    // col3
    assign keyout[12] = testResult3[0];
    assign keyout[8] =  testResult3[1];
    assign keyout[4] =  testResult3[2];
    assign keyout[0] =  testResult3[3];


    function [31:0]rcon;
      input [3:0] rc;
      case(rc)
        4'h0: rcon=32'h00_00_00_01;
        4'h1: rcon=32'h00_00_00_02;
        4'h2: rcon=32'h00_00_00_04;
        4'h3: rcon=32'h00_00_00_08;
        4'h4: rcon=32'h00_00_00_10;
        4'h5: rcon=32'h00_00_00_20;
        4'h6: rcon=32'h00_00_00_40;
        4'h7: rcon=32'h00_00_00_80;
        4'h8: rcon=32'h00_00_00_1b;
        4'h9: rcon=32'h00_00_00_36;
        default: rcon=32'h00_00_00_00;
      endcase

    endfunction
endmodule