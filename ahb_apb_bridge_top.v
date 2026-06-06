module ahb_apb_bridge_top(

    input HCLK,
    input HRESETn,

    input [31:0] HADDR,
    input [31:0] HWDATA,

    input HWRITE,
    input [1:0] HTRANS,

    output [31:0] HRDATA

);

wire valid;
wire [31:0] addr;
wire [31:0] wdata;
wire write;

wire PSEL;
wire PENABLE;
wire PWRITE;

wire [31:0] PADDR;
wire [31:0] PWDATA;
wire [31:0] PRDATA;

ahb_slave_interface AHB_IF(

    .HCLK(HCLK),
    .HRESETn(HRESETn),

    .HADDR(HADDR),
    .HWDATA(HWDATA),

    .HWRITE(HWRITE),
    .HTRANS(HTRANS),

    .valid(valid),
    .addr(addr),
    .wdata(wdata),
    .write(write)

);

apb_controller APB_CTRL(

    .HCLK(HCLK),
    .HRESETn(HRESETn),

    .valid(valid),
    .addr(addr),
    .wdata(wdata),
    .write(write),

    .PSEL(PSEL),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),

    .PADDR(PADDR),
    .PWDATA(PWDATA)

);

apb_slave APB_SLV(

    .PCLK(HCLK),
    .PRESETn(HRESETn),

    .PSEL(PSEL),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),

    .PADDR(PADDR),
    .PWDATA(PWDATA),

    .PRDATA(PRDATA)

);

endmodule
