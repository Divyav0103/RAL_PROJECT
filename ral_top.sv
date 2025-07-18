
`include "uvm_macros.svh"
import uvm_pkg::*;  
`include "ral_pkg.sv"
 `include "ral_if.sv"
`include "design.v"
import ral_pkg::*;

module tb;
 bit CLK,PRESETn=0; 
  apb_slave  dut(CLK,PRESETn,vif.PSEL,vif.PENABLE,vif.PWRITE,vif.PADDR,vif.PWDATA,vif.PRDATA);
  ral_if vif(CLK,PRESETn);
  initial begin
    CLK=0;
    PRESETn=1;
#10 PRESETn=0;
  end
  
  always #5 CLK =~CLK;
  
  initial begin
    uvm_config_db#(virtual ral_if)::set(null,"*","vif",vif);
    
    run_test("apb_test");
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
