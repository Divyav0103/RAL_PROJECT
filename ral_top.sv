
`include "uvm_macros.svh"
import uvm_pkg::*;  
`include "ral_pkg.sv"
`include "design.v"

module tb;
 bit PCLK, PRESETn;
 
 initial begin
  PCLK = 0;
  PRESETn = 0;
  #10 PRESETn = 1;
 end

 ral_if vif(.PCLK(PCLK),.PRESETn(PRESETn));
 top dut(.pclk(vif.PCLK),
         .presetn(vif.PRESETn),
         .psel(vif.PSEL),
         .penable(vif.PENABLE),
         .pwrite(vif.PWRITE),
         .paddr(vif.PADDR),
         .pwdata(vif.PWDATA),
         .prdata(vif.PRDATA));
 
 always #5 PCLK = ~PCLK;
 
 initial begin
  uvm_config_db#(virtual ral_if)::set(null,"*","vif",vif);
  run_test("apb_reset_test");
 end
  
 initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  end
endmodule
