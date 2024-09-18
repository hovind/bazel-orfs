module sdq_17x64
(
   rd_out,
   addr_in,
   we_in,
   wd_in,
   clk,
   ce_in
);
   parameter BITS = 64;
   parameter WORD_DEPTH = 17;
   parameter ADDR_WIDTH = 5;
   parameter corrupt_mem_on_X_p = 1;

   output reg [BITS-1:0]    rd_out;
   input  [ADDR_WIDTH-1:0]  addr_in;
   input                    we_in;
   input  [BITS-1:0]        wd_in;
   input                    clk;
   input                    ce_in;

   reg    [BITS-1:0]        mem [0:WORD_DEPTH-1];

   integer j;

   always @(posedge clk)
   begin
      if (we_in)
      begin
         mem[addr_in] <= wd_in;
      end
      // read
      rd_out <= mem[addr_in];
   end

endmodule