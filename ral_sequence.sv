class frontdoor_reg_seq extends uvm_sequence;
  `uvm_object_utils(frontdoor_reg_seq)

  apb_reg_block regmodel;

  function new(string name = "apb_reg_seq");
    super.new(name);
  endfunction

  task body;
    uvm_status_e status;
    bit [31:0] rdata, rdata_m, dout_t;
    $display("------------------------------------------------------------ctrl1--------------------------------------------------");
    rdata = regmodel.ctrl1.get();
    rdata_m = regmodel.ctrl1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("ctrl1 Initial Value -> Desired Value : %0d and Mirrored Value : %0d", rdata, rdata_m),UVM_NONE);
    
    regmodel.ctrl1.set(5'hf); 
    rdata = regmodel.ctrl1.get();
    rdata_m = regmodel.ctrl1.get_mirrored_value();
 
    `uvm_info("SEQ", $sformatf("ctrl1 After update -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m, dout_t), UVM_NONE);

    regmodel.ctrl1.write(status,5'hf);
    rdata   = regmodel.ctrl1.get();
    rdata_m = regmodel.ctrl1.get_mirrored_value();

    `uvm_info("SEQ", $sformatf("ctrl1 After write -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);
    regmodel.ctrl1.read(status,dout_t);
    rdata   = regmodel.ctrl1.get();
    rdata_m = regmodel.ctrl1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("ctrl1 After read  -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);

    $display("------------------------------------------------------------R1--------------------------------------------------");
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg1 Initial Value -> Desired Value : %0d and Mirrored Value : %0d", rdata, rdata_m),UVM_NONE);
    
    regmodel.r1.set(32'hffffffff); 
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
 
    `uvm_info("SEQ", $sformatf("Reg1 After update -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m, dout_t), UVM_NONE);

    regmodel.r1.write(status,32'hffffffff);
    rdata   = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();

    `uvm_info("SEQ", $sformatf("Reg1 After write -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);
    regmodel.r1.read(status,dout_t);
    rdata   = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg1 After read  -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);

    $display("------------------------------------------------------------R2--------------------------------------------------");
 
    rdata = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg2 Initial Value -> Desired Value : %0d and Mirrored Value : %0d", rdata, rdata_m), 
UVM_NONE);
    
    regmodel.r2.set(32'hAAAAAAAA); 
    rdata = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
 
    `uvm_info("SEQ", $sformatf("Reg2 After update -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m, dout_t), UVM_NONE);

    regmodel.r2.write(status,32'hAAAAAAAA);
    rdata   = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();

    `uvm_info("SEQ", $sformatf("Reg2 After write -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);
    regmodel.r2.read(status,dout_t);
    rdata   = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg2 After read  -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);

    $display("------------------------------------------------------------R3-------------------------------------------------");
    rdata = regmodel.r3.get();
    rdata_m = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg3 Initial Value -> Desired Value : %0d and Mirrored Value : %0d", rdata, rdata_m),UVM_NONE);
    
    regmodel.r3.set(32'hffffffff); 
    rdata = regmodel.r3.get();
    rdata_m = regmodel.r3.get_mirrored_value();
 
    `uvm_info("SEQ", $sformatf("Reg3 After update -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m, dout_t), UVM_NONE);

    regmodel.r3.write(status,32'hffffffff);
    rdata   = regmodel.r3.get();
    rdata_m = regmodel.r3.get_mirrored_value();

    `uvm_info("SEQ", $sformatf("Reg3 After write -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);
    regmodel.r3.read(status,dout_t);
    rdata   = regmodel.r3.get();
    rdata_m = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg3 After read  -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);

   
    $display("-------------------------------------------------------------R4--------------------------------------------------");
    rdata = regmodel.r4.get();
    rdata_m = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg4 Initial Value -> Desired Value : %0d and Mirrored Value : %0d", rdata, rdata_m),UVM_NONE);
    
    regmodel.r4.set(32'h3C3C3C3C); 
    rdata = regmodel.r4.get();
    rdata_m = regmodel.r4.get_mirrored_value();
 
    `uvm_info("SEQ", $sformatf("Reg4 After update -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m, dout_t), UVM_NONE);

    regmodel.r4.write(status,32'h3C3C3C3C);
    rdata   = regmodel.r4.get();
    rdata_m = regmodel.r4.get_mirrored_value();

    `uvm_info("SEQ", $sformatf("Reg4 After write -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);
    regmodel.r4.read(status,dout_t);
    rdata   = regmodel.r4.get();
    rdata_m = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Reg4 After read  -> Desired: %0d, Mirrored: %0d, Read: %0d", rdata, rdata_m,dout_t), UVM_NONE);

endtask
endclass

////////////////////////////////////////////////////////////////////////RESET VALUE///////////////////////////////////////////////////
class top_reg_seq extends uvm_sequence;
  `uvm_object_utils(top_reg_seq)
  apb_reg_block regmodel;
  
  function new (string name = "top_reg_seq"); 
    super.new(name);
  endfunction
    
  task body;
    uvm_status_e status;
    bit [31:0] rdata,rdata_m;
    bit [31:0] rst_reg;
    bit rst_status;
    
    //////Check if R1 register has reset value
    $display("-------------------------------------------------------------R1--------------------------------------------------");
    rst_status = regmodel.r1.has_reset();
    `uvm_info("SEQ", $sformatf("R1 Reset Value added : %0h ", rst_status), UVM_NONE);
    
    //////accessing default reset value of R1
    rst_reg = regmodel.r1.get_reset();
    `uvm_info("SEQ", $sformatf("R1 Register Reset Value : %0h ", rst_reg), UVM_NONE);
    
    ////////////////accessing mir and des before rst of R1
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R1 Before Reset -> Mir : %0h Des : %0h ", rdata_m, rdata), UVM_NONE);
    
    ///////////////mir and des value after rst of R1
    $display("--------------Applying Reset to register model R1 ---------------");
    regmodel.r1.reset();
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R1 After Reset -> Mir : %0h Des : %0h ", rdata_m, rdata), UVM_NONE);

     //////Check if R2 register has reset value
    $display("-------------------------------------------------------------R2--------------------------------------------------");
    rst_status = regmodel.r2.has_reset();
    `uvm_info("SEQ", $sformatf("R2 Reset Value added : %0h ", rst_status), UVM_NONE);
    
    //////accessing default reset value of R2
    rst_reg = regmodel.r2.get_reset();
    `uvm_info("SEQ", $sformatf("R2 Register Reset Value : %0h ", rst_reg), UVM_NONE);
    
    ////////////////accessing mir and des before rst of R2
    rdata = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R2 Before Reset -> Mir : %0h Des : %0h ", rdata_m, rdata), UVM_NONE);
    
    ///////////////mir and des value after rst of R2
    $display("--------------Applying Reset to register model R2---------------");
    regmodel.r2.reset();
    rdata = regmodel.r2.get();
    rdata_m = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R2 After Reset -> Mir : %0h Des : %0h ", rdata_m, rdata), UVM_NONE);

     //////Check if R3 register has reset value
    $display("-------------------------------------------------------------R3--------------------------------------------------");
    rst_status = regmodel.r3.has_reset();
    `uvm_info("SEQ", $sformatf("R3 Reset Value added : %0h ", rst_status), UVM_NONE);
    
    //////accessing default reset value of R3
    rst_reg = regmodel.r3.get_reset();
    `uvm_info("SEQ", $sformatf("R3 Register Reset Value : %0h ", rst_reg), UVM_NONE);
    
    ////////////////accessing mir and des before rst of R2
    rdata = regmodel.r3.get();
    rdata_m = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R3 Before Reset -> Mir : %0h Des : %0h ", rdata_m, rdata), UVM_NONE);
    
    ///////////////mir and des value after rst of R3
    $display("--------------Applying Reset to register model R3---------------");
    regmodel.r3.reset();
    rdata = regmodel.r3.get();
    rdata_m = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R3 After Reset -> Mir : %0h Des : %0h ", rdata_m, rdata), UVM_NONE);

       //////Check if R4 register has reset value
    $display("-------------------------------------------------------------R4--------------------------------------------------");
    rst_status = regmodel.r4.has_reset();
    `uvm_info("SEQ", $sformatf("R4 Reset Value added : %0h ", rst_status), UVM_NONE);
    
    //////accessing default reset value of R4
    rst_reg = regmodel.r4.get_reset();
    `uvm_info("SEQ", $sformatf("R4 Register Reset Value : %0h ", rst_reg), UVM_NONE);
    
    ////////////////accessing mir and des before rst of R4
    rdata = regmodel.r4.get();
    rdata_m = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R4 Before Reset -> Mir : %0h Des : %0h ", rdata_m, rdata), UVM_NONE);
    
    ///////////////mir and des value after rst of R4
    $display("--------------Applying Reset to register model R4---------------");
    regmodel.r4.reset();
    rdata = regmodel.r4.get();
    rdata_m = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("R4 After Reset -> Mir : %0h Des : %0h ", rdata_m, rdata), UVM_NONE);
  endtask
endclass

/*
class top_reg_seq extends uvm_sequence;
  `uvm_object_utils(top_reg_seq)
  apb_reg_block regmodel;
 
  function new (string name = "top_reg_seq");
    super.new(name);
  endfunction
 
  task body;
    uvm_status_e status;
    uvm_reg_data_t dv, mv, dout, rst_reg;
    bit rst_status;
 
    // Check if reset value is defined in the RAL
    rst_status = regmodel.r4.has_reset();
    `uvm_info("SEQ", $sformatf("Reset value present in RAL model: %0b", rst_status), UVM_LOW);
 
    // Get reset value from RAL model
    rst_reg = regmodel.r4.get_reset();
    `uvm_info("SEQ", $sformatf("Configured RAL reset value for reg4: 0x%08h", rst_reg), UVM_LOW);
 
    // Print values before reset
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Before reset -> Desired: 0x%08h, Mirrored: 0x%08h", dv, mv), UVM_LOW);
 
    // Apply reset in the RAL model
    $display("---------- Applying reset to REG4  ------------");
    regmodel.r4.reset();  // updates desired value in RAL to reset
 
    // Read the value from the DUT and update mirror
    regmodel.r4.mirror(status, UVM_CHECK, UVM_FRONTDOOR);
 
    if (status != UVM_IS_OK) begin
      `uvm_error("SEQ", "Frontdoor mirror failed  check bus transaction or address mapping.");
    end
 
    // Fetch values after reset and DUT read
    dv = regmodel.r4.get();                 // Desired (reset) value from RAL model
    mv = regmodel.r4.get_mirrored_value();  // Value read from DUT via mirror
    dout = mv;                              // Alias for clarity
 
    `uvm_info("SEQ", $sformatf("After reset -> Desired: 0x%08h, Mirrored (DUT): 0x%08h", dv, dout), UVM_LOW);
 
    // Compare actual DUT value with expected reset value
    if (dout !== rst_reg) begin
      `uvm_error("SEQ", $sformatf("Reset mismatch: DUT read = 0x%08h, Expected (RAL) = 0x%08h", dout, rst_reg));
    end else begin
      `uvm_info("SEQ", "Reset verification for REG4 passed!", UVM_LOW);
    end
  endtask
endclass*/
///////////////////////////////////////////////////////////////////////////BACKDOOR ACCESS////////////////////////////////////////////
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
