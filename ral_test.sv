class apb_test extends uvm_test;
  `uvm_component_utils(apb_test)

  function new(input string inst = "apb_test", uvm_component c);
    super.new(inst, c);
  endfunction

  apb_env env;
  apb_reg_seq trseq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = apb_env::type_id::create("apb_env", this);
    trseq = apb_reg_seq::type_id::create("trseq");
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    trseq.regmodel = env.regmodel;
    trseq.start(env.agent_inst.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask
endclass

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class apb_reset_test extends uvm_test;
  `uvm_component_utils(apb_reset_test)

  function new(input string inst = "apb_reset_test", uvm_component c);
    super.new(inst, c);
  endfunction

  apb_env env;
  top_reg_seq trseq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = apb_env::type_id::create("apb_env", this);
    trseq = top_reg_seq::type_id::create("trseq");
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    trseq.regmodel = env.regmodel;
    trseq.start(env.agent_inst.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask
endclass

