module tb_alu;

reg [7:0] a,b;
reg [2:0] sel;
wire [7:0] result;

alu_8bit uut(
    .a(a),
    .b(b),
    .sel(sel),
    .result(result)
);

initial begin

    a = 8'd10;
    b = 8'd5;

    sel = 3'b000; #10;
    $display("ADD Result = %d", result);

    sel = 3'b001; #10;
    $display("SUB Result = %d", result);

    sel = 3'b010; #10;
    $display("AND Result = %d", result);

    sel = 3'b011; #10;
    $display("OR Result = %d", result);

    sel = 3'b100; #10;
    $display("XOR Result = %d", result);

    $finish;
end

endmodule
