module gen_inf ( clk_i, rst, start, ready, we, addr, wdata, rdata ); 

    parameter DEPTH = 5;

    localparam SIZE = 1 << DEPTH;

    input                   clk_i;
    input                   rst;
    input                   start;
    output                  ready;
    input                   we;
    input       [DEPTH-1:0] addr;
    input       [31:0]      wdata;
    output reg  [31:0]      rdata;

    reg         [31:0]      regs [SIZE-1:0];

    wire                    clk_u;
    wire                    clk_c;

    // User Signals begin

    // User Signals end

    assign clk_u = clk_i; // Remark if you are going to change clock
    assign clk_c = clk_i; // Remark if you are going to change clock

    integer rst_index;
    always @ ( posedge clk_u ) begin
        if ( rst ) begin
            for ( rst_index = 0; rst_index < SIZE; rst_index = rst_index + 1 ) begin
                regs[rst_index] <= 32'b0;
            end
        end else begin
            if ( we ) begin
                regs[addr] <= wdata;
            end

            rdata <= regs[addr];
        end
    end

    // User Logic begin

    // User Logic end

endmodule

