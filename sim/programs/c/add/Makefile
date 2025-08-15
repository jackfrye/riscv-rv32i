add.o: add.c 
	../../bin/riscv32-unknown-elf-gcc -c add.c -o add.o

add: add.o
	../../bin/riscv32-unknown-elf-gcc add.o -o add
	
clean:
	rm add.o
