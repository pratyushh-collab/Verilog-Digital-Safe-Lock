module safe_lock (
    input  wire [3:0] entered_password, 
    input  wire       submit,           
    output reg        unlocked,         
    output reg        alarm             
); 
  
    localparam [3:0] SECRET_PASSWORD = 4'b1101; 
    always @(*) begin
        if (submit == 1'b0) begin          
            unlocked = 1'b0;
            alarm    = 1'b0;
        end else begin         
            if (entered_password == SECRET_PASSWORD) begin
                unlocked = 1'b1;  
                alarm    = 1'b0;  
            end else begin
                unlocked = 1'b0; 
                alarm    = 1'b1; 
              
            end
        end
      
    end
  
endmodule
