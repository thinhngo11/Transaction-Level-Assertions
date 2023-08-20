class my_monitorI extends uvm_monitor;
  `uvm_component_utils(my_monitorI)
  uvm_analysis_port #(my_itemI) m_port;
  my_itemI m_itemI;
  
  virtual my_ifI vifI;

  function new(string name="my_monitorI", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_port = new("m_port", this);
    if (!uvm_config_db#(virtual my_ifI)::get(this, "", "vifI", vifI))
      `uvm_fatal("VIF", "can't get vifI")
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    //m_itemI = my_itemI::type_id::create("m_itemI");
    m_itemI = new();
    
    forever begin
      @(posedge vifI.clk);
      m_itemI.q = vifI.q;
      m_itemI.qreg = vifI.qreg;
      m_port.write(m_itemI);
      vifI.m_itemI = m_itemI;
    end
  endtask
endclass
