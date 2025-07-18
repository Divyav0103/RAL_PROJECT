class slv_reg2 extends uvm_reg;
  `uvm_object_utils(slv_reg2)
  rand uvm_reg_field reg2;

  function new(string name="slv_reg2");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    reg2 = uvm_reg_field::type_id::create("reg2");
    reg2.configure(this, 32, 0, "RW", 0,  32'h1234_9876, 1, 1, 1);
  endfunction
endclass

