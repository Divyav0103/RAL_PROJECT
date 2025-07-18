`include "uvm_pkg.sv"
`include "ral_pkg.sv"
`include "uvm_macros.svh"

 `include "ral_if.sv"

import uvm_pkg::*;

module tb;
  
  ral_if vif;
  top dut(vif.PCLK,vif.PRESETn,vif.SEL,vif.PENABLE,vif.PWRITE,vif.PADDR,vif.PWDATA,vif.PRDATA);
  
  initial begin
    vif.PCLK<=0;
  end
  
  always #10 vif.PCLK =~vif.PCLK;
  
  initial begin
    uvm_config_db#(virtual ral_if)::set(null,"*","vif",vif);
    
    run_test("test");
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
  end
endmodule
