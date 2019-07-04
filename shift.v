    module shift(input[15:0] hex,output[15:0] hex_);
    always@(hex)
	begin
	if(hex[15]==0)
	begin
    hex_[15:0]=hex[15:0];
    end
    else
    begin
	hex_[14:0]=~hex[14:0]+1'b1;
	hex_[15:0]={1'b0,hex_[14:0]};//dulichufuhaowei
	end
	end
	endmodule 