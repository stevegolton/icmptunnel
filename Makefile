CC=gcc
CFLAGS=-I. -O3 -Wall
DEPS = icmp.h tunnel.h

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

mptunnel: mptunnel.o icmp.o tunnel.o
	$(CC) -o mptunnel icmp.o tunnel.o mptunnel.o $(CFLAGS)

test_server: icmp.o test_server.o
	$(CC) -o test_server icmp.o test_server.o $(CFLAGS)

test_client: icmp.o test_client.o
	$(CC) -o test_client icmp.o test_client.o $(CFLAGS)

test: test_server test_client

all: mptunnel test_server test_client

clean:
	rm -f *.o test_server test_client mptunnel
