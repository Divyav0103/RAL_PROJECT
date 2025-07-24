class apb_reg_seq extends uvm_sequence;
  `uvm_object_utils(apb_reg_seq)

  apb_reg_block regmodel;

  function new(string name = "apb_reg_seq");
    super.new(name);
  endfunction

  task body;
    uvm_status_e     status;
    uvm_reg_data_t   rdata;
    uvm_reg_data_t   rdata_mirror;
    uvm_reg_data_t   dout_t;

    ///////////////// R1 ///////////////////////
    rdata = regmodel.r1.get();
    rdata_mirror = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R1 Initial -> Desired Value: %0d, Mirrored Value: %0d", rdata, rdata_mirror), UVM_NONE);

    regmodel.r1.set(8'h55);
    regmodel.r1.update(status);

    rdata = regmodel.r1.get();
    rdata_mirror = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R1 After Set -> Desired Value: %0d, Mirrored Value: %0d", rdata, rdata_mirror), UVM_NONE);
 
    regmodel.r1.write(status, 8'h05);
    regmodel.r1.read(status, dout_t);

    rdata = regmodel.r1.get();
    rdata_mirror = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R1 FINAL -> Des: %0d, Mirrored: %0d, Read data: %0d", rdata, rdata_mirror, dout_t), UVM_NONE);

    ///////////////// R2 ///////////////////////
    rdata = regmodel.r2.get();
    rdata_mirror = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R2 Initial -> Desired Value: %0d, Mirrored Value: %0d", rdata, rdata_mirror), UVM_NONE);

    regmodel.r2.set(8'hAA);
    regmodel.r2.update(status);

    rdata = regmodel.r2.get();
    rdata_mirror = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R2 After Set -> Desired Value: %0d, Mirrored Value: %0d", rdata, rdata_mirror), UVM_NONE);

    regmodel.r2.write(status, 8'h0F);
    regmodel.r2.read(status, dout_t);

    rdata = regmodel.r2.get();
    rdata_mirror = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R2 FINAL  -> Des: %0d, Mir: %0d, Data read: %0d", rdata, rdata_mirror, dout_t), UVM_NONE);

  endtask
endclass

