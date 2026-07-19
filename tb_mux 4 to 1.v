module tb_mux4to1;

reg [3:0] d;
reg [1:0] sel;
wire y;

mux4to1 uut(
    .d(d),
    .sel(sel),
    .y(y)
);

initial begin
    d = 4'b1010;

    sel = 2'b00; #10;
    $display("sel=%b y=%b", sel, y);

    sel = 2'b01; #10;
    $display("sel=%b y=%b", sel, y);

    sel = 2'b10; #10;
    $display("sel=%b y=%b", sel, y);

    sel = 2'b11; #10;
    $display("sel=%b y=%b", sel, y);

    $finish;
end
    initial begin

    $dumpfile(".vcd");

    $dumpvars(1);

end

endmodule

