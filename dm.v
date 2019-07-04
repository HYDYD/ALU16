module dm( din, DMWr, clk, dout, overset);
   input  [15:0] din;
   input         DMWr;
   input         clk;
   output reg [15:0] dout; 
   output reg overset; 
   reg [15:0] dmem[9:0];//KB xiangdangyu128kuai
   reg [9:0]addr, head ;
   
   initial 
   begin
    addr=10'b0000000000;
    head=10'b0000000000;
    overset=1'b0;
   end
   
   always@(negedge clk )
   begin
	if(~clk)
	begin
		if(DMWr)
		begin
			//panyi
			if(addr>10)
			begin
				overset=1'b1;
			end
			else
			begin
				dmem[addr]= din;
				addr=addr+1'b1;
			end
        end 
    if(~DMWr)
    begin
		if(head<addr)
		begin
			dout= dmem[head];
			head= head+1'b1;
		end
		else 
		begin
			addr=10'b0000000000;
			dmem[addr]=16'h0000;
			head=10'b0000000000;
			dout= dmem[head];
			overset=1'b0;
		end
	end
  end
  end // end always
endmodule  