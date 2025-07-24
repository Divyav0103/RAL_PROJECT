class apb_driver extends uvm_driver#(apb_transaction);
  `uvm_component_utils(apb_driver)

  virtual ral_if vif;
  apb_transaction tr;

  function new(string name = "apb_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual ral_if)::get(this, "", "vif", vif))
      `uvm_error("DRV", "Unable to access interface");
  endfunction

  virtual task run_phase(uvm_phase phase);
    tr = apb_transaction::type_id::create("tr");
    forever begin
      seq_item_port.get_next_item(tr);
      drive(tr);
      seq_item_port.item_done();
    end
  endtask

  task drive(apb_transaction tr);
    if(tr.pwrite == 1'b1) begin
    @(posedge vif.PCLK);
    vif.PRESETn <= 1'b1;
    vif.PSEL <= 1'b1;
    vif.PWDATA <= tr.PWDATA;
    vif.PWRITE <= 1'b1;
    vif.PADDR <= tr.PADDR;
    
    repeat(2) @(posedge vif.PCLK);
    vif.PENABLE <= 1'b1;
    `uvm_info("DRV", $sformatf("Data Write -> Wdata : %0h",vif.PWADTA),UVM_NONE);
    
    @(posedge vif.PCLK);
      vif.PSEL = 1'b0;
      vif.PENABLE <= 1'b0;
   end else begin
      
      @(posedge vif.PCLK);
         vif.PSEL    <= 1'b1;
         vif.PADDR   <= tr.PADDR;
         vif.PWRITE  <= 1'b0;
         repeat(2)@(posedge vif.clk);
         vif.PENABLE <= 1'b1;
         `uvm_info("DRV", $sformatf("Data READ -> read data : %0h",vif.PRDATA,UVM_NONE);
      @(posedge vif.PCLK);
         vif.PSEL <= 1'b0;
         vif.PENABLE <=1'b0;
         tr.PRDATA = vif.PRDATA;
      end
  `uvm_info("drv",$sformatf("-----------------------------------DRIVER DONE--------------------"), UVM_LOW);
   endtask
endclass

