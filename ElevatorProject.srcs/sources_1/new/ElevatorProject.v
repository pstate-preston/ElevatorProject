`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Personal Project
// Engineer: Preston Gautreaux
// 
// Create Date: 05/10/2025 10:05:51 PM
// Design Name: 3 Story Elevator
// Module Name: ElevatorProject
// Project Name: Elevator
// Target Devices: Basys3
// Description: Simulates logic for a simle elevator controller
// 
// Dependencies: none
// 
// Revisions:
//
// Revision 0.01 - File Created(05/13/2025)
//                  ** Original design does not implement properly. Will need to be edited using lab report. Add revision documentation when complete.
//                     Note: Check begin-end for active states. ** 
// 
// Revision 0.02 - Structural Changes(05/14/2025)
//                 1.) Added default definition just inside conditional always block to mitigate unintended behavior(lines 40-42)
//                 2.) Deconcatenated inputs inside conditional statements for rest states and door 2 states. 
//                 3.) Added segment selection to output assignments in floor states, instead of leaving display selection dependent on segment array
//
//////////////////////////////////////////////////////////////////////////////////

module elevator(one, two, three, hold_open, resetn, clock, an, seg, door);
input one, two, three, hold_open;
input resetn, clock;
output reg [6:0]seg;
output reg door;
output reg [4:1]an;
reg [3:0] y,Y;
parameter [3:0] floor1_arrive = 4'b0000, floor1_door1 = 4'b0001, floor1_door2 = 4'b0010, floor1_rest = 4'b0011,
				floor2_arrive = 4'b0100, floor2_door1 = 4'b0101, floor2_door2 = 4'b0110, floor2_rest = 4'b0111,
				floor3_arrive = 4'b1000, floor3_door1 = 4'b1001, floor3_door2 = 4'b1010, floor3_rest = 4'b1011,
				floor2_pass = 4'b1100;
				
always@(*)

begin
//default behavioral definition
Y = y;
seg = 7'b1111111;
an = 4'b1111;
door = 0;

	case(y)
		//for each floor: arrival state
		floor1_arrive:begin
		              an = 4'b1110;
					  seg = 7'b1111001;
					  door = 0;
					  Y = floor1_door1;
					  end
					  
		floor2_arrive:begin
		              an = 4'b1101;
					  seg = 7'b0100100;
					  door = 0;
					  Y = floor2_door1;
					  end
					  
		floor3_arrive:begin
		              an = 4'b1011;
					  seg = 7'b0110000;
					  door = 0;
					  Y = floor3_door1;
					  end
					  
		//for each floor: door open clock cycle 1
		floor1_door1: begin
		              an = 4'b1110;
					  seg = 7'b1111001;
					  door = 1;
					  Y = floor1_door2;
					  end
					  
		floor2_door1: begin
		              an = 4'b1101;
					  seg = 7'b0100100;
					  door = 1;
					  Y = floor2_door2;
					  end
					  
		floor3_door1: begin
		              an = 4'b1011;
					  seg = 7'b0110000;
					  door = 1;
					  Y = floor3_door2;
					  end
					  
		//for each floor: door open clock cycle 2(if hold button is pressed, no change in state and door stays open. otherwise to rest state where doors are closed).
		floor1_door2: begin
		              an = 4'b1110;
					  seg = 7'b1111001;
					  door = 1;
					  if(hold_open == 1) Y = floor1_door2;
					  else if(hold_open == 0) Y = floor1_rest;
					  end
					  
		floor2_door2: begin
		              an = 4'b1101;
					  seg = 7'b0100100;
					  door = 1;
					  if(hold_open == 1) Y = floor2_door2;
					  else if(hold_open == 0) Y = floor2_rest;
					  end
					  
		floor3_door2: begin
		              an = 4'b1011;
					  seg = 7'b0110000;
					  door = 1;
					  if(hold_open == 1) Y = floor3_door2;
					  else if(hold_open == 0) Y = floor3_rest;
					  end
					  
		//for each floor: rest state and behavioral description(note: for floor two, if floors one and three are selected, elevator stops at floor one first).
		floor1_rest:  begin
		              an = 4'b1110;
					  seg = 7'b1111001;
					  door = 0;
					  if(one == 1) Y = floor1_door1;
					  else if(two == 1 && one == 0) Y = floor2_arrive;
					  else if(three == 1 && two == 0 && one == 0) Y = floor2_pass;
					  end
					  
		floor2_rest:  begin
		              an = 4'b1101;
					  seg = 7'b0100100;
					  door = 0;
					  if(two == 1) Y = floor2_door1;
					  else if(two == 0 && one == 1) Y = floor1_arrive;
					  else if(three == 1 && two == 0 && one == 0) Y = floor3_arrive;
					  end
					  
					  
		floor3_rest:  begin
		              an = 4'b1011;
					  seg = 7'b0110000;
					  door = 0;
					  if(three == 1) Y = floor3_door1;
					  else if(three ==0 && two == 1) Y = floor2_arrive;
					  else if(three == 0 && two == 0 && one == 1) Y = floor2_pass;
					  end
					  					  
					  
		floor2_pass:  begin
		              an = 4'b1101;
		              seg = 7'b0100100;
					  door = 0;
					  if(two == 0 && one == 1) Y = floor1_arrive;
					  else if(three == 1 && two == 0) Y = floor3_arrive;
					  end
	endcase
end

//flip-flop definition
//note: floor one's arrival state will be reset state.
always@(negedge resetn, posedge clock)
	begin
		if(resetn == 0) y<= floor1_arrive;
		else y<=Y;
	end
endmodule