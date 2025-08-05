class apb_reg_seq extends uvm_sequence;
  `uvm_object_utils(apb_reg_seq)

  apb_reg_block regmodel;

  function new(string name = "apb_reg_seq");
    super.new(name);
  endfunction

  task body;
    uvm_status_e status;
    bit [31:0] rdata, rdata_m, dout_t;

    $display("------------------------------------------------------------R1--------------------------------------------------");
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

    $display("------------------------------------------------------------R2--------------------------------------------------");
 
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

    $display("------------------------------------------------------------R3-------------------------------------------------");
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

   
    $display("-------------------------------------------------------------R4--------------------------------------------------");
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

///////////////////////////////////////////////RESET VALUE/////////////////////////////////////////////////////////////////////////////
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
//////Check if register has reset value
rst_status = regmodel.r3.has_reset();
`uvm_info("SEQ", $sformatf("Reset Value added : %0h ", rst_status), UVM_NONE);
//////accessing default reset value
rst_reg = regmodel.r3.get_reset();
`uvm_info("SEQ", $sformatf("Register Reset Value : %0h ", rst_reg), UVM_NONE);
////////////////accessing mir and des before rst
rdata = regmodel.r3.get();
rdata_m = regmodel.r3.get_mirrored_value();
`uvm_info("SEQ", $sformatf("Before Reset -> Mir : %0h Des : %0h ", rdata_m, rdata), UVM_NONE);
///////////////mir and des value after rst
$display("--------------Applying Reset to register model ---------------");
regmodel.r3.reset();
rdata = regmodel.r3.get();
rdata_m = regmodel.r3.get_mirrored_value();
`uvm_info("SEQ", $sformatf("After Reset -> Mir : %0h Des : %0h ", rdata_m, rdata), UVM_NONE);
endtask
endclass

///////////////////////////////////////////////////////BACKDOOR ACCESS/////////////////////////////////////////////////////////////////
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
