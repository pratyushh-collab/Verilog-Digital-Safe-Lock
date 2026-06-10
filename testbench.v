module testbench;
  reg [3:0]test_entered_password;
  reg test_submit;
  wire test_unlocked;
  wire test_alarm;
  
  safe_lock DUT(.entered_password(test_entered_password), .submit(test_submit), .unlocked(test_unlocked), .alarm(test_alarm));
  
  initial
    begin
      $monitor("Time=%0d  | submit=%b | password=%b | unlocked=%b | alarm=%b", $time, test_submit, test_entered_password, test_unlocked, test_alarm);
      
      test_entered_password =4'b0000;
      test_submit =1'b0;
      #10
      
      test_entered_password =4'b1101;
      test_submit =1'b1;
      #10
      
      test_entered_password =4'b1100;
      test_submit =1'b1;
      #10
      
      test_entered_password =4'b1111;
      test_submit =1'b0;
      $finish;
      
    end
  
endmodule
