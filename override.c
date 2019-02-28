#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>


extern void af_xdp_init(void);
extern ssize_t af_xdp_recvfrom(void *buf);

ssize_t recvfrom(int sockfd, void *buf, size_t len, int flags,
                 struct sockaddr *src_addr, socklen_t *addrlen)
{
	return af_xdp_recvfrom(buf);
}


int select(int nfds, fd_set *readfds, fd_set *writefds,
                  fd_set *exceptfds, struct timeval *timeout)
{
	return 1;
}

int accept4(int sockfd, struct sockaddr *addr,
                   socklen_t *addrlen, int flags)
{
	return 0;
}

void __attribute__ ((constructor)) override_init(void)
{
	af_xdp_init();
	printf("%s ok\n", __func__);
}
