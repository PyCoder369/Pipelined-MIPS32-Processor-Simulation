module tb_mul;
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
        
        mips.Mem[0] = 32'h28010003; // ADDI R1, R0, 3
        mips.Mem[1] = 32'h28020004; // ADDI R2, R0, 4
        mips.Mem[2] = 32'h00222820; // MUL R3, R1, R2
        mips.Mem[3] = 32'hFC000000; // HLT

        mips.HALTED = 0; mips.PC = 0; mips.TAKEN_BRANCH = 0;

        #100;

        $display("R3 = %d", mips.Reg[3]); // Expected: 12
    end
  
  initial
	begin
		$dumpfile("mips.vcd");
		$dumpvars(0, tb_mul);

		#300 $finish;
	end
  
endmodule
