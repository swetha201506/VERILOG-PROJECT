module tb_vending_machine;

reg clk;
reg rst;
reg [1:0] coin;

wire dispense;

vending_machine uut(
    .clk(clk),
    .rst(rst),
    .coin(coin),
    .dispense(dispense)
);

// Clock Generation
always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    coin = 2'b00;

    // Reset
    #10 rst = 0;

    // Insert Rs.5
    coin = 2'b01;
    #10;
    $display("Coin = 5, Dispense = %b", dispense);

    // Insert another Rs.5
    coin = 2'b01;
    #10;
    $display("Coin = 5, Dispense = %b", dispense);

    // Wait for dispense
    coin = 2'b00;
    #10;
    $display("Chocolate Dispensed = %b", dispense);

    // Insert Rs.10 directly
    coin = 2'b10;
    #10;
    $display("Coin = 10, Dispense = %b", dispense);

    // Wait for dispense
    coin = 2'b00;
    #10;
    $display("Chocolate Dispensed = %b", dispense);

    #20;
    $finish;

end
    initial begin

    $dumpfile(".vcd");

    $dumpvars(1);

end

endmodule
