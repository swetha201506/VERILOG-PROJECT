module fifo(
    input clk,
    input rst,
    input wr_en,
    input rd_en,
    input [7:0] data_in,
    output reg [7:0] data_out
);

reg [7:0] mem [3:0];

reg [1:0] wr_ptr;
reg [1:0] rd_ptr;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        wr_ptr <= 0;
        rd_ptr <= 0;
    end
    else
    begin
        if(wr_en)
        begin
            mem[wr_ptr] <= data_in;
            wr_ptr <= wr_ptr + 1;
        end

        if(rd_en)
        begin
            data_out <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1;
        end
    end
end

endmodule
