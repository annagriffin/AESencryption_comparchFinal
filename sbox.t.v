//testbench for sbox module
`include "sbox.v"

module test_sbox();

  reg [7:0]addr;
  wire[7:0] result;


  sbox test(.addr(addr), .result(result));
//print table outputs at various values
  initial begin
    $display("sbox test"); #1000
    $display("Addr  Out  | Expected"); #1000
    addr=8'h19; #1000
    $display("%h    %h   | d4", addr, result);
    addr=8'h45; #1000
    $display("%h    %h   | 6e", addr, result);
    addr=8'h29; #1000
    $display("%h    %h   | a5", addr, result);
    addr=8'h01; #1000
    $display("%h    %h   | 7c", addr, result);
    addr=8'hef; #1000
    $display("%h    %h   | df", addr, result);
    addr=8'ha4; #1000
    $display("%h    %h   | 49", addr, result);
    addr=8'h7b; #1000
    $display("%h    %h   | 21", addr, result);
    addr=8'h33; #1000
    $display("%h    %h   | c3", addr, result);
  end

endmodule
