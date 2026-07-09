module spi_master(
    input clk,
    input rst,
    input [7:0] data_in,
    output reg mosi,
    output reg sclk
);

reg [2:0] count;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        count <= 0;
        sclk <= 0;
    end
    else
    begin
        mosi <= data_in[7-count];
        count <= count + 1;
        sclk <= ~sclk;
    end
end

endmodule
