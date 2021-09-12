module SR_LATCH(
    input S,
    input R,
    output Q
);
reg r1 = 0;
reg r2 = 0;
assign Q = r1 ^ r2;

always @(posedge S)
    #1 r1 <= ~r2;
always @(posedge R)
    #1 r2 <= r1;
endmodule


module TH22(
    input A,
    input B,
    output Y
);

wire set = A & B;
wire hold = A | B;
SR_LATCH sr(
    .S(set),
    .R(~hold),
    .Q(Y)
);

endmodule

module TH34W22(
    input A,
    input B,
    input C,
    input D,
    output Y
);

wire set = (A & B) | (A & C) | (A & D) | (B & C) | (B & D);
wire hold = A | B | C | D;
SR_LATCH sr(
    .S(set),
    .R(~hold),
    .Q(Y)
);

endmodule
