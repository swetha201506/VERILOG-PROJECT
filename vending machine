odule vending_machine(
    input clk,
    input rst,
    input [1:0] coin,
    output reg dispense
);

reg [1:0] state;

parameter S0  = 2'b00;
parameter S5  = 2'b01;
parameter S10 = 2'b10;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        state <= S0;
        dispense <= 0;
    end
    else
    begin
        dispense <= 0;

        case(state)

        S0:
        begin
            if(coin == 2'b01)
                state <= S5;
            else if(coin == 2'b10)
                state <= S10;
        end

        S5:
        begin
            if(coin == 2'b01)
                state <= S10;
        end

        S10:
        begin
            dispense <= 1;
            state <= S0;
        end

        endcase
    end
end

endmodule
