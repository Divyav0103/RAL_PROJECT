interface ral_if(input logic PCLK, input bit PRESETn);
 
  logic        PSEL;
  logic        PENABLE;
  logic        PWRITE;
  logic [31:0]  PADDR;
  logic [31:0] PWDATA;
  logic [31:0] PRDATA;
 
  // Clocking block for synchronous access in driver/monitor
  clocking drv_cb @(posedge PCLK);
   default input #0 output #0;
   input PRESETn;
   inout PSEL;
   inout PENABLE;
   inout PWRITE;
   inout PADDR;
   inout PWDATA;
   input PRDATA;
  endclocking
   
 clocking mon_cb @(posedge PCLK);
  default input #0 output #0;
  input PSEL;
  input PENABLE;
  input PWRITE;
  input PADDR;
  input PWDATA;
  input PRDATA;
 endclocking
  
 modport DRV(clocking drv_cb, input PCLK, PRESETn, PRDATA);
 modport MON(clocking mon_cb, input PCLK, PRESETn);
endinterface
