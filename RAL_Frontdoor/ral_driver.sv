class apb_driver extends uvm_driver#(apb_transaction);
  `uvm_component_utils(apb_driver)

  virtual ral_if vif;
  apb_transaction tr;

  function new(string name = "apb_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual ral_if.drv_cb)::get(this, "", "vif", vif))
      `uvm_error("DRV", "Unable to access interface");
  endfunction

  virtual task run_phase(uvm_phase phase);
    tr = apb_transaction::type_id::create("tr");
    vif.drv_cb.psel    <= 1'b0;
    vif.drv_cb.penable <= 1'b0;
    vif.drv_cb.pwrite  <= 1'b0;
    vif.drv_cb.paddr   <= 32'h0;
    vif.drv_cb.pwdata  <= 32'h0;
    
    forever begin
      seq_item_port.get_next_item(tr);
      drive(tr);
      seq_item_port.item_done();
    end
  endtask

  task drive(apb_transaction tr);
    if(tr.PWRITE == 1'b1) begin
      @(vif.drv_cb);
      vif.PRESETn <= 1'b1;
      vif.drv_cb.PSEL <= 1'b1;
      vif.drv_cb.PWDATA <= tr.PWDATA;
      vif.drv_cb.PWRITE <= 1'b1;
      vif.drv_cb.PADDR <= tr.PADDR;
      
      repeat(2) @(vif.drv_cb);
      vif.drv_cb.PENABLE <= 1'b1;
      `uvm_info("DRV", $sformatf("Data Write -> Wdata : %0h",vif.PWDATA),UVM_NONE);
      
      @(vif.drv_cb);
      vif.drv_cb.PSEL = 1'b0;
      vif.drv_cb.PENABLE <= 1'b0;
    end else begin
      
     @(vif.drv_cb);
         vif.drv_cb.PSEL    <= 1'b1;
         vif.drv_cb.PADDR   <= tr.PADDR;
         vif.drv_cb.PWRITE  <= 1'b0;
     
     repeat(2)@(vif.drv_cb);
     vif.drv_cb.PENABLE <= 1'b1;
     `uvm_info("DRV", $sformatf("Data READ -> read data : %0h",vif.PRDATA),UVM_NONE);
     @(vif.drv_cb);
         vif.drv_cb.PSEL <= 1'b0;
         vif.drv_cb.PENABLE <=1'b0;
         tr.PRDATA = vif.drv_cb.PRDATA;
      end
    `uvm_info("drv",$sformatf("-----------------------------------DRIVER DONE--------------------"), UVM_LOW);
  endtask
endclass
