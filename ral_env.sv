class apb_env extends uvm_env;
  apb_agent agent_inst;
  apb_reg_block regmodel;
  apb_adapter adapter_inst;
  apb_scoreboard sc;
  `uvm_component_utils(apb_env)

  function new(string name = "apb_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  // build_phase - create the components
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent_inst = apb_agent::type_id::create("agent_inst", this);
    regmodel = apb_reg_block::type_id::create("regmodel", this);
    regmodel.build();
    adapter_inst = apb_adapter::type_id::create("adapter_inst", this);
    sc = apb_scoreboard::type_id::create("sc", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent_inst.mon.mon_ap.connect(sc.mon_port);
    regmodel.default_map.set_sequencer(.sequencer(agent_inst.seqr), .adapter(adapter_inst));
    regmodel.default_map.set_base_addr(32'h0000_0000); // APB Base Address
  endfunction
endclass
