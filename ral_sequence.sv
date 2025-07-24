class apb_reg_seq extends uvm_sequence;
  `uvm_object_utils(apb_reg_seq)

  apb_reg_block regmodel;

  function new(string name = "apb_reg_seq");
    super.new(name);
  endfunction

  task body;
    uvm_status_e status;
    bit [7:0] rdata, rdata_m, dout_t;

    //////////////R1/////////////////////
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg1 Initial Value -> Desired Value : %0d and Mirrored Value : %0d", rdata, rdata_m), 
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

 
    /////////////////////////R2////////////
    rdata = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg2 Initial Value -> Desired Value : %0d and Mirrored Value : %0d", rdata, rdata_m), 
UVM_NONE);
    
    regmodel.r2.set(8'hAA); 
    rdata = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
 
    `uvm_info("SEQ", $sformatf("Reg2 After update -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m, dout_t), UVM_NONE);

    regmodel.r2.write(status,8'hAA);
    rdata   = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();

    `uvm_info("SEQ", $sformatf("Reg2 After write -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);
    regmodel.r2.read(status,dout_t);
    rdata   = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg2 After read  -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);

////////////////////////////R3///////////////////////////////    
    rdata = regmodel.r3.get();
    rdata_m = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg3 Initial Value -> Desired Value : %0d and Mirrored Value : %0d", rdata, rdata_m), 
UVM_NONE);
    
    regmodel.r3.set(8'hFF); 
    rdata = regmodel.r3.get();
    rdata_m = regmodel.r3.get_mirrored_value();
 
    `uvm_info("SEQ", $sformatf("Reg3 After update -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m, dout_t), UVM_NONE);

    regmodel.r3.write(status,8'hFF);
    rdata   = regmodel.r3.get();
    rdata_m = regmodel.r3.get_mirrored_value();

    `uvm_info("SEQ", $sformatf("Reg3 After write -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);
    regmodel.r3.read(status,dout_t);
    rdata   = regmodel.r3.get();
    rdata_m = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg3 After read  -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);

 //////////////////////R4/////////////////////////////////////
    rdata = regmodel.r4.get();
    rdata_m = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg4 Initial Value -> Desired Value : %0d and Mirrored Value : %0d", rdata, rdata_m), 
UVM_NONE);
    
    regmodel.r4.set(8'h3C); 
    rdata = regmodel.r4.get();
    rdata_m = regmodel.r4.get_mirrored_value();
 
    `uvm_info("SEQ", $sformatf("Reg4 After update -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m, dout_t), UVM_NONE);

    regmodel.r4.write(status,8'h3C);
    rdata   = regmodel.r4.get();
    rdata_m = regmodel.r4.get_mirrored_value();

    `uvm_info("SEQ", $sformatf("Reg4 After write -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);
    regmodel.r4.read(status,dout_t);
    rdata   = regmodel.r4.get();
    rdata_m = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg4 After read  -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);


endtask
endclass
