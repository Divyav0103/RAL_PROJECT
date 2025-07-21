class apb_sequencer extends uvm_sequencer#(ral_transaction);
  `uvm_component_utils(apb_sequencer)
  function new(string name = "apb_sequencer",uvm_component parent);
    super.new(name, parent);
  endfunction
endclass
