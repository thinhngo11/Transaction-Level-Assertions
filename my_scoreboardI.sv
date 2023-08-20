class my_scoreboardI extends uvm_scoreboard;
  `uvm_component_utils(my_scoreboardI)
  uvm_analysis_imp #(my_itemI, my_scoreboardI) m_export;

  function new(string name="my_scoreboard", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_export = new("m_export", this);
  endfunction 
  
  virtual function void write(my_itemI m_itemI);
    if (m_itemI.q != m_itemI.qreg)
	`uvm_error("SCRB", "q not correct")
  endfunction
endclass
