class my_itemI extends uvm_sequence_item;
  `uvm_object_utils(my_itemI)
  logic q, qreg;
    
  function new(string name="");
    super.new(name);
  endfunction
  
  function logic get_qreg();
    return qreg;
  endfunction
endclass
