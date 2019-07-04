module decoder7(data_in, data_out);
	input[3:0] data_in;
	output[7:0] data_out;
	reg[7:0] data_out;
	always@(data_in)
	begin
		case(data_in)
		4'b0000:data_out=8'b01000000;
		4'b0001:data_out=8'b01111001;
		4'b0010:data_out=8'b00100100;
		4'b0011:data_out=8'b00110000;
		4'b0100:data_out=8'b00011001;
		4'b0101:data_out=8'b00010010;
		4'b0110:data_out=8'b00000011;
		4'b0111:data_out=8'b01111000;
		4'b1000:data_out=8'b00000000;
		4'b1001:data_out=8'b00011000;
		default:data_out=8'b01111111;
		endcase
	end
endmodule 