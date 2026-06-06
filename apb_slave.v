// Code your design here



module apb_slave(
    input PCLK,
    input PRESETn,
    input PSEL,
    input PENABLE,
    input PWRITE,
    input [31:0] PADDR,
    input [31:0] PWDATA,
    output reg [31:0] PRDATA
);

reg [31:0] mem [0:255];
always @(posedge PCLK or negedge PRESETn)
begin
    if(!PRESETn)
    begin
        PRDATA <= 0;
    end
    else
    begin
        if(PSEL && PENABLE && PWRITE)
        begin
            mem[PADDR] <= PWDATA;
        end
        if(PSEL && PENABLE && !PWRITE)
        begin
            PRDATA <= mem[PADDR];
        end
    end
end
endmodule



