class slv_reg3 extends uvm_reg;
  `uvm_object_utils(slv_reg3)
  rand uvm_reg_field reg3;

  function new(string name="slv_reg3");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    reg3 = uvm_reg_field::type_id::create("reg3");
    reg3.configure(this, 32, 0, "RW", 0,  32'h5A5A_5555, 1, 1, 1);
  endfunction
endclass
