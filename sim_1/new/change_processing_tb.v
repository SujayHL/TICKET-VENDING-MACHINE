`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2023 23:05:58
// Design Name: 
// Module Name: change_processing_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module change_processing_tb;

 
  reg RD;
  reg CLK;
  reg FINISH;
  reg [1:0] DESTINATION_IN;
  reg [1:0] QUA_IN;
  reg [3:0] COST_IN;
  reg [3:0] COIN_IN;
   
  
  wire [3:0] REST;
  wire [6:0] TICKET;
  wire ACT_1;
  wire [3:0] CHANGE;
  
  change_processing dut (
    .RD(RD),
    .CLK(CLK),
    .FINISH(FINISH),
    .DESTINATION_IN(DESTINATION_IN),
    .QUA_IN(QUA_IN),
    .COST_IN(COST_IN),
    .COIN_IN(COIN_IN),
    .REST(REST),
    .TICKET(TICKET),
    .ACT_1(ACT_1),
    .CHANGE(CHANGE)
  );
  
 
  always begin
    CLK = 0;
    #5;
    CLK = 1;
    #5;
  end
  
  initial begin
    
    RD = 1'b1;
    FINISH = 1'b0;
    {DESTINATION_IN,QUA_IN}<= 4'b0000;
    COST_IN <= 4'b0000;
    COIN_IN <= 4'b0000;
    #5;
    
    RD = 1'b0;
    FINISH = 1'b1;
    {DESTINATION_IN,QUA_IN}<= 4'b0101;
    COST_IN <= 4'b0110;
    COIN_IN <= 4'b1001;
    #10;
    
    
    RD = 1'b0;
    FINISH = 1'b1;
    {DESTINATION_IN,QUA_IN}<= 4'b0101;
    COST_IN <= 4'b1100;
    COIN_IN <= 4'b0100;
    #10;
     
    RD = 1'b0;
    FINISH = 1'b1;
    {DESTINATION_IN,QUA_IN}<= 4'b1001;
    COST_IN <= 4'b0110;
    COIN_IN <= 4'b0110;
    #10;
    
    RD = 1'b1;
    FINISH = 1'b0;
    {DESTINATION_IN,QUA_IN}<= 4'b0000;
    COST_IN <= 4'b0000;
    COIN_IN <= 4'b1000;
    #10;
    
    
    RD = 1'b0;
    FINISH = 1'b1;
    {DESTINATION_IN,QUA_IN} <= 4'b0101;
    COST_IN <= 4'b0100;
    COIN_IN <= 4'b0010;
    #10;
    
    RD = 1'b0;
    FINISH = 1'b1;
    {DESTINATION_IN,QUA_IN}<= 4'b1001;
    COST_IN <= 4'b0110;
    COIN_IN <= 4'b0110;
    #10;
    // Test case 3: No transaction, reset change amount
    //RD = 1'b0;
    //FINISH = 1'b0;
    //{DESTINATION_IN,QUA_IN} <= 4'b0000;
    //COST_IN <= 4'b0000;
    //COIN_IN <= 4'b0000;
    //#10;
    
    $finish;
  end

endmodule