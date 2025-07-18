
class slv_reg1 extends uvm_reg;
  `uvm_object_utils(slv_reg1)
  rand uvm_reg_field reg1;

  function new(string name="slv_reg1");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    reg1 = uvm_reg_field::type_id::create("reg1");
    reg1.configure(this, 32, 0, "RW", 0, 32'hA5A5_0000, 1, 1, 1);

  endfunction
endclass


