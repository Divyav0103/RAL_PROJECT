class apb_monitor extends uvm_monitor;
  `uvm_component_utils(apb_monitor)
  uvm_analysis_port #(apb_transaction) mon_ap;
  virtual ral_if vif;
  
  apb_transaction tr;
  
  function new(string name="apb_monitor", uvm_component parent);
    super.new(name, parent);
  endfunction
    
  function void build_phase(uvm_phase phase);
    mon_ap = new("mon_ap",this);
    if(!uvm_config_db#(virtual ral_if)::get(this,"","vif",vif))
      `uvm_error("MON","Error getting interface handle")
  endfunction:build_phase

  virtual task run_phase(uvm_phase phase);
    apb_transaction tr;
    tr = apb_transaction::type_id::create("tr");

  forever begin
      repeat(3) @(posedge vif.PCLK); // Sync with APB clock
      tr.PWRITE = vif.PWRITE;
      tr.PADDR = vif.PADDR;
      tr.PWDATA = vif.PWDATA;
      tr.PRDATA = vif.PRDATA;
    
    `uvm_info("MON", $sformatf("PWRITE :%b PADDR : %0d PWDATA:%0d PRDATA:%0d", tr.PWRITE, tr.PADDR, tr.PWDATA, tr.PRDATA), UVM_NONE);
    mon_ap.write(tr);
    `uvm_info("MON",$sformatf("---------------------------------MONITOR DONE--------------------------------------------"),UVM_LOW);
  end
 endtask
endclass

