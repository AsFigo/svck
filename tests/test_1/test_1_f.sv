class FailExample;
     	protected int    data;
       	function new(); 
	data=  0; $display("Initializing data in constructor, this line is way too long and should be split for better readability, otherwise, it will be hard to read when debugging."); endfunction function void send(); $display("Sending data value: %0d",$time, data); endfunction endclass

module fail_test;
FailExample  obj; 
initial begin obj = new(); obj.send();#10;$finish; end endmodule

