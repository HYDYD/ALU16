module seg_decoder(iflag,iA,oY);
input iflag;
input[3:0] iA;
output reg[7:0] oY;

always@(iflag,iA)
begin
	case(iA)
		4'b0000:oY=8'h3f;
		4'b0001:oY=8'h06;
		4'b0010:oY=8'h5b;
		4'b0011:oY=8'h4f;
		4'b0100:oY=8'h66;
		4'b0101:oY=8'h6d;
		4'b0110:oY=8'h7d;
		4'b0111:oY=8'h27;
		4'b1000:oY=8'h7f;
		4'b1001:oY=8'h6f;
		4'b1010:oY=8'h77;
		4'b1011:oY=8'h7c;
		4'b1100:oY=8'h58;
		4'b1101:oY=8'h5e;
		4'b1110:oY=8'h79;
		4'b1111:oY=8'h71;
	endcase
	if(!iflag)
		oY=~oY;
end
endmodule 