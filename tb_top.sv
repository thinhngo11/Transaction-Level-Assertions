`include "my_if.sv"
`include "my_ifI.sv"
`include "my_pkg.pkg"
module tb_top;
  import my_pkg::*;
  `include "test_lib.sv"
  
  bit clk, reset, d, enable, q, qbar;
  
  my_if vif();
  //my_ifI vifI();
  
  my_dut dut (.clk(vif.clk), .reset(vif.reset), .d(vif.d), 
              .enable(vif.enable), .q(vif.q));
   
  always #5 begin 
    vif.clk = ~vif.clk;
  	dut.dutvifI.clk = vif.clk;
  end
  
  initial vif.clk = 1'b0;
  
  initial begin
    uvm_config_db#(virtual my_if)::set(null, "*", "vif", vif);
    uvm_config_db#(virtual my_ifI)::set(null, "*", "vifI", dut.dutvifI);
    run_test("my_base_test");
  end
  
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_top);
  end
  
  bind dut my_ifI dutvifI();

endmodule
