module tb_sub_subi;
    reg clk1, clk2;
    integer k;
    pipe_MIPS32 mips (clk1, clk2);

    initial begin
        clk1 = 0; clk2 = 0;
        repeat (20) begin
            #5 clk1 = 1; #5 clk1 = 0;
            #5 clk2 = 1; #5 clk2 = 0;
        end
    end

    initial begin
        for (k = 0; k < 32; k = k + 1)
            mips.Reg[k] = k; // Initialize registers
        
        mips.Mem[0] = 32'h2801001E; // ADDI R1, R0, 30
        mips.Mem[1] = 32'h2802000A; // ADDI R2, R0, 10
        mips.Mem[2] = 32'h00432820; // SUB R3, R1, R2
        mips.Mem[3] = 32'h28240005; // SUBI R4, R1, 5
        mips.Mem[4] = 32'hFC000000; // HLT

        mips.HALTED = 0; mips.PC = 0; mips.TAKEN_BRANCH = 0;

        #100;

        $display("R1 = %d", mips.Reg[1]); // Expected: 30
        $display("R2 = %d", mips.Reg[2]); // Expected: 10
        $display("R3 = %d", mips.Reg[3]); // Expected: 20
        $display("R4 = %d", mips.Reg[4]); // Expected: 25
    end
  
  initial
	begin
      	$dumpfile("mipubs.vcd");
		$dumpvars(0, tb_sub_subi);

		#300 $finish;
	end
endmodule
