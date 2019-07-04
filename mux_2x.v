module mux_2x(
input ctrl,
input [15:0] x,
input [15:0] y,

output [15:0] f
);
assign f = ctrl? y:x;

endmodule