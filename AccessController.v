module AccessController (clk, rst,key,accessGranted);
    input clk, rst;
    input [7:0] key;
    output reg accessGranted;
    reg [7:0] count; // Counter to count the number of 1s in key
    always @(posedge clk, posedge rst) begin // Reset accessGranted on reset signal
        if (rst) begin 
            accessGranted <= 0;
        end
    end
    always @(posedge clk) begin// Check key for access control
        if (!rst && key) begin
            count <= 0;// Reset count
            for (integer i=0; i<8; i=i+1) begin // Count the number of 1s in excess3Value
                if (key[i] == 1) begin 
                    count <= count + 1;
                end
            end
            if (count % 2 == 0) begin // Grant access if count is even
                accessGranted <= 1;
            end else begin 
                accessGranted <= 0;
            end
        end
    end
endmodule

