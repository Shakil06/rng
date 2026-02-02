// Code your design here

`timescale 1ns / 1ps

module trng (Out, A, B, temp, put_seed, seed, clk);
	
	output [15:0] B, temp;
	input put_seed, clk;
    input [15:0] seed;
	output reg [15:0] Out, A;
    wire [15:0] seed;

  
	always@(posedge clk)begin
    	if(put_seed) begin
        	Out <= seed;
        	A <= seed;
    	end
    	else begin
        	Out <= temp;
        	A <=  temp;
    	end
	end

   

	//Chaotic XOR Network
	xor16_1 xor16(B[15],{1'b0,A[14:0]});
	xor16_1 xor15(B[14],{2'b00,A[13:1],1'b0});
	xor16_1 xor14(B[13],{A[15],2'b00,A[12:0]});
	xor16_1 xor13(B[12],{A[15:14],2'b00,A[11:0]});
	xor16_1 xor12(B[11],{A[15:13],2'b00,A[10:0]});
	xor16_1 xor11(B[10],{A[15:12],2'b00,A[9:0]});
	xor16_1 xor10(B[9],{A[15:11],2'b00,A[8:0]});
	xor16_1 xor9(B[8],{A[15:10],2'b00,A[7:0]});
	xor16_1 xor8(B[7],{A[15:09],2'b00,A[6:0]});
	xor16_1 xor7(B[6],{A[15:08],2'b00,A[5:0]});
	xor16_1 xor6(B[5],{A[15:07],2'b00,A[4:0]});
	xor16_1 xor5(B[4],{A[15:06],2'b00,A[3:0]});
	xor16_1 xor4(B[3],{A[15:05],2'b00,A[2:0]});
	xor16_1 xor3(B[2],{A[15:04],2'b00,A[1:0]});
	xor16_1 xor2(B[1],{A[15:03],2'b00,A[0]});
	xor16_1 xor1(B[0],{A[15:02],2'b00});
  
	//ISU Network
	ISU ISU1_2(temp[0],temp[1],B[0],B[1],Out[0],Out[1]);
	ISU ISU3_4(temp[2],temp[3],B[2],B[3],Out[2],Out[3]);
	ISU ISU5_6(temp[4],temp[5],B[4],B[5],Out[4],Out[5]);
	ISU ISU7_8(temp[6],temp[7],B[6],B[7],Out[6],Out[7]);
	ISU ISU9_10(temp[8],temp[9],B[8],B[9],Out[8],Out[9]);
	ISU ISU11_12(temp[10],temp[11],B[10],B[11],Out[10],Out[11]);
	ISU ISU13_14(temp[12],temp[13],B[12],B[13],Out[12],Out[13]);
	ISU ISU15_16(temp[14],temp[15],B[14],B[15],Out[14],Out[15]);	

endmodule



module xor16_1(output out,
    		   input wire [15:0] in);

	xor(out, in[15], in[14], in[13], in[12], in[11], in[10], in[9], in[8], in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0]);

endmodule


module mux(y, in1, in0, sel);

	output reg y;
	input in1, in0, sel;
	
	always@(in1, in0, sel)
 		case(sel)
 			1'b0: y=in0;
 			1'b1: y=in1;
 		endcase

endmodule


module ISU(Ai, Aj, Bi, Bj, Outm, Outn);

  	output Ai, Aj;
  	input Bi, Bj, Outm, Outn;
  	wire x,y;
  
	mux muxBL(x,Bi,Bj,Outn);
  	mux muxBR(y,Bj,Bi,Outn);
  	mux muxTL(Ai,~x,~y,Outm);
  	mux muxTR(Aj,~y,~x,Outm);

endmodule