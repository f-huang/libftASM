# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fhuang <fhuang@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/11/27 16:52:41 by fhuang            #+#    #+#              #
#    Updated: 2019/02/18 16:14:36 by fhuang           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ===== Editable =====
NAME			:=	libfts.a
# ====================

# ===== Standard =====
NASM			:=	~/.brew/bin/nasm
NASMFLAGS	:=	-f macho64
SRCDIR		:=	src/
OBJDIR		:=	obj/
INCDIR		:=	include/
SRC				:=	ft_strlen.s		\
					ft_strcat.s		\
					ft_strcpy.s		\
					ft_bzero.s		\
					ft_puts.s		\
					ft_islower.s	\
					ft_isupper.s	\
					ft_isalpha.s	\
					ft_isdigit.s
OBJ				:=	$(SRC:%.s=$(OBJDIR)%.o)
INC				:=	-I./$(INCDIR)
CACHEF		:=	.cache_exists
# ====================

# ====== Colors ======
CLEAR		= "\033[2K"
UP			= "\033[A"
EOC			= "\033[0;0m"
BLACK		= "\033[0;30m"
GREY		= "\033[1;30m"
RED			= "\033[0;31m"
GREEN		= "\033[0;32m"
YELLOW	= "\033[0;33m"
BLUE		= "\033[0;34m"
PURPLE	= "\033[0;35m"
CYAN		= "\033[0;36m"
WHITE		= "\033[0;37m"
B_WHITE	= "\033[1;37m"
# ====================

CACHEF		:=	.cache_exists

.PHONY: clean fclean re all

all: $(NAME)

$(NAME): $(OBJ)
	@echo $(B_WHITE)" → libftASM"$(EOC)
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)

$(OBJDIR)%.o: $(SRCDIR)%.s $(CACHEF)
	@$(NASM) $(NASMFLAGS) $< -o $@ $(INC)
	@printf $(B_WHITE)"•"$(EOC)

$(CACHEF):
	@test -d $(OBJDIR) || mkdir $(OBJDIR)
	@test -d $(CACHEF) || touch $(CACHEF)

clean:
	@rm -rf $(OBJDIR) $(CACHEF)

fclean: clean
	@rm -f $(NAME)

re: fclean all
