  class apb_generator extends uvm_sequence #(apb_transaction);
  `uvm_object_utils(apb_generator)

  apb_transaction tr;

  function new(string name = "apb_generator");
    super.new(name);
  endfunction

  task body();
    tr = apb_transaction::type_id::create("tr");

    wait_for_grant();
    assert(tr.randomize());

    tr.PSEL = 1'b1;
    tr.PENABLE = 1'b0; // Setup phase

    `uvm_info("SEQ", $sformatf("APB TX: PADDR = %0d PWDATA = %0d PWRITE = %b", tr.PADDR, tr.PWDATA, tr.PWRITE), UVM_LOW);

    send_request(tr);
    
    tr.PENABLE = 1'b1; // Enable phase
    wait_for_item_done();
    get_response(tr);

    `uvm_info("SEQ", $sformatf("APB Response: PADDR = %0d PRDATA = %0d", tr.PADDR, tr.PRDATA), UVM_LOW);
  endtask
endclass


