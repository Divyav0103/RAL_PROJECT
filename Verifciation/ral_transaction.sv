class apb_transaction extends uvm_sequence_item;
  `uvm_object_utils(apb_transaction)

  rand bit PWRITE;
  rand bit PSEL;
  rand bit PENABLE;
  rand bit [3:0] PADDR;
  rand bit [31:0] PWDATA;
       bit [31:0] PRDATA;

  function new(string name = "apb_transaction");
    super.new(name);
  endfunction
endclass

