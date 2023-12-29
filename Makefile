# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyunghki <hyunghki@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/07 06:51:22 by hyunghki          #+#    #+#              #
#    Updated: 2023/12/15 19:52:18 by hyunghki         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME= minishell
LDFLAGS= -L$(HOME)/.brew/opt/readline/lib
CFLAGS= -Wall -Werror -Wextra
DEBUG_FLAGS= -g3 -fsanitize=address
LIBS= -lreadline
INCLUDE= -Imandatory/includes/cmd \
		 -Imandatory/includes/parse \
		 -Imandatory/includes/utils \
		 -Ibonus/includes/cmd \
		 -Ibonus/includes/parse \
		 -Ibonus/includes/utils \
		 -I$(HOME)/.brew/opt/readline/include
SRC_DIR= ./mandatory/srcs/
BSRC_DIR= ./bonus/srcs/
SRCS= $(SRC_DIR)main.c \
	  $(SRC_DIR)utils/lst/env_lst.c \
	  $(SRC_DIR)utils/lst/lst.c \
	  $(SRC_DIR)utils/lst/lst_free.c \
	  $(SRC_DIR)utils/lst/str_lst.c \
	  $(SRC_DIR)utils/str/str.c \
	  $(SRC_DIR)utils/str/str2.c \
	  $(SRC_DIR)utils/str/str3.c \
	  $(SRC_DIR)utils/heap_manage.c \
	  $(SRC_DIR)utils/print.c \
	  $(SRC_DIR)utils/files.c \
	  $(SRC_DIR)utils/heredoc.c \
	  $(SRC_DIR)utils/signal.c \
	  $(SRC_DIR)parse/parse.c \
	  $(SRC_DIR)parse/split/split.c \
	  $(SRC_DIR)parse/split/split_utils.c \
	  $(SRC_DIR)parse/split/parse_cmd.c \
	  $(SRC_DIR)parse/expansion/expansion.c \
	  $(SRC_DIR)parse/expansion/wild_card.c \
	  $(SRC_DIR)cmd/cmd_struct/mk_cmd.c \
	  $(SRC_DIR)cmd/cmd_struct/cmd_exe.c \
	  $(SRC_DIR)cmd/cmd_struct/cmd_utils.c \
	  $(SRC_DIR)cmd/exe/exe_cmd.c \
	  $(SRC_DIR)cmd/exe/exe_utils.c \
	  $(SRC_DIR)cmd/exe/process.c \
	  $(SRC_DIR)cmd/built_in/interface.c \
	  $(SRC_DIR)cmd/built_in/interface2.c \
	  $(SRC_DIR)cmd/built_in/utils.c \
	  $(SRC_DIR)cmd/built_in/utils2.c
BSRCS=	$(BSRC_DIR)main_bonus.c \
		$(BSRC_DIR)utils/lst/env_lst_bonus.c \
		$(BSRC_DIR)utils/lst/lst_bonus.c \
		$(BSRC_DIR)utils/lst/lst_free_bonus.c \
	  	$(BSRC_DIR)utils/lst/str_lst_bonus.c \
	  	$(BSRC_DIR)utils/str/str_bonus.c \
	  	$(BSRC_DIR)utils/str/str2_bonus.c \
	  	$(BSRC_DIR)utils/str/str3_bonus.c \
	  	$(BSRC_DIR)utils/heap_manage_bonus.c \
	  	$(BSRC_DIR)utils/print_bonus.c \
	  	$(BSRC_DIR)utils/files_bonus.c \
	  	$(BSRC_DIR)utils/heredoc_bonus.c \
	  	$(BSRC_DIR)utils/signal_bonus.c \
	  	$(BSRC_DIR)parse/parse_bonus.c \
	  	$(BSRC_DIR)parse/split/split_bonus.c \
	  	$(BSRC_DIR)parse/split/split_utils_bonus.c \
	  	$(BSRC_DIR)parse/split/parse_cmd_bonus.c \
	  	$(BSRC_DIR)parse/expansion/expansion_bonus.c \
	  	$(BSRC_DIR)parse/expansion/wild_card_bonus.c \
	  	$(BSRC_DIR)cmd/cmd_struct/mk_cmd_bonus.c \
	  	$(BSRC_DIR)cmd/cmd_struct/cmd_exe_bonus.c \
	  	$(BSRC_DIR)cmd/cmd_struct/cmd_utils_bonus.c \
	  	$(BSRC_DIR)cmd/exe/exe_cmd_bonus.c \
	  	$(BSRC_DIR)cmd/exe/exe_utils_bonus.c \
	  	$(BSRC_DIR)cmd/exe/process_bonus.c \
	  	$(BSRC_DIR)cmd/built_in/interface_bonus.c \
	  	$(BSRC_DIR)cmd/built_in/interface2_bonus.c \
	  	$(BSRC_DIR)cmd/built_in/utils_bonus.c \
	  	$(BSRC_DIR)cmd/built_in/utils2_bonus.c
OBJS= $(SRCS:.c=.o)
BOBJS= $(BSRCS:.c=.o)

ifdef WITH_BONUS
	OBJ_FILE = $(BOBJS)
else
	OBJ_FILE = $(OBJS)
endif

all: $(NAME)

.PHONY: re clean fclean bonus

re:
	make fclean
	make all

clean:
	rm -f $(OBJS)
	rm -f $(BOBJS)

fclean:
	make clean
	rm -f $(NAME)

bonus:
	@make WITH_BONUS=1 all

$(NAME): $(OBJ_FILE)
	$(CC) -o $@ $^ $(LDFLAGS) $(LIBS) $(DEBUG_FLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $< $(INCLUDE) $(DEBUG_FLAGS)
