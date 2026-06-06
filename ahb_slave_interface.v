module ahb_slave_interface(

    input HCLK,
    input HRESETn,

    input [31:0] HADDR,
    input [31:0] HWDATA,
    input HWRITE,
    input [1:0] HTRANS,

    output reg valid,
    output reg [31:0] addr,
    output reg [31:0] wdata,
    output reg write

);

always @(posedge HCLK or negedge HRESETn)
begin
    if(!HRESETn)
    begin
        valid <= 0;
        addr  <= 0;
        wdata <= 0;
        write <= 0;
    end

    else
    begin

        if(HTRANS == 2'b10)
        begin
            valid <= 1;
            addr  <= HADDR;
            wdata <= HWDATA;
            write <= HWRITE;
        end

        else
        begin
            valid <= 0;
        end

    end
end

endmodule


