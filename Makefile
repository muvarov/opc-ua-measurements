ARCH ?= x86

TOPDIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
#KSRC ?= $(TOPDIR)/build_sources/linux
KSRC ?= /opt/Linaro/xdp/linux.git

all:
	${CC} -O0 -g -fPIC -c override.c -o override.o
	$(CC) -O0 -g -fPIC -c xdpsock_user.c -I./include -I$(KSRC)/tools/lib/ \
                -I$(KSRC)/tools/testing/selftests/bpf \
                -I$(KSRC)/tools/testing/selftests/bpf/include \
                -I$(KSRC)/tools/include -I. -I$(KSRC)/tools/lib/bpf \
                -I$(KSRC)/include/uapi -Wl,-Bstatic -L$(KSRC)/tools/lib/bpf/ \
                -Wl,-Bdynamic $(LDFLAGS) -lz -o xdpsock_user.o -Wall

	${CC} -fPIC -z now -shared -Wl,-soname,libover.so -o libover.so override.o xdpsock_user.o libbpf.a -ldl -lpthread -lelf

clean:
	rm -rf libover.so override.o xdpsock_user.o
