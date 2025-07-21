
`include "uvm_macros.svh"
import uvm_pkg::*;  
`include "ral_pkg.sv"
`include "ral_if.sv"
`include "design.v"
import ral_pkg::*;

module tb;
 bit CLK, PRESETn = 0;
 
 initial begin
  CLK = 0;
  PRESETn = 1;
  #10 PRESETn = 0;
 end

 ral_if vif(.CLK(CLK),.PRESETn(PRESETn));
 top dut(.pclk(vif.CLK),
         .presetn(vif.PRESETn),
         .psel(vif.PSEL),
         .penable(vif.PENABLE),
         .pwrite(vif.PWRITE),
         .paddr(vif.PADDR),
         .pwdata(vif.PWDATA),
         .prdata(vif.PRDATA));
 
 always #5 CLK = ~CLK;
 
 initial begin
  uvm_config_db#(virtual ral_if)::set(null,"*","vif",vif);
  run_test("apb_test");
 end
  
 initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  end
endmodule
