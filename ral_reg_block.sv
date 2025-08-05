class slv_ctrl extends uvm_reg;
  `uvm_object_utils(slv_ctrl)
  rand uvm_reg_field ctrl;

  function new(string name="slv_ctrl");
    super.new(name, 4, UVM_NO_COVERAGE);
  endfunction

  function void build();
    ctrl= uvm_reg_field::type_id::create("ctrl");
    ctrl.configure(this, 4, 0, "RW", 0, 0, 1, 1, 1);
 
  endfunction
endclass

class slv_reg1 extends uvm_reg;
  `uvm_object_utils(slv_reg1)
  rand uvm_reg_field reg1;

   ////coverpoint
  covergroup r1_cov;
    option.per_instance = 1;
    coverpoint reg1.value[7:0] {
//      bins lower = {[0:63]};
      bins mid = {[64:127]};}
  //    bins high = {[128:255]};}
  endgroup

  function new(string name="slv_reg1");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      r1_cov = new();
  endfunction
    
  virtual function void sample(uvm_reg_data_t data,uvm_reg_data_t byte_en,bit is_read,uvm_reg_map map);
    r1_cov.sample();
  endfunction
    
  virtual function void sample_values();
    super.sample_values();
    r1_cov.sample();
  endfunction

  function void build();
    reg1 = uvm_reg_field::type_id::create("reg1");
    reg1.configure(this, 32, 0, "RW", 0, 32'hA5A5_0000, 1, 1, 1);

  endfunction
endclass

class slv_reg2 extends uvm_reg;
  `uvm_object_utils(slv_reg2)
  rand uvm_reg_field reg2;
  
  ////coverpoint
  covergroup r2_cov;
    option.per_instance = 1;
    coverpoint reg2.value[7:0] {
    //  bins lower = {[0:63]};
    //  bins mid = {[64:127]};
      bins high = {[128:255]};}
  endgroup

  function new(string name="reg2");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      r2_cov = new();
  endfunction
    
  virtual function void sample(uvm_reg_data_t data,uvm_reg_data_t byte_en,bit is_read,uvm_reg_map map);
    r2_cov.sample();
  endfunction
    
  virtual function void sample_values();
    super.sample_values();
    r2_cov.sample();
  endfunction

  function void build();
    reg2 = uvm_reg_field::type_id::create("reg2");
    reg2.configure(this, 32, 0, "RW", 0,  32'h1234_9876, 1, 1, 1);
  endfunction
endclass

class slv_reg3 extends uvm_reg;
  `uvm_object_utils(slv_reg3)
  rand uvm_reg_field reg3;
  
  ////coverpoint
  covergroup r3_cov;
    option.per_instance = 1;
    coverpoint reg3.value[7:0]{
      //bins lower = {[0:63]};
      //bins mid = {[64:127]};
      bins high = {[128:255]};}
endgroup
    
  function new(string name="slv_reg3");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      r3_cov = new();  
   endfunction
    
  virtual function void sample(uvm_reg_data_t data,uvm_reg_data_t byte_en,bit is_read,uvm_reg_map map);
    r3_cov.sample();
  endfunction
    
  virtual function void sample_values();
    super.sample_values();
    r3_cov.sample();
  endfunction

  function void build();
    reg3 = uvm_reg_field::type_id::create("reg3");
    reg3.configure(this, 32, 0, "RW", 0,  32'h5A5A_5555, 1, 1, 1);
  endfunction
endclass

class slv_reg4 extends uvm_reg;
  `uvm_object_utils(slv_reg4)
  rand uvm_reg_field reg4;

   ////coverpoint
  covergroup r4_cov;
    option.per_instance = 1;
    coverpoint reg4.value[7:0]{
      bins lower = {[0:63]};}
     // bins mid = {[64:127]};
     // bins high = {[128:255]};}
endgroup

  function new(string name="slv_reg4");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      r4_cov = new();
  endfunction

  virtual function void sample(uvm_reg_data_t data,uvm_reg_data_t byte_en,bit is_read,uvm_reg_map map);
    r4_cov.sample();
  endfunction
  
  function void build();
    reg4 = uvm_reg_field::type_id::create("reg4");
    reg4.configure(this, 32, 0, "RW", 0, 32'h0000_FFFF, 1, 1, 1);
  endfunction
endclass

class apb_reg_block extends uvm_reg_block;
  `uvm_object_utils(apb_reg_block)
 
rand  slv_ctrl ctrl1;
rand  slv_reg1 r1;
rand  slv_reg2 r2;
rand  slv_reg3 r3;
rand  slv_reg4 r4;  
  
function new(string name="top_reg_block");
    super.new(name, UVM_NO_COVERAGE);
  endfunction

  function void build();
    ctrl1 = slv_ctrl::type_id::create("ctrl1");
    ctrl1.build();
    ctrl1.configure(this);

    r1 = slv_reg1::type_id::create("r1");
    r1.build();
    r1.configure(this);
    r1.add_hdl_path_slice("reg1",0, 32); 

    uvm_reg::include_coverage("*", UVM_CVR_ALL);
    r2 = slv_reg2::type_id::create("r2");
    r2.build();
    r2.configure(this);
    r2.set_coverage(UVM_CVR_FIELD_VALS);
    r2.add_hdl_path_slice("reg2",0, 32); 
    
    uvm_reg::include_coverage("*", UVM_CVR_ALL);
    r3 = slv_reg3::type_id::create("r3");
    r3.build();
    r3.configure(this);
    r3.set_coverage(UVM_CVR_FIELD_VALS);
    r3.add_hdl_path_slice("reg3",0, 32); 
    
    uvm_reg::include_coverage("*", UVM_CVR_ALL);
    r4 = slv_reg4::type_id::create("r4");
    r4.build();
    r4.configure(this);
    r4.set_coverage(UVM_CVR_FIELD_VALS);
    r4.add_hdl_path_slice("reg4",0, 32); 
    
    default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 0);
    default_map.add_reg(ctrl1, 'h0, "RW");
    default_map.add_reg(r1, 'h4, "RW");
    default_map.add_reg(r2, 'h8, "RW");
    default_map.add_reg(r3, 'hc, "RW");
    default_map.add_reg(r4, 'h10, "RW");    

    default_map.set_auto_predict(1);
    add_hdl_path("tb.dut", "RTL"); 

    lock_model();
  endfunction
endclass

module tb;
  top_reg_block t1;
  initial begin
    t1 = new("top_reg_block");
    t1.build();
  end
endmodule

