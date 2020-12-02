#
# signet: easily compare certificates, hashes, etc
# https://github.com/lptstr/signet
#
# (c) Kiëd Llaentenn and contributors
# See the LICENSE.md file for more information
#

CMD = @

DESTDIR =
PREFIX  = /usr/local

CC = clang
LD = gold

RELEASE_CFLAGS  = -Os
RELEASE_LDFLAGS = -march=native -flto -s
DEBUG_CFLAGS    = -Og -ggdb -fsanitize=address
DEBUG_LDFLAGS   =
