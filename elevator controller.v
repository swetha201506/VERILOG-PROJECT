module elevator_controller(
    input clk,
    input rst,
    input up,
    input down,
    output reg [1:0] floor
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        floor <= 2'd0;

    else
    begin
        if(up && floor < 2)
            floor <= floor + 1;

        else if(down && floor > 0)
            floor <= floor - 1;
    end
end

endmodule
