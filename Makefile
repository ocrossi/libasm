LIBNAME = libasm.a

SRC_DIR = srcs
OBJ_DIR = objs
SRCS = $(wildcard $(SRC_DIR)/*.s)
OBJS = $(SRCS:$(SRC_DIR)/%.s=$(OBJ_DIR)/%.o)

AS = nasm
FILE_FLAGS = -f elf64
DBGFLAGS = -g


all: $(NAME)

$(NAME): $(OBJS)
	@echo "srcs : $(SRCS)"
	@echo "objs : $(OBJS)"
	ar rcs $(NAME) $(OBJS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -pv $(OBJ_DIR)
	$(AS) $(DBGFLAGS) $(FILE_FLAGS) -o $@ $<

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
