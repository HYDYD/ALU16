module dual_hex(iflag, datain , dispout);
input iflag;
input[19:0] datain;
output[39:0] dispout;

seg_decoder ul(iflag,datain[19:16],dispout[39:32]);
seg_decoder u2(iflag,datain[15:12],dispout[31:24]);
seg_decoder u3(iflag,datain[11:8],dispout[23:16]);
seg_decoder u4(iflag,datain[7:4],dispout[15:8]);
seg_decoder u5(iflag,datain[3:0],dispout[7:0]);
endmodule


