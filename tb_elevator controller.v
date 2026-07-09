module tb_elevator;

reg clk;
reg rst;
reg up;
reg down;

wire [1:0] floor;

elevator_controller uut(
    .clk(clk),
    .rst(rst),
    .up(up),
    .down(down),
    .floor(floor)
);

// Clock Generation
always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    up = 0;
    down = 0;

    // Reset
    #10 rst = 0;

    // Move to Floor 1
    up = 1;
    #10;
    up = 0;
    $display("Current Floor = %d", floor);

    // Move to Floor 2
    up = 1;
    #10;
    up = 0;
    $display("Current Floor = %d", floor);

    // Move Down to Floor 1
    down = 1;
    #10;
    down = 0;
    $display("Current Floor = %d", floor);

    // Move Down to Floor 0
    down = 1;
    #10;
    down = 0;
    $display("Current Floor = %d", floor);

    #20;
    $finish;

end

endmodule
