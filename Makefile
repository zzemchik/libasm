NAME = libasm.a

SOURCES = ft_strlen.s ft_write.s ft_read.s ft_strcpy.s ft_strcmp.s ft_strdup.s 

SOURCES_B = ft_list_size.s ft_list_front.s ft_remove_if.s ft_list_sort.s ft_atoi_base.s

OSOURCE=$(SOURCES:.s=.o)
OSOURCE_B=$(SOURCES_B:.s=.o) $(SOURCES:.s=.o)


%.o: %.s
	nasm -f macho64 $< -o $@

all:$(NAME)
$(NAME): $(OSOURCE)
	ar rc $(NAME) $(OSOURCE)

bonus: $(OSOURCE_B)
	ar rc $(NAME) $(OSOURCE_B)
clean:
	@rm -rf $(OSOURCE) $(OSOURCE_B)
fclean: clean
	@rm -rf $(NAME)
re: fclean all
.PHONY: clean fclean all bonus 

