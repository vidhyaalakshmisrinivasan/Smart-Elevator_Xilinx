`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: VIT University, Chennai campus
// Engineers: Vidhyaalakshmi.S(10BEE1075), Nagashri.N.L(10BEE1052), G.Bhavana(10BEE1030)
//
// Create Date: 09:22:32 12/09/2011
// Design Name: Smart Elevator with VIP Priority
// Module Name: pro
// Project Name: Elevator Design
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
module pro(
input l1,
input l2,
input [3:0]p,
input [3:0]w,
input x1,
input x2,
input [3:0]y1,
input [3:0]y2,
input [3:0]z1,
input [3:0]z2,
output reg [3:0]a1,
output reg [3:0]a2,
output reg [3:0]b1,
output reg [3:0]b2,
output reg [3:0]c1,
output reg [3:0]c2,
output reg [3:0]var1,
output reg [3:0]var2,
input vip
);
always@(vip,p,w)
/* VIP Priority */
begin /*1*/
if(vip)
begin /*2*/
/*modulus of the step formula */
$display("Vip Welcome");
if( (y1[3:0]-z1[3:0])>0)
assign a1[3:0]=y1[3:0]-z1[3:0];
else
assign a1[3:0]=z1[3:0]-y1[3:0];
if((z1[3:0]-p[3:0])>0)
assign b1[3:0]=z1[3:0]-p[3:0];
else
assign b1[3:0]=p[3:0]-z1[3:0];
if((p[3:0]-w[3:0])>0)
assign c1[3:0]=p[3:0]-w[3:0];
else
assign c1[3:0]=w[3:0]-p[3:0];
assign var1[3:0]=a1[3:0]+b1[3:0]+c1[3:0]; /* Sum of steps for l1 */
if( (y2[3:0]-z2[3:0])>0)
assign a2[3:0]=y2[3:0]-z2[3:0];
else
assign a2[3:0]=z2[3:0]-y2[3:0];
if((z2[3:0]-p[3:0])>0)
assign b2[3:0]=z2[3:0]-p[3:0];
else
assign b2[3:0]=p[3:0]-z2[3:0];
if((p[3:0]-w[3:0])>0)
assign c2[3:0]=p[3:0]-w[3:0];
else
assign c2[3:0]=w[3:0]-p[3:0];
assign var2[3:0]=a2[3:0]+b2[3:0]+c2[3:0]; /* Sum of steps for l2*/
if( var1[3:0]<var2[3:0])
$display("You have been assigned LIFT 1");
else
$display("You have been assigned LIFT 2");
end /*2*/
/* Normal Functioning */
else
begin/*9*/
$display("Vip not Present");
if(l1 & l2)
begin /*3*/
if(p[3:0]-w[3:0]>0) /* You want to go up */
begin /*4*/
$display("correct loop");
if(x1==1 && x2==0 && p[3:0]-y1[3:0]>0)
$display("LIFT 2 p-w<0 and 100 ");
else if (x1==0 && x2==1 && p[3:0]-y2[3:0]>0)
$display("LIFT 1 p-w<0 and 010");
else
begin /*5*/
if( (y1[3:0]-z1[3:0]) < 0)
assign a1[3:0]=y1[3:0]-z1[3:0];
else
assign a1[3:0]=z1[3:0]-y1[3:0];
if((z1[3:0]-p[3:0]) < 0)
assign b1[3:0]=z1[3:0]-p[3:0];
else
assign b1[3:0]=p[3:0]-z1[3:0];
if((p[3:0]-w[3:0])<0)
assign c1[3:0]=p[3:0]-w[3:0];
else
assign c1[3:0]=w[3:0]-p[3:0];
assign var1[3:0]=a1[3:0]+b1[3:0]+c1[3:0];
if( (y2[3:0]-z2[3:0])<0)
assign a2[3:0]=y2[3:0]-z2[3:0];
else
assign a2[3:0]=z2[3:0]-y2[3:0];
if((z2[3:0]-p[3:0])<0)
assign b2[3:0]=z2[3:0]-p[3:0];
else
assign b2[3:0]=p[3:0]-z2[3:0];
if((p[3:0]-w[3:0])<0)
assign c2[3:0]=p[3:0]-w[3:0];
else
assign c2[3:0]=w[3:0]-p[3:0];
assign var2[3:0]=a2[3:0]+b2[3:0]+c2[3:0];
if( var1[3:0]>var2[3:0])
$display("LIFT 1 after comparing ");
else
$display("LIFT 2 after comparing ");
end /*5*/
end /*4*/
else
begin/*10*/
if(p[3:0]-w[3:0]<0) /* You want to go down */
begin /*6*/
$display("wrong loop");
if(((x1==1) && (x2==0) && (p[3:0]-y1[3:0]))<0)
$display("LIFT 2 p-w>0 and 100 ");
else if (x1==0 && x2==1 && p[3:0]-y2[3:0]<0)
$display("LIFT 1 p-w>0 and 010 ");
else
begin /*7*/
if( (y1[3:0]-z1[3:0])>0)
assign a1[3:0]=y1[3:0]-z1[3:0];
else
assign a1[3:0]=z1[3:0]-y1[3:0];
if((z1[3:0]-p[3:0])>0)
assign b1[3:0]=z1[3:0]-p[3:0];
else
assign b1[3:0]=p[3:0]-z1[3:0];
if((p[3:0]-w[3:0])>0)
assign c1[3:0]=p[3:0]-w[3:0];
else
assign c1[3:0]=w[3:0]-p[3:0];
assign var1[3:0]=a1[3:0]+b1[3:0]+c1[3:0];
if( (y2[3:0]-z2[3:0])>0)
assign a2[3:0]=y2[3:0]-z2[3:0];
else
assign a2[3:0]=z2[3:0]-y2[3:0];
if((z2[3:0]-p[3:0])>0)
assign b2[3:0]=z2[3:0]-p[3:0];
else
assign b2[3:0]=p[3:0]-z2[3:0];
if((p[3:0]-w[3:0])>0)
assign c2[3:0]=p[3:0]-w[3:0];
else
assign c2[3:0]=w[3:0]-p[3:0];
assign var2[3:0]=a2[3:0]+b2[3:0]+c2[3:0];
if( var1[3:0]<var2[3:0])
$display("LIFT 1 comparing2");
else
$display("LIFT 2 comparing2");
end /*7*/
end /*6*/
end/*10*/
end /*3*/
if((l1==0&&l2==1)||(l1==0&&l2==0)||(l1==1&&l2==0))/* Only comparing for any static condition */
begin /*8*/
if( (y1[3:0]-z1[3:0]) > 0)
assign a1[3:0]=y1[3:0]-z1[3:0];
else
assign a1[3:0]=z1[3:0]-y1[3:0];
if((z1[3:0]-p[3:0]) > 0)
assign b1[3:0]=z1[3:0]-p[3:0];
else
assign b1[3:0]=p[3:0]-z1[3:0];
if((p[3:0]-w[3:0])>0)
assign c1[3:0]=p[3:0]-w[3:0];
else
assign c1[3:0]=w[3:0]-p[3:0];
assign var1[3:0]=a1[3:0]+b1[3:0]+c1[3:0];
if( (y2[3:0]-z2[3:0])>0)
assign a2[3:0]=y2[3:0]-z2[3:0];
else
assign a2[3:0]=z2[3:0]-y2[3:0];
if((z2[3:0]-p[3:0])>0)
assign b2[3:0]=z2[3:0]-p[3:0];
else
assign b2[3:0]=p[3:0]-z2[3:0];
if((p[3:0]-w[3:0])>0)
assign c2[3:0]=p[3:0]-w[3:0];
else
assign c2[3:0]=w[3:0]-p[3:0];
assign var2[3:0]=a2[3:0]+b2[3:0]+c2[3:0];
if( var1[3:0]<var2[3:0])
$display("LIFT 1 comparing for static cases");
else
$display("LIFT 2 comparing for static cases ");
end /*8*/
end /*9*/
end /*1*/
endmodule
