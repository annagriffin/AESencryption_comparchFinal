`include "substitute.v"

module keyexpand(
    input [15:0][7:0] key,
    input [3:0] rc,
    output [15:0][7:0] keyout

);

    wire [3:0][7:0] col0, col1, col2, col3;

    assign col0 = key[3:0];
    assign col1 = key[7:4];
    assign col2 = key[11:8];
    assign col3 = key[15:12];

    wire[3:0][7:0] newVals;
    assign newVals[0] = col3[1];
    assign newVals[1] = col3[2];
    assign newVals[2] = col3[3];
    assign newVals[3] = col3[0];

    wire[3:0][7:0] rr;
    assign rr[0] = 8'h1;
    assign rr[1] = 8'h0;
    assign rr[2] = 8'h0;
    assign rr[3] = 8'h0;
    // substitute la
    wire[3:0][7:0] subVals;
    substituteOneColumn sub0(.state(newVals), .newstate(subVals));

    wire[3:0][7:0] testResult0, testResult1, testResult2, testResult3;
    assign testResult0 = col0 ^ subVals ^ rcon(rc);
    assign testResult1 = testResult0 ^ col1;
    assign testResult2 = testResult1 ^ col2;
    assign testResult3 = testResult2 ^ col3;

    assign keyout = {testResult3, testResult2, testResult1, testResult0};


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
