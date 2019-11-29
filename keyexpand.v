`include "substitute.v"
`include "sbox.v"
module keygenerate(rc,key,keyout);
    input [15:0][7:0] key;
    input [3:0] rc;
    output [15:0][7:0] keyout;
    wire [3:0][7:0]temp;
    

    substitute sub1(.state([2][7:0]temp),.newstate([3][7:0]key));
    substitute sub2(.state([1][7:0]temp),.newstate([2][7:0]key));
    substitute sub3(.state([0][7:0]temp),.newstate([1][7:0]key));
    substitute sub4(.state([3][7:0]temp),.newstate([0][7:0]key));

    assign keyout[12:15][7:0]=key[12:15][7:0] ^ tem ^ rcon(rc);
    assign keyout[8:11][7:0]=key[12:15][7:0] ^ tem ^ rcon(rc)^ key[8:11][7:0];
    assign keyout[4:7][7:0]=key[12:15][7:0] ^ tem ^ rcon(rc)^ key[8:11][7:0] ^ key[4:7][7:0];
    assign keyout[0:3][7:0]=key[12:15][7:0] ^ tem ^ rcon(rc)^ key[8:11][7:0]^ key[4:7][7:0] ^ key[0:3][7:0];

    function []rcon;
      input [] rc;
      case(rc)
        4'h0: rcon=32'h01_00_00_00;
        4'h1: rcon=32'h02_00_00_00;
        4'h2: rcon=32'h04_00_00_00;
        4'h3: rcon=32'h08_00_00_00;
        4'h4: rcon=32'h10_00_00_00;
        4'h5: rcon=32'h20_00_00_00;
        4'h6: rcon=32'h40_00_00_00;
        4'h7: rcon=32'h80_00_00_00;
        4'h8: rcon=32'h1b_00_00_00;
        4'h9: rcon=32'h36_00_00_00;
        default: rcon=32'h00_00_00_00;
      endcase

    endfunction
endmodule
