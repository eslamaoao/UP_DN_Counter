`timescale 1ns/1ps
module Up_Dn_Counter_Tb ();

 reg [4:0] In_Tb;
 reg Load_Tb,Up_Tb,Down_Tb;
 reg Clk_Tb;
 wire High_Tb,Low_Tb;
 wire [4:0] Counter_Tb ;

Up_Dn_Counter Dut (
.In (In_Tb),
.Load (Load_Tb),
.Up (Up_Tb),
.Down (Down_Tb),
.Clk (Clk_Tb),
.High (High_Tb),
.Low (Low_Tb),
.Counter_Reg (Counter_Tb) );
always #10 Clk_Tb = !Clk_Tb;

initial 
begin
In_Tb   =  5'b01111;
Load_Tb =  1'b0;
Up_Tb   =  1'b0;
Down_Tb =  1'b0;
Clk_Tb  =  1'b0;


$display ("TEST LOAD FUNCTION");
#10
 Load_Tb =  1'b1; 
#10   
if(Counter_Tb==5'b01111)
	$display(" the Load function is passed " );
else
	$display(" the load function is failed " );
Down_Tb   =  1'b1;
Load_Tb =  1'b0; 
Up_Tb   =  1'b1;
$display ("TEST PRIORITY BETWEEN UP AND DOWN");
#12 if(Counter_Tb==5'b01110)
		$display(" the priority test between up and down is passed " );
	else
		$display(" the priority test between up and down is failed " );

$display ("TEST LOAD PRIORITY IS THE HIGHEST ");
#10 
Down_Tb   =  1'b1;
Load_Tb =  1'b1; 
Up_Tb   =  1'b1;
#12 if(Counter_Tb==5'b01111)
		$display(" test load priority is the highest is passed " );
	else
		$display(" test load priority is the highest is failed " );
		
		
$display ("TEST IF THE COUNTER VALUE  WILL BE THE SAME IF COUNTER VALUE IS ZERO AND THE LOW,UP AND DOWN FLAG ARE HIGH");
		
#10 
Load_Tb =  1'b0; 

#300 if(Counter_Tb==5'b00000)
		$display(" test is passed " );
	else
		$display(" test  is failed " );


$display("TEST IF LOW IS 1 WHEN COUNTER IS 0 ");
#2 if(Low_Tb==1'b1)
		$display("test is passed" );
   else
		$display("test is failed" );



$display ("TEST THE UP COUNTER FUNCTION")
#2
Down_Tb   =  1'b0;
Up_Tb   =  1'b1;		
#10
if(Counter_Tb==5'b00001)
		$display("test is passed" );
else
		$display("test is failed" );
#500
$display("TEST IF HIGH IS 1 WHEN COUNTER IS 31 ");
if(High_Tb==1'b1)
		$display("test is passed" );
else
		$display("test is failed" );
#10
$stop;
end      
endmodule 


