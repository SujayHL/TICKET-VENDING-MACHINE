`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2023 23:04:26
// Design Name: 
// Module Name: change_processing
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


module change_processing(
  input RD, CLK, FINISH,
  input [1:0] DESTINATION_IN,
  input [1:0] QUA_IN,
  input [3:0] COST_IN,
  input [3:0] COIN_IN,
  output reg [3:0] REST,
  output reg [6:0] TICKET,
  output reg ACT_1,
  output reg [3:0] CHANGE
);

 
  
  always @(negedge CLK ) begin
    if (RD) begin
      
      REST <= 4'b0000; 
      TICKET <= 7'b0000000;
      ACT_1 <= 1'b0;
      CHANGE <= COIN_IN;#5;
    end
    else begin
      
      if (FINISH) begin
        
        case ({DESTINATION_IN, QUA_IN})
          4'b0101: begin
            if (COST_IN <= COIN_IN) begin
              
              REST = COIN_IN - COST_IN;
              TICKET= 7'b000001;
              ACT_1 = 1'b1;
              CHANGE = REST;
            end 
            else begin
              
              REST = 3'b000;
              TICKET = 7'b0000001;
              ACT_1 = 1'b0;
              CHANGE = COIN_IN;
            end
          end
          4'b1000: begin
            if (COST_IN <= COIN_IN) begin
              
              REST = COIN_IN - COST_IN;
              TICKET = 7'b0000100;
              ACT_1 = 1'b1;
              CHANGE = REST;
            end 
            else begin
              
              REST = 3'b000;
              TICKET = 7'b0000010;
              ACT_1 = 1'b0;
              CHANGE <= COIN_IN;
            end
          end
           4'b1001: begin
            if (COST_IN <= COIN_IN) begin
             
              REST = COIN_IN - COST_IN;
              TICKET = 7'b0000010;
              ACT_1 = 1'b1;
              CHANGE = REST;
            end 
            else begin
              
              REST = 3'b000;
              TICKET = 7'b0000010;
              ACT_1 = 1'b0;
              CHANGE = COIN_IN;
            end
          end
          

        endcase
      end 
    end
  end

endmodule
