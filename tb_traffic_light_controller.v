module tb_traffic;

reg clk;
reg rst;
wire [2:0] light;

traffic_light uut(
    .clk(clk),
    .rst(rst),
    .light(light)
);

always #5 clk = ~clk;
initial begin
    clk = 0;
    rst = 1;

    #10 rst = 0;

    #10 $display("light=%b", light);
    #10 $display("light=%b", light);
    #10 $display("light=%b", light);
    #10 $display("light=%b", light);

    #50 $finish;
end
    initial begin

    $dumpfile(".vcd");

    $dumpvars(1);

end

endmodule
