module reuse(clk, ddd);
 input clk;
 output reg ddd;
 reg count = 0;
 always@(posedge clk)
 begin
 count=count+1;
 if (count==2)
  ddd=1'b1;
 end
 endmodule
	