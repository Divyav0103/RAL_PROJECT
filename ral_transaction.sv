class apb_transaction extends uvm_sequence_item;
  //`uvm_object_utils(apb_transaction)

  rand bit PWRITE;
  rand bit PSEL;
  rand bit PENABLE;
  rand bit [3:0] PADDR;
  rand bit [31:0] PWDATA;
       bit [31:0] PRDATA;
  
  `uvm_object_utils_begin(apb_transaction)
  `uvm_field_int(PWRITE, UVM_ALL_ON)
  `uvm_field_int(PSEL, UVM_ALL_ON)
  `uvm_field_int(PENABLE, UVM_ALL_ON)
  `uvm_field_int(PADDR, UVM_ALL_ON)
  `uvm_field_int(PWDATA, UVM_ALL_ON)
  `uvm_field_int(PRDATA, UVM_ALL_ON)
  `uvm_object_utils_end
  

  function new(string name = "apb_transaction");
    super.new(name);
  endfunction
endclass

