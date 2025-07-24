class apb_reg_seq extends uvm_sequence;
  `uvm_object_utils(apb_reg_seq)

  apb_reg_block regmodel;

  function new(string name = "apb_reg_seq");
    super.new(name);
  endfunction

  task body;
    uvm_status_e status;
    bit [7:0] rdata, rdata_m, dout_t;
/*
    //////////////R1/////////////////////
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value : %0d and Mirrored Value : %0d", rdata, rdata_m), 
UVM_NONE);
    
    regmodel.r1.set(8'h55); 
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
 
    `uvm_info("SEQ", $sformatf("Reg1 After update -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m, dout_t), UVM_NONE);

    regmodel.r1.write(status,8'h55);
    rdata   = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();

    `uvm_info("SEQ", $sformatf("Reg1 After write -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);
    regmodel.r1.read(status,dout_t);
    rdata   = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg1 After read  -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);

 */
    /////////////////////////R2////////////
    rdata = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value : %0d and Mirrored Value : %0d", rdata, rdata_m), 
UVM_NONE);
    
    regmodel.r2.set(8'hAA); 
    rdata = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
 
    `uvm_info("SEQ", $sformatf("Reg1 After update -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m, dout_t), UVM_NONE);

    regmodel.r2.write(status,8'hAA);
    rdata   = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();

    `uvm_info("SEQ", $sformatf("Reg1 After write -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);
    regmodel.r2.read(status,dout_t);
    rdata   = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg1 After read  -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);
    
  endtask
endclass
