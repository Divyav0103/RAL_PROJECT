class apb_reg_seq extends uvm_sequence;
  `uvm_object_utils(apb_reg_seq)

  apb_reg_block regmodel;

  function new(string name = "apb_reg_seq");
    super.new(name);
  endfunction

  task body;
    uvm_status_e status;
    bit [7:0] rdata;
    bit [7:0] rdata_m;
    bit [7:0] dout_t;

    ///////////////// R1 ///////////////////////
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R1 Initial -> Desired Value: %0d, Mirrored Value: %0d", rdata, rdata_m), UVM_NONE);

    regmodel.r1.set(8'h55);

    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R1 After Set -> Desired Value: %0d, Mirrored Value: %0d", rdata, rdata_m), UVM_NONE);

    regmodel.r1.update(status);
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R1 After Tx to DUT -> Desired Value: %0d, Mirrored Value: %0d", rdata, rdata_m), UVM_NONE);

    regmodel.r1.write(status, 8'h05);
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R1 Write Tx to DUT -> Des: %0d, Mir: %0d", rdata, rdata_m), UVM_NONE);

    regmodel.r1.read(status, dout_t);
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R1 Read Tx from DUT -> Des: %0d, Mir: %0d, Data read: %0d", rdata, rdata_m, dout_t), UVM_NONE);

    ///////////////// R2 ///////////////////////
    rdata = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R2 Initial -> Desired Value: %0d, Mirrored Value: %0d", rdata, rdata_m), UVM_NONE);

    regmodel.r2.set(8'hAA);

    rdata = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R2 After Set -> Desired Value: %0d, Mirrored Value: %0d", rdata, rdata_m), UVM_NONE);

    regmodel.r2.update(status);
    rdata = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R2 After Tx to DUT -> Desired Value: %0d, Mirrored Value: %0d", rdata, rdata_m), UVM_NONE);

    regmodel.r2.write(status, 8'h0F);
    rdata = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R2 Write Tx to DUT -> Des: %0d, Mir: %0d", rdata, rdata_m), UVM_NONE);

    regmodel.r2.read(status, dout_t);
    rdata = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R2 Read Tx from DUT -> Des: %0d, Mir: %0d, Data read: %0d", rdata, rdata_m, dout_t), UVM_NONE);

  endtask
endclass

