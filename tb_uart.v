module tb_uart_tx;

reg clk;
reg rst;
reg tx_start;
reg [7:0] data_in;

wire tx;

uart_tx uut(
    .clk(clk),
    .rst(rst),
    .tx_start(tx_start),
    .data_in(data_in),
    .tx(tx)
);

// Clock Generation
always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    tx_start = 0;
    data_in = 8'b10101010;

    // Reset
    #10 rst = 0;

    // Start Transmission
    tx_start = 1;
    #10;

    tx_start = 0;

    // Display Output
    #10;
    $display("TX = %b", tx);

    #50;
    $finish;

end
    initial begin

    $dumpfile(".vcd");

    $dumpvars(1);

end

endmodule

