module testbench( );
reg clk,rst;
reg [7:0] request;
wire access;
TopModule DUT(clk,rst,request,access);
always #5 clk=~clk;
initial begin clk=0;rst=1;end
initial begin 
#10;rst=0;#10;
request=8'b10101010;#10;
request=8'b00101010;#10;
request=8'b00001010;#10;
request=8'b10111010;#10;
request=8'b11101010;#10;
request=8'b10101010;#10;
end
endmodule
