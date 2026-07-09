module tb_traffic_light;

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

    #50 $finish;
end

endmoduletraffic_light.verilog code
