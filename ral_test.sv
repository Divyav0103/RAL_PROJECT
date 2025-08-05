class apb_test extends uvm_test;
  `uvm_component_utils(apb_test)

  apb_env env;
  apb_reg_sequence seq;
  
  function new(string name = "apb_test", uvm_component parent);
    super.new(name, parent);
  endfunction	
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = apb_env::type_id::create("env", this);
    seq = apb_sequence::type_id::create("seq", this);
  endfunction
 
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    seq.regmodel = env.regmodel;
    phase.raise_objection(this);
    seq.start(env.agent_inst.seqr);
    phase.drop_objection(this);
  endtask
endclass

class apb_frontdoor_test extends uvm_test;
  `uvm_component_utils(apb_frontdoor_test)

  function new(input string inst = "apb_frontdoor_test", uvm_component c);
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
////////////////////////////////////////////////////////////////////////////////////////////
class apb_backdoor_test extends uvm_test;
  `uvm_component_utils(apb_backdoor_test)

  function new(input string inst = "apb_backdoor_test", uvm_component c);
    super.new(inst, c);
  endfunction

  apb_env env;
  backdoor_reg_seq trseq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = apb_env::type_id::create("apb_env", this);
    trseq = backdoor_reg_seq::type_id::create("trseq");
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    trseq.regmodel = env.regmodel;
    trseq.start(env.agent_inst.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask
endclass

//////////////////////////////////////////////////////////////////////////////////////////
class reg_test extends apb_test;
  `uvm_component_utils(reg_test)
  
   apb_write0 pkt1;
   apb_write1 pkt2;
  
  function new(string name = "reg_test",uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
   super.build_phase(phase);
    pkt1 = apb_write0::type_id::create("pkt1", this);
    pkt2 = apb_write1::type_id::create("pkt2", this);
  endfunction

  virtual function void end_of_elaboration();
     uvm_top.print_topology();
  endfunction

  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection (this);
    pkt1.start(env.a_agent.seqr); 
    phase.drop_objection (this);
    phase.phase_done.set_drain_time(this,100);

    phase.raise_objection (this);
    pkt2.start(env.a_agent.seqr); 
    phase.drop_objection (this);
    phase.phase_done.set_drain_time(this,100);

    phase.raise_objection (this);
    pkt10.start(env.a_agent.seqr); 
    phase.drop_objection (this);
    phase.phase_done.set_drain_time(this,100);
  endtask
endclass
