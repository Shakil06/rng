// Code your testbench here
// or browse Examples

`timescale 1ns / 1ps

module trng_test;
  wire [15:0] out, A, B, temp;
	reg put_seed, clk;
  reg [15:0] seed;     //
  
    assign seed = 1327;  //

  reg [15:0] rn[4599:0]; 
  	integer f,i;


  trng dut(out, A, B, temp, put_seed, seed, clk); //
  
  	always #5 clk=~clk;

  //Clock and reset release
  initial begin
    clk=0; put_seed=1; //Clock low at time zero
    @(posedge clk);
    @(posedge clk);
    put_seed = 0;
  end
  
  	initial begin
      f = $fopen("output.txt","w");
      if (f)
      $display("File was opened successfully : %0d", f);
    else
      $display("File was NOT opened successfully : %0d", f);

      @(negedge put_seed); //Wait for reset to be released
    @(posedge clk);   //Wait for fisrt clock out of reset

      for (i = 0; i<4599; i=i+1) begin
      @(posedge clk);
      rn[i] <= out;
        $display("Random number: %d", out);
        $fwrite(f,"%d\n",   out);
    end

    $fclose(f);  

    $finish;
  	end


endmodule					//end  of stimulus