module mux(
input ctrl,
input [7:0] x,
input [7:0] y,

output [7:0] f
);
	assign f = ctrl? y:x;

endmodule 