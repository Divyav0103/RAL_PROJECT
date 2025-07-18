module apb_slave (
  input PCLK,
  input PRESETn,
  input PSEL,
  input PENABLE,
  input PWRITE,
  input [3:0] PADDR,
  input [31:0] PWDATA,
  output reg [31:0] PRDATA
);
  reg [31:0] slv_regs [0:4];
  always @(posedge PCLK or negedge PRESETn) begin
    if (!PRESETn) begin
      slv_regs[0] <= 32'h0000_0000;
      slv_regs[1] <= 32'hA5A5_0000;
      slv_regs[2] <= 32'h1234_9876;
      slv_regs[3] <= 32'h5A5A_5555;
      slv_regs[4] <= 32'h0000_FFFF;
      PRDATA <= 32'h0;
    end else if (PSEL && PENABLE) begin
      if (PWRITE)
        slv_regs[PADDR[3:2]] <= PWDATA;
      else
        PRDATA <= slv_regs[PADDR[3:2]];
    end
  end
endmodule
