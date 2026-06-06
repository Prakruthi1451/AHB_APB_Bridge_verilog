`timescale 1ns/1ps
module tb_bridge;

reg HCLK;
reg HRESETn;
reg [31:0] HADDR;
reg [31:0] HWDATA;
reg HWRITE;
reg [1:0] HTRANS;
wire [31:0] HRDATA;

ahb_apb_bridge_top DUT(
    .HCLK(HCLK),
    .HRESETn(HRESETn),
    .HADDR(HADDR),
    .HWDATA(HWDATA),
    .HWRITE(HWRITE),
    .HTRANS(HTRANS),
    .HRDATA(HRDATA)
);

always #5 HCLK = ~HCLK;
initial
begin

    HCLK = 0;
    HRESETn = 0;
    HADDR = 0;
    HWDATA = 0;
    HWRITE = 0;
    HTRANS = 0;
    #20;
    HRESETn = 1;

    // WRITE OPERATION
    @(posedge HCLK);
    HADDR  = 32'h10;
    HWDATA = 32'hABCD1234;
    HWRITE = 1;
    HTRANS = 2'b10;

    @(posedge HCLK);
    HTRANS = 2'b00;
    // READ OPERATION
    #40;

    @(posedge HCLK);
    HADDR  = 32'h10;
    HWRITE = 0;
    HTRANS = 2'b10;

    @(posedge HCLK);
    HTRANS = 2'b00;
    #100;
    $finish;

end
endmodule
