`timescale 1ns / 100ps
module segment7_tb;

reg [3:0] bcd_t;
reg [3:0] bcd_f;
wire [6:0] seg_t;
wire [6:0] seg_f;
wire seg_ready;
integer i;

segment7 uut(
    .bcd_t(bcd_t),
    .bcd_f(bcd_f),
    .seg_t(seg_t),
    .seg_f(seg_f)
);

assign seg_ready =
    (seg_t[0] | seg_f[0]) &
    (seg_t[1] | seg_f[1]) &
    (seg_t[2] | seg_f[2]) &
    (seg_t[3] | seg_f[3]) &
    (seg_t[4] | seg_f[4]) &
    (seg_t[5] | seg_f[5]) &
    (seg_t[6] | seg_f[6]);

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
