module TopModule (clk,rst,request,access);
input clk,rst;
input [7:0] request;
output access;
wire [7:0] wire1;
KeyGenerator  SOC_KeyGenerator (.clk(clk),
                      .rst(rst),
                      .binaryValue(request),
                      .keyValue(wire1));
AccessController SOC_AccessController (.clk(clk),
                         .rst(rst),
                         .key(wire1),
                         .accessGranted(access));
endmodule