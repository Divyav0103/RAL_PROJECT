//`uvm_analysis_imp_decl(_active)
//`uvm_analysis_imp_decl(_passive)

class apb_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(apb_scoreboard)

//  uvm_analysis_imp_active#(apb_transaction, apb_scoreboard) drv_port;
  uvm_analysis_imp#(apb_transaction, apb_scoreboard) mon_port;

  apb_transaction req;

  bit [31:0] expected_mem [16];
//  bit [31:0] actual_mem [16];

  apb_transaction pkt_queue[$];

  function new(string name = "apb_scoreboard", uvm_component parent = null);
    super.new(name, parent);
  //  drv_port = new("drv_port", this);
    mon_port = new("mon_port", this);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  virtual function void write(apb_transaction tr);
    `uvm_info("SCOREBOARD", $sformatf(-----------------------------------INISDE MONITOR---------------------------------------------),UVM_LOW);
  pkt_queue.push_back(tr);
  endfunction

virtual task run_phase(uvm_phase phase);
  apb_transaction pkt;
  
  forever begin
    wait(pkt_queue.size() > 0);
    pkt = pkt_queue.pop_front();
    
    if (pkt.PWRITE) begin
      expected_mem[pkt.PADDR] = pkt.PWDATA;
      `uvm_info("SCOREBOARD--------WRITE", $sformatf("WRITE: Addr = %0h, Data = %0d", pkt.PADDR, pkt.PWDATA), UVM_MEDIUM);
    end else begin
      if (expected_mem[pkt.PADDR] !== pkt.PRDATA) begin
        `uvm_error("SCOREBOARD----------MATCH", $sformatf("Mismatch at Addr = %0h, Expected = %0h, Received = %0h", pkt.PADDR, expected_mem[pkt.PADDR], pkt.PRDATA));
      end else begin
        `uvm_info("SCOREBOARD---------MISMATCH", $sformatf("READ MATCH: Addr = %0h, Data = %0h", pkt.PADDR, pkt.PRDATA), UVM_MEDIUM);
      end
      end
    end
  endtask
endclass


