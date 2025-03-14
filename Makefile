# Указываем компиляторы и флаги
CC = gcc
ASM = nasm
LD = ld

CFLAGS = -m32 -ffreestanding -Wall
ASMFLAGS = -f elf32
LDFLAGS = -m elf_i386 -Ttext 0x1000

# Указываем исходники и целевые файлы
SRC = sys/kernel/kernel.c
ASM_SRC = sys/boot/boot.asm
OBJ = boot.o kernel.o
TARGET = sytnix.bin

# Правила для компиляции
all: $(TARGET)

$(TARGET): $(OBJ)
	$(LD) $(LDFLAGS) -o $(TARGET) $(OBJ)

kernel.o: $(SRC)
	$(CC) $(CFLAGS) -c $(SRC) -o kernel.o

boot.o: $(ASM_SRC)
	$(ASM) $(ASMFLAGS) $(ASM_SRC) -o boot.o

clean:
	rm -f $(OBJ) $(TARGET)

# Команда для запуска в QEMU
run: $(TARGET)
	qemu-system-i386 -drive format=raw,file=$(TARGET)

.PHONY: all clean run
