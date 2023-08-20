`include "my_itemI.sv"
interface my_ifI;
  
  bit clk, q, qreg;
  my_itemI m_itemI;
  
  initial m_itemI = new();
  
  tlsva: assert property (@(posedge clk) q == m_itemI.get_qreg); 
    //$display("tlsva asserted"); else $display("tlsva failed");

endinterface
