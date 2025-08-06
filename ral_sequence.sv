class backdoor_reg_seq extends uvm_sequence;
  `uvm_object_utils(backdoor_reg_seq)
  apb_reg_block regmodel;
  uvm_reg_data_t read_data;
  
  function new (string name = "backdoor_reg_seq"); 
    super.new(name);
  endfunction
    
  task body;
    uvm_status_e status;
    bit [31:0] rdata;
    bit [31:0] des, mir;
    
    $display("-------------------------------------------------------------R1--------------------------------------------------");
    regmodel.r1.poke(status, 8'h55);
    des = regmodel.r1.get();
    mir = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R1 Write -> Des: %0d Mir: %0d", des, mir), UVM_NONE);
    
    regmodel.r1.peek(status, rdata);
    `uvm_info(get_type_name(),$sformatf("R1 READ : %0d",rdata),UVM_LOW);
    des = regmodel.r1.get();
    mir = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R1 Des: %0d Mir: %0d", des, mir), UVM_NONE);
    
    $display("---------------------------------------------------------R2-------------------------------------------------------");
    regmodel.r2.poke(status, 8'hAA);
    des = regmodel.r2.get();
    mir = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R2 Write -> Des: %0d Mir: %0d", des, mir), UVM_NONE);
    
    regmodel.r2.peek(status, rdata);
    `uvm_info(get_type_name(),$sformatf("R2 READ : %0d",rdata),UVM_LOW);
    des = regmodel.r2.get();
    mir = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R2 Des: %0d Mir: %0d", des, mir), UVM_NONE);
    
    $display("---------------------------------------------------------R3-------------------------------------------------------");
    regmodel.r3.poke(status, 8'hFF);
    des = regmodel.r3.get();
    mir = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R3 Write -> Des: %0d Mir: %0d", des, mir), UVM_NONE);
    
    regmodel.r3.peek(status, rdata);
    `uvm_info(get_type_name(),$sformatf("R3 READ : %0d",rdata),UVM_LOW);
    des = regmodel.r3.get();
    mir = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R3 Des: %0d Mir: %0d", des, mir), UVM_NONE);
    
    $display("---------------------------------------------------------R4-------------------------------------------------------");
    regmodel.r4.poke(status, 8'h3C);
    des = regmodel.r4.get();
    mir = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R4 Write -> Des: %0d Mir: %0d", des, mir), UVM_NONE);
    
    regmodel.r4.peek(status, rdata);
    `uvm_info(get_type_name(),$sformatf("R4 READ : %0d",rdata),UVM_LOW);
    des = regmodel.r4.get();
    mir = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R4 Des: %0d Mir: %0d", des, mir), UVM_NONE);
 
 endtask
endclass
