class apb_agent extends uvm_agent;
  `uvm_component_utils(apb_agent)

  function new(input string inst = "apb_agent", uvm_component parent = null);
    super.new(inst, parent);
  endfunction

  apb_driver drv;
  apb_sequencer seqr;
  apb_monitor mon;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = apb_driver::type_id::create("drv", this);
    seqr = apb_sequencer::type_id::create("seqr", this);
    mon = apb_monitor::type_id::create("mon", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
endclass
