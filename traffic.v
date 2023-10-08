`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:07 04/21/2022 
// Design Name: 
// Module Name:    traffic 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module traffic(f_n,f_s,f_e,f_w,s_n,s_s,s_e,s_w,clk,rst);
	output reg[2:0] f_n;
	output reg[2:0] f_s;
	output reg[2:0] f_e, f_w;
	output reg[2:0] s_n;
	output reg[2:0] s_s;
	output reg[2:0] s_e, s_w;
	
	input clk,rst;
	
	reg[2:0] state;
	
	parameter [2:0] north = 3'b000;
   parameter [2:0] south=3'b010;
   parameter [2:0] east=3'b100;
   parameter [2:0] west=3'b110;
	
	reg [2:0] count;
	
	always @(posedge clk, posedge rst)
		begin
			if(rst)
				begin
					state = north;
					count = 3'b000;
					//rst = 0;
				end
			else
				begin
					case(state)
					north:
						begin
							if(count==3'b111)
								begin
									count = 3'b0;
									state = south;
								end
							else
								begin
									count = count + 3'b001;
									state = north;
								end
							end
               south :
                    begin
                        if (count==3'b111)
                            begin
                            count=3'b0;
                            state=east;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=south;
                        end
                    end
            east :
                begin
                    if (count==3'b111)
                        begin
                        count=3'b0;
                        state=west;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=east;
                        end
                    end
            west :
                begin
                    if (count==3'b111)
                        begin
                        state=north;
                        count=3'b0;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=west;
                        end
                    end
            endcase // case (state)
        end // always @ (state)
    end 
	 
	 always @(state)
     begin
         case (state)
            north :
                begin
                    f_n = 3'b001;
                    f_s = 3'b100;
                    f_e = 3'b100;
                    f_w = 3'b100;
						  s_n = 3'b001;
						  s_s = 3'b100;
                    s_e = 3'b100;
                    s_w = 3'b100;
                end // case: north

            south :
                begin
                    f_n = 3'b100;
                    f_s = 3'b001;
                    f_e = 3'b100;
                    f_w = 3'b100;
						  s_n = 3'b100;
                    s_s = 3'b001;
                    s_e = 3'b100;
                    s_w = 3'b100;
                end // case: south

          
            west :
                begin
					     #30;
                    f_n = 3'b100;
                    f_s = 3'b100;
                    f_e = 3'b100;
                    f_w = 3'b001;
						  s_n = 3'b100;
                    s_s = 3'b100;
                    s_e = 3'b100;
                    s_w = 3'b001;
                end // case: west           
				east :
                begin
                    f_n = 3'b100;
                    f_s = 3'b100;
                    f_e = 3'b001;
                    f_w = 3'b100;
						  #30;
						  s_n = 3'b100;
                    s_s = 3'b100;
                    s_e = 3'b001;
                    s_w = 3'b100;
                end // case: east            
			endcase // case (state)
     end // always @ (state)
endmodule
