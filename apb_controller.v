module apb_controller(
    input HCLK,
    input HRESETn,

    input valid,
    input [31:0] addr,
    input [31:0] wdata,
    input write,

    output reg PSEL,
    output reg PENABLE,
    output reg PWRITE,

    output reg [31:0] PADDR,
    output reg [31:0] PWDATA
);

    // FSM states
    parameter IDLE  = 2'b00;
    parameter SETUP = 2'b01;
    parameter ENABLE = 2'b10;

    reg [1:0] state;
    reg [1:0] next_state;

    // State register
    always @(posedge HCLK or negedge HRESETn)
    begin
        if(!HRESETn)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*)
    begin
        case(state)

            IDLE:
            begin
                if(valid)
                    next_state = SETUP;
                else
                    next_state = IDLE;
            end

            SETUP:
            begin
                next_state = ENABLE;
            end

            ENABLE:
            begin
                if(valid)
                    next_state = SETUP;
                else
                    next_state = IDLE;
            end

            default:
                next_state = IDLE;

        endcase
    end

    // Output logic
    always @(*)
    begin
        // default outputs
        PSEL    = 0;
        PENABLE = 0;
        PWRITE  = 0;
        PADDR   = 32'd0;
        PWDATA  = 32'd0;

        case(state)

            IDLE:
            begin
                PSEL    = 0;
                PENABLE = 0;
            end

            SETUP:
            begin
                PSEL    = 1;
                PENABLE = 0;
                PWRITE  = write;
                PADDR   = addr;
                PWDATA  = wdata;
            end

            ENABLE:
            begin
                PSEL    = 1;
                PENABLE = 1;
                PWRITE  = write;
                PADDR   = addr;
                PWDATA  = wdata;
            end

        endcase
    end

endmodule





