`timescale 1 ns / 1 ps
module keyadd(state,key,newstate);
    input [15:0][7:0] state;
    input [15:0][7:0] key;
    output [15:0][7:0] newstate;
    generate
    genvar i;
    genvar j;
    for (i=0; i<16; i=i+1) begin
        for (j=0; j<8; j=j+1) begin
        xor xorgate(newstate[i][j],state[i][j],key[i][j]);
        end
    end
    endgenerate
endmodule
