module ALU16(cin1, cin1_,cin2, cin2_, cout, clk, ALUop, rst, overflow);
 input[7:0] cin1,cin1_,cin2,cin2_;
 output[15:0] cout;
 output reg overflow;
 input rst,clk;
 input[2:0] ALUop;
 reg [16:0] oprand1, oprand2;
 reg [16:0] cout_;
 reg [15:0] cout;
 reg [15:0] hex;
 //yixiaweijisuanpingfanggenshiyaoyongdaodezhongjianbianliang
 reg[15:0] itera;
 //itera: b=(b+a/b)/2
 
 initial
 begin
	overflow=1'b0;
 end	
 
 always@(posedge clk )
  begin
    if(rst)
		begin
			cout<=16'h0000;
			overflow<=1'b0;
		end
    else
		begin
			oprand1[16:0]={cin1_[7],cin1_[7:0],cin1[7:0]};
			oprand2[16:0]={cin2_[7],cin2_[7:0],cin2[7:0]};
			if(oprand1[16]==1'b1)
			begin
				oprand1[14:0]=~oprand1[14:0]+1'b1;
			end
			if(oprand2[16]==1'b1)
			begin
				oprand2[14:0]=~oprand2[14:0]+1'b1;
			end
			case(ALUop)
				3'b001://add
				begin
					cout_[16:0]=oprand1[16:0]+oprand2[16:0];
	
					//shift
					if(cout_[15]==0)
					begin
						cout[15:0]=cout_[15:0];
					end
					else
					begin
						cout_[14:0]=~cout_[14:0]+1'b1;
						cout[15:0]={1'b1,cout_[14:0]};//dulichufuhaowei
					end
					
					if(cout_[15]^cout_[16]==1)
					begin
						overflow=1'b1;
					end
				end
				3'b010://sub
				begin
					cout_[16:0]=oprand1[16:0]-oprand2[16:0];
	
					//shift
					if(cout_[15]==0)
					begin
						cout[15:0]=cout_[15:0];
					end
					else
					begin
						cout_[14:0]=~cout_[14:0]+1'b1;
						cout[15:0]={1'b1,cout_[14:0]};//dulichufuhaowei
					end
	
					if(cout_[15]^cout_[16]==1)
					begin
						overflow=1'b1;
					end
				end
				3'b011://multiple
				begin
					if(oprand1[15]==1'b1)
					begin
						oprand1[14:0]=~oprand1[14:0]+1'b1;
					end
				    if(oprand2[15]==1'b1)
					begin
						oprand2[14:0]=~oprand2[14:0]+1'b1;
					end
					cout_[14:0]=oprand1[14:0]*oprand2[14:0];
	
					//panyi
					if(oprand1[14:0]*oprand2[14:0]>32767)
					begin
						overflow=1'b1;
					end
	
					//shift
					if(oprand1[15]^oprand2[15])
					begin
						cout[15:0]={1'b1,cout_[14:0]};//dulichufuhaowei
					end
					else
					begin
						cout[15:0]={1'b0,cout_[14:0]};
					end
				end
	
				3'b100://div
				begin
					if(oprand1[15]==1'b1)
					begin
						oprand1[14:0]=~oprand1[14:0]+1'b1;
					end
					if(oprand2[15]==1'b1)
					begin
						oprand2[14:0]=~oprand2[14:0]+1'b1;
					end
					cout_[14:0]=oprand1[14:0]/oprand2[14:0];
	
					//panchushu
					if(oprand2[14:0]==15'b0)
					begin
						cout=16'b0111111111111111;
					end
	
					//shift
					if(oprand1[15]^oprand2[15])
					begin
						cout[15:0]={1'b1,cout_[14:0]};//dulichufuhaowei
					end
					else
					begin
						cout[15:0]={1'b0,cout_[14:0]};
					end
				end
	
				3'b101://qufan
				begin
					if(oprand1[15]==1'b1)
					begin
						oprand1[14:0]=~oprand1[14:0]+1'b1;
						cout[15:0]={1'b0,oprand1[14:0]};
					end
					else
					begin
						cout[15:0]={1'b1,oprand1[14:0]};
					end
				end
				
				3'b110://qujueduizhi
				begin
					if(oprand1[15]==1'b1)
					begin
						oprand1[14:0]=~oprand1[14:0]+1'b1;
						cout[15:0]={1'b0,oprand1[14:0]};
					end
					else
					begin
						cout[15:0]=oprand1[15:0];
					end
				end
    
				3'b111://qiupingfanggen
				//Newton Iteration
				begin
					itera[15:0]=oprand1[15:0]/16'd2;
					itera=(itera+oprand1/itera)/2;
					itera=(itera+oprand1/itera)/2;
					itera=(itera+oprand1/itera)/2;
					itera=(itera+oprand1/itera)/2;
					itera=(itera+oprand1/itera)/2;
					itera=(itera+oprand1/itera)/2;
					itera=(itera+oprand1/itera)/2;
					itera=(itera+oprand1/itera)/2;
					itera=(itera+oprand1/itera)/2;
					itera=(itera+oprand1/itera)/2;
					cout[15:0]=itera[15:0];
				end
    
				default:cout=16'h0000;
			endcase
		end
	end
 endmodule
  
  
  