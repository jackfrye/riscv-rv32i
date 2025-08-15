B_FILES = helloworld
SRC_FILES = $(B_FILES:%=%.s)
O_FILES = $(SRC_FILES:%.s=%.o)

all: $(B_FILES)

%: %.s
	../../bin/riscv32-unknown-elf-as -o $@.o $<
	../../bin/riscv32-unknown-elf-ld -o $@ $@.o

clean:
	rm -f $(O_FILES) $(B_FILES)
