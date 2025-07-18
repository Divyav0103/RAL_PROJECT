class apb_adapter extends uvm_reg_adapter;
  `uvm_object_utils (apb_adapter)

  function new (string name = "apb_adapter");
    super.new (name);
  endfunction

  function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    apb_transaction apb;
    apb = apb_transaction::type_id::create("apb");
    apb.pwrite = (rw.kind == UVM_WRITE) ? 1'b1 : 1'b0;
    apb.paddr = rw.addr;
    apb.pwdata = rw.data;
    return apb;
  endfunction

function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
  apb_transaction apb;
  assert($cast(apb, bus_item));

  rw.kind = (apb.pwrite == 1'b1) ? UVM_WRITE : UVM_READ;
  rw.data = (apb.pwrite == 1'b1) ? apb.pwdata : apb.prdata;
  rw.addr = apb.paddr;
  rw.status = UVM_IS_OK;
endfunction
endclass
