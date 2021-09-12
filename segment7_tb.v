`timescale 1ns / 100ps
module segment7_tb;

reg [3:0] bcd_t;
reg [3:0] bcd_f;
wire [6:0] seg_t;
wire [6:0] seg_f;
integer i;

segment7 uut(
    .bcd_t(bcd_t),
    .bcd_f(bcd_f),
    .seg_t(seg_t),
    .seg_f(seg_f)
);

initial begin
    $dumpfile("segment7.vcd");
    $dumpvars();

    for(i = 0; i < 16; i = i + 1) //run loop for 0 to 15.
    begin
        bcd_t = 0;
        bcd_f = 0;
        #10;

        bcd_t = i;
        bcd_f = ~i;
        #10;
    end
end

endmodule
