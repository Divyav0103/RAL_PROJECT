class apb_coverage extends uvm_subscriber#(apb_transaction);
  `uvm_component_utils(apb_coverage)

  virtual ral_if vif;

  covergroup apb_cg @(posedge vif.PCLK);
    option.per_instance = 1;

    cp_addr: coverpoint vif.PADDR {
      bins ctrl     = {32'h0};
      bins reg1     = {32'h4};
      bins reg2     = {32'h8};
      bins reg3     = {32'hC};
      bins reg4     = {32'h10};
      bins others   = default;
    }

    cp_write: coverpoint vif.PWRITE {
      bins write = {1};
      bins read  = {0};
    }

    cp_rw_cross: cross cp_addr, cp_write;

  endgroup

  function new(string name, uvm_component parent);
    super.new(name, parent);
    apb_cg = new;
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual ral_if)::get(this, "", "vif", vif)) begin
      `uvm_error("COV", "Unable to get interface for coverage")
    end
  endfunction

  virtual function void write(apb_transaction t);
    apb_cg.sample();
  endfunction

endclass



