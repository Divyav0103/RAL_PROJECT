

class temp_reg extends uvm_reg;
  `uvm_object_utils(temp_reg)
  
  rand uvm_reg_field temp;

covergroup apb_cov;
  option.per_instance = 1;

  // Address Coverage
  coverpoint tr.PADDR {
    bins addr_low = {[0:3]};
    bins addr_mid = {[4:10]};
    bins addr_high = {[11:15]};
  }

  // Write Data Coverage
  coverpoint tr.PWDATA {
    bins data_low = {[0:84]};
    bins data_mid = {[85:169]};
    bins data_high = {[170:255]};
  }

  // Read Data Coverage
  coverpoint tr.PRDATA {
    bins data_low = {[0:84]};
    bins data_mid = {[85:169]};
    bins data_high = {[170:255]};
  }

  // Control Signal Coverage (Write vs Read)
  coverpoint tr.PWRITE {
    bins read  = {0}; // Read transaction
    bins write = {1}; // Write transaction
  }

  // APB Transfer Control Coverage
  coverpoint tr.PSEL {
    bins active = {1}; // APB transfer active
  }

  coverpoint tr.PENABLE {
    bins enable = {1}; // APB enabled
  }

  // Cross Coverage
  cross tr.PWRITE, tr.PADDR;  // Read/Write vs Address
  cross tr.PWRITE, tr.PWDATA; // Read/Write vs Data In
  cross tr.PWRITE, tr.PRDATA; // Read/Write vs Data Out
  cross tr.PSEL, tr.PENABLE, tr.PWRITE; // APB handshake process
endgroup


