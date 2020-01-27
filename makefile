#
# signet: easy verification
# (c) Kied Llaentenn
# See the LICENSE for more information
#

NAME	= signet
WARNING	= -Wall -Wextra -pedantic -Wmissing-prototypes \
	  -Wold-style-definition -Werror

INC	= -I. -Isub/ccommon/

CC	= gcc
CFLAGS	= -std=c99 -O3 $(WARNING) $(INC)
LDFLAGS	= -fuse-ld=lld

SRC	= main.c
OBJ	= $(SRC:.c=.o)

DESTDIR = /
PREFIX	= /usr/local/

all: $(NAME)

clean:
	rm -f $(NAME) $(OBJ)

.c.o:
	@echo "\tCC\t\t$@"
	@$(CC) $(CFLAGS) -c $<

$(NAME): $(OBJ) $(TRMBOX)
	@echo "\tLD\t\t$(NAME)"
	@$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)

install: $(NAME)
	@echo "\tINSTALL\t\t$(NAME)\t$(DESTDIR)/$(PREFIX)/bin/$(NAME)"
	@install -m755 ./$(NAME) $(DESTDIR)/$(PREFIX)/bin/$(NAME)

uninstall:
	@echo "\tRM\t\t$(DESTDIR)/$(PREFIX)/bin/$(NAME)"
	@rm -f $(DESTDIR)/$(PREFIX)/bin/$(NAME)
.PHONY: all clean install
