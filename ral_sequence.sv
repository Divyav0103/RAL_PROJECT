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

    //initial value of r1 (desired and mirrored)
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R1 Initial -> Desired Value: %0d, Mirrored Value: %0d", rdata, rdata_m), UVM_NONE);

    ///////////// update desired value
    regmodel.r1.set(8'h55);

    ///////////////// get desire value
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R1 After Set -> Desired Value: %0d, Mirrored Value: %0d", rdata, rdata_m), UVM_NONE);

    /// update() to write desired value to DUT and update mirror
    regmodel.r1.update(status);
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R1 After Tx to DUT -> Desired Value: %0d, Mirrored Value: %0d", rdata, rdata_m), UVM_NONE);

    ////////////////////////////////// R2 ////////////////////////////////////////
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
    `uvm_info("SEQ", $sformatf("R2 -> Desired Value: %0d, Mirrored Value: %0d", rdata, rdata_m), UVM_NONE);

  endtask
endclass

