`include "uvm_macros.svh"
import uvm_pkg::*;

class apb_reg_block extends uvm_reg_block;
  `uvm_object_utils(apb_reg_block)
 
  slv_ctrl ctrl1;
  slv_reg1 r1;
  slv_reg2 r2;
  slv_reg3 r3;
  slv_reg4 r4;
  
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

    r2 = slv_reg2::type_id::create("r2");
    r2.build();
    r2.configure(this);
    
    r3 = slv_reg3::type_id::create("r3");
    r3.build();
    r3.configure(this);
    
    r4 = slv_reg4::type_id::create("r4");
    r4.build();
    r4.configure(this);
    
    default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN);
    default_map.add_reg(ctrl1, 'h0, "RW");
    default_map.add_reg(r1, 'h4, "RW");
    default_map.add_reg(r2, 'h8, "RW");
    default_map.add_reg(r3, 'hc, "RW");
    default_map.add_reg(r4, 'h10, "RW");
    
    default_map.set_auto_predict(1);

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

