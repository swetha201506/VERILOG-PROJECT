module tb_fifo;

reg clk;
reg rst;
reg wr_en;
reg rd_en;
reg [7:0] data_in;

wire [7:0] data_out;

fifo uut(
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out)
);

// Clock Generation
always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 0;

    // Reset
    #10 rst = 0;

    // Write 10
    wr_en = 1;
    data_in = 8'd10;
    #10;

    // Write 20
    data_in = 8'd20;
    #10;

    // Write 30
    data_in = 8'd30;
    #10;

    wr_en = 0;

    // Read 10
    rd_en = 1;
    #10;
    $display("Read Data = %d", data_out);

    // Read 20
    #10;
    $display("Read Data = %d", data_out);

    // Read 30
    #10;
    $display("Read Data = %d", data_out);

    rd_en = 0;

    #20;
    $finish;

end
initial begin

    $dumpfile(".vcd");

    $dumpvars(1);

end

endmodule

