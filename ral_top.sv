
`include "uvm_macros.svh"
import uvm_pkg::*;  
`include "ral_pkg.sv"
 `include "ral_if.sv"
`include "design.v"
import ral_pkg::*;

module tb;
  
 virtual  ral_if vif;
  apb_slave  dut(vif.PCLK,vif.PRESETn,vif.SEL,vif.PENABLE,vif.PWRITE,vif.PADDR,vif.PWDATA,vif.PRDATA);
  
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
