// module top (
//   input PCLK,         // APB Clock
//   input PRESETn,      // Active-low reset
//   input PSEL,         // APB Select
//   input PENABLE,      // APB Enable
//   input PWRITE,       // APB Write
//   input [3:0] PADDR,  // APB Address
//   input [7:0] PWDATA, // APB Write Data
//   output reg [7:0] PRDATA // APB Read Data
// );
//   reg [7:0] mem [15:0]; // 16 x 8-bit memory

//   always @(posedge PCLK or negedge PRESETn) begin
//     if (!PRESETn) begin
//       PRDATA <= 8'b0;
//     end else if (PSEL && PENABLE) begin
//       if (PWRITE)
//         mem[PADDR] <= PWDATA; // Write to memory
//       else
//         PRDATA <= mem[PADDR]; // Read from memory
//     end
//   end
// endmodule

module tb;
  
  apb_if vif;
  top dut(vif.PCLK,vif.PRESETn,vif.SEL,vif.PENABLE,vif.PWRITE,vif.PADDR,vif.PWDATA,vif.PRDATA);
  
  initial begin
    vif.PCLK<=0;
  end
  
  always #10 vif.PCLK =~vif.PCLK;
  
  initial begin
    uvm_config_db#(virtual apb_if)::set(null,"*","vif",vif);
    
    run_test("test");
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
  end
endmodule
