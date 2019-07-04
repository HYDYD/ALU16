module 2_4decoder(A1,A2,dout1,dout2,dout3,dout4);
input A1,A2;
output reg dout1,dout2,dout3,dout4;
always @(A1,A2)
begin
	case({A1,A2})
		2'b00:dout1=1'b1;
		2'b01:dout2=1'b1;
		2'b10:dout3=1'b1;
		2'b11:dout4=1'b1;
    default:;
	endcase
end
	
endmodule