class slv_reg4 extends uvm_reg;
  `uvm_object_utils(slv_reg4)
  rand uvm_reg_field reg4;

  function new(string name="slv_reg4");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build();
    reg4 = uvm_reg_field::type_id::create("reg4");
    reg4.configure(this, 32, 0, "RW", 0, 32'h0000_FFFF, 1, 1, 1);
  endfunction
endclass

