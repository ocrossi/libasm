SRC_DIR = srcs
OBJ_DIR = objs
TEST_DIR=tests
SRCS = $(wildcard $(SRC_DIR)/*.s)
OBJS = $(patsubst $(SRC_DIR)/%.s, $(OBJ_DIR)/%.o, $(SRCS))



NAME = libasm.a

CC=gcc
CCFLAGS=-L. -lasm -o
TNAME=tester
TESTER_C=$(addprefix $(TEST_DIR)/, $(addsuffix .c, $(TNAME)))
TESTER_O=$(addprefix $(OBJ_DIR)/, $(addsuffix .o, $(TNAME)))

AS = nasm
ASFLAGS = -f elf64

all: $(NAME)

$(NAME): $(OBJS)
	@echo "Creating library $@"
	ar rcs $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -vp $(OBJ_DIR)
	@echo "Compiling $<"
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(OBJS)
	rm -rf $(OBJ_DIR)

clean_test:
	rm -f $(TESTER_O)
	rm -f $(TNAME)

fclean: clean clean_test
	rm -f $(NAME)

test: all
	$(CC) $(TESTER_C) $(CCFLAGS) $(TNAME)

re: fclean all

.PHONY: all clean
