module NCL_INV(
    input A_t,
    input A_f,
    output wire Y_t,
    output wire Y_f
);

assign Y_t = A_f;
assign Y_f = A_t;

endmodule


module NCL_AND2(
    input A_t,
    input A_f,
    input B_t,
    input B_f,
    output wire Y_t,
    output wire Y_f
);

TH34W22 x(
    .A(A_f),
    .B(B_f),
    .C(A_t),
    .D(B_t),
    .Y(Y_f)
);

TH22 y(
    .A(A_t),
    .B(B_t),
    .Y(Y_t)
);

endmodule
