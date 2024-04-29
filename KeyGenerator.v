module KeyGenerator (clk, rst,binaryValue,keyValue);
input clk, rst;
input [7:0] binaryValue;
output reg [7:0] keyValue;
reg [7:0] intermediateValue;// internal registers for storing intermediate values
always @(posedge clk or posedge rst) begin
    if (rst) begin // Reset registers on reset signal
        intermediateValue <= {8{1'b0}};
        keyValue <= {8{1'b0}};
    end else begin // key generation process
        if (binaryValue) begin
            intermediateValue <= ~binaryValue; // NOT operation
            intermediateValue <= intermediateValue & binaryValue;// AND operation
            intermediateValue <= intermediateValue | binaryValue;// OR operation
            intermediateValue <= ~(intermediateValue | binaryValue);// NOR operation
            intermediateValue <= ~(intermediateValue & binaryValue);// NAND operation
            intermediateValue <= intermediateValue ^ binaryValue;// XOR operation
            intermediateValue <= ~(intermediateValue ^ binaryValue);// XNOR operation
            keyValue <= intermediateValue;// Final key value
        end else begin
            keyValue <= {8{1'b0}}; // Reset key value when binary value is zero
        end
    end
end
endmodule
