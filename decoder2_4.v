module decoder2_4(A1,A2,clk,dout1,dout2,dout3,dout4);
input A1,A2;
input clk;
output reg dout1,dout2,dout3,dout4;
always @(posedge clk)
begin
	case({A1,A2})
		2'b00:{dout1,dout2,dout3,dout4}=4'b1000;
		2'b01:{dout1,dout2,dout3,dout4}=4'b0100;
		2'b10:{dout1,dout2,dout3,dout4}=4'b0010;
		2'b11:{dout1,dout2,dout3,dout4}=4'b0001;
    default:;
	endcase
end
	
endmodule