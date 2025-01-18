# Pipelined-MIPS32-Processor-Simulation
This project implements a 5-stage pipelined MIPS32 processor in Verilog, simulating the fetch, decode, execute, memory, and write-back stages. A testbench validates correct execution of arithmetic, logical, and control-flow instructions, as well as register and memory operations.


# MIPS Architecture Overview
MIPS (Microprocessor without Interlocked Pipeline Stages) is a reduced instruction set computing (RISC) architecture developed in the 1980s by MIPS Computer Systems. It is designed to be simple, efficient, and highly pipelined, making it ideal for both academic purposes and real-world applications, especially in embedded systems, networking, and high-performance computing.

- Program Counter (PC):
Holds the address of the current instruction being executed.
The PC is incremented after each instruction fetch, unless a branch or jump is executed.

- Instruction Memory:
Stores the instructions in a program.
The instruction at the address held by the PC is fetched during the instruction fetch cycle.

- Registers (32 General-Purpose Registers):
MIPS has 32 general-purpose registers, each 32 bits wide.
They store intermediate values during program execution.
Register 0 (R0) is always set to zero.

- ALU (Arithmetic Logic Unit):
Performs arithmetic and logic operations such as addition, subtraction, multiplication, AND, OR, etc.
Operates on values in the registers or immediate values.

- Data Memory:
Stores data (e.g., from load/store operations).
It is used for accessing and storing data during the execution of load and store instructions.

- Control Unit:
Decodes the instruction and generates control signals for the various components.
It directs the flow of data between the registers, ALU, memory, and other parts of the processor.

- Multiplexer (MUX):
Routes data from various sources (e.g., registers, memory) to the appropriate destinations (e.g., ALU input, register file).
Used in various parts of the MIPS pipeline to control data flow.

- Pipeline Stages (in modern MIPS implementations):
IF (Instruction Fetch): Fetch the instruction from memory using the PC.
ID (Instruction Decode): Decode the instruction and fetch the registers.
EX (Execute): Perform the ALU operation or address calculation.
MEM (Memory Access): Access memory (load or store).
WB (Write Back): Write the result back to the register file.

# MIPS Instructions
The MIPS instruction set is simple and categorized into three types:

- R-type (Register-type) Instructions:
Used for arithmetic and logical operations that take data from registers.
Format: opcode | rs | rt | rd | shamt | funct

- I-type (Immediate-type) Instructions:
Used for operations with an immediate value (a constant).
Format: opcode | rs | rt | immediate

- J-type (Jump-type) Instructions:
Used for jumping to a specific address.
Format: opcode | address

