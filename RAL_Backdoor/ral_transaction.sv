class apb_transaction extends uvm_sequence_item;
  
  rand bit PWRITE;
  rand bit PSEL;
  rand bit PENABLE;
  rand bit [31:0] PADDR;
  rand bit [31:0] PWDATA;
       bit [31:0] PRDATA;
  
  `uvm_object_utils(apb_transaction)

  function new(string name = "apb_transaction");
    super.new(name);
  endfunction

  constraint c0{PADDR inside {0, 4, 8, 12, 16};}
endclass

