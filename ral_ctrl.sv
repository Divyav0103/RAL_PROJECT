
class slv_ctrl extends uvm_reg;
  `uvm_object_utils(slv_ctrl)
  rand uvm_reg_field ctrl;

  function new(string name="slv_ctrl");
    super.new(name, 4, UVM_NO_COVERAGE);
  endfunction

  function void build();
    ctrl= uvm_reg_field::type_id::create("ctrl");
    ctrl.configure(this, 4, 0, "RW", 0, 0, 1, 1, 1);
 
  endfunction
endclass

