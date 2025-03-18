CC= g++
CFLAGS= -pthread -std=c++17
CHECKFLAGS= -Wall -Werror -Wextra
SRC= *.cc

.DEFAULT_GOAL := pgproxy

pgproxy:
	$(CC) $(CFLAGS) $(CHECKFLAGS) -o $@ $(SRC)