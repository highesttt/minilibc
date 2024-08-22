##
## EPITECH PROJECT, 2023
## B-PDG-300-BDX-3-1-PDGRUSH3-melissa.laget [WSL: Ubuntu]
## File description:
## Makefile
##

SRC = 	src/strlen.asm \
		src/strchr.asm \
		src/memcpy.asm \
		src/strcmp.asm \
		src/strncmp.asm \
		src/memmove.asm \
		src/strrchr.asm \
		src/strstr.asm \
		src/strcasecmp.asm \
		src/strpbrk.asm \
		src/strcspn.asm \
		src/memset.asm

SRC_TEST = tests/tests.c

OBJ = $(SRC:.asm=.o)

OBJ_TEST = $(SRC_TEST:.c=.o)

NAME = libasm.so

ASMFLAGS = -f elf64 -D__x86_64__

%.o:%.asm
	@$(AS) $(ASMFLAGS) $< -o $@
		@if test $*.asm; then \
		echo -e "\033[01m\033[33m    Compiling...\033[00m\
		\033[39m$(SRCPATH)$*.asm\033[032m [OK]\033[00m"; fi

AS = nasm

all: $(NAME)

$(NAME): $(OBJ)
	@ld -shared -o $(NAME) $(OBJ)
	@echo -e "\e[36;1m--------------------------------------------------\
	 \e[0m"
	@echo -e "\e[36;1m  \e[0m\e[32;1mCompilation of the library is done\e[0m\e[36;1m"
	@echo -e "\e[36;1m--------------------------------------------------\
	 \e[0m"

clean:
	@rm -f $(OBJ)
	@echo -e "\e[31;1mAll files have been cleaned, except $(NAME)\e[0m"

fclean: clean
	@rm -f $(NAME)
	@echo -e "\e[31;1mAll files have been cleaned\e[0m"

re: fclean all
	@echo -e "\e[32;1mAll files have been reloaded\e[0m"

tests_run: LDFLAGS += -L ./
tests_run: LDLIBS += -lcriterion --coverage -ldl
tests_run: all
	@$(CC) -o unit_tests $(SRC_TEST) $(OBJ) $(LDFLAGS) $(LDLIBS) -g
	@./unit_tests

debug: re
debug: ASMFLAGS += -g

.PHONY: all clean fclean re debug
