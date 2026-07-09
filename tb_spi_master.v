module tb_spi_master;

reg clk;
reg rst;
reg [7:0] data_in;

wire mosi;
wire sclk;

spi_master uut(
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .mosi(mosi),
    .sclk(sclk)
);

// Clock Generation
always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    data_in = 8'b10110011;

    // Reset
    #10 rst = 0;

    // Wait for transmission
    #100;

    $finish;

end

// Monitor Signals
initial begin
    $monitor("Time=%0t Data=%b MOSI=%b SCLK=%b",
              $time, data_in, mosi, sclk);
end

endmodule
