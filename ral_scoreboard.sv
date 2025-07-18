class apb_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(apb_scoreboard)

  uvm_analysis_imp#(apb_transaction, apb_scoreboard) aport;
  bit [31:0] expected_mem [16];

  function new(string name = "apb_scoreboard", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function build_phase(uvm_phase phase);
    super.build_phase(phase);
    aport=new("aport",this);
  endfunction
  
  virtual function void write(apb_transaction tr);
    if (tr.PWRITE) begin
      expected_mem[tr.PADDR] = tr.PWDATA;
      `uvm_info("SCOREBOARD", $sformatf("WRITE: Addr = %0h, Data = %0h", tr.PADDR, tr.PWDATA), UVM_MEDIUM);
    end else begin
      if (expected_mem[tr.PADDR] !== tr.PRDATA) begin
        `uvm_error("SCOREBOARD", $sformatf("Mismatch at Addr = %0h, Expected = %0h, Received = %0h", tr.PADDR, expected_mem[tr.PADDR], tr.PRDATA));
      end else begin
        `uvm_info("SCOREBOARD", $sformatf("READ MATCH: Addr = %0h, Data = %0h", tr.PADDR, tr.PRDATA), UVM_MEDIUM);
      end
    end
  endfunction
endclass


