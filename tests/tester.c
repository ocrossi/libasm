#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>


#define BUF_SIZE 500

extern size_t	ft_strlen(const char *str);
extern char *	ft_strcpy(char *dest, const char *src);
extern int	ft_strcmp(const char *s1, const char *s2);
extern ssize_t	ft_write(int fd, const void *buf, size_t count);
extern ssize_t	ft_read(int fd, void *buf, size_t count); 
extern char*	ft_strdup(const char* s); 

int main(int ac, char **av) 
{
	if (ac != 2) {
		printf("expecting one argument from command line, exiting program ...");
		return -1;
	}

	// strlen
	printf("argument to be tested is %s\n", av[1]);
	size_t arg_size = ft_strlen(av[1]);
	printf("len of tested arg = %lu\n", arg_size);

	// strcpy
	char *copy = (char *)malloc(sizeof(char) * arg_size);
	ft_strcpy(copy, av[1]);
	printf("copied string is [%s]\n", copy);

	// strcmp
	char *fail = "0123";
	int fail_mine   = ft_strcmp(fail, av[1]);
	int fail_theirs = ft_strcmp(fail, av[1]);
	int success_mine   = ft_strcmp(av[1], copy);
	int success_theirs =  strcmp(av[1], copy);
	printf("failure res mine %d, classic %d\n", fail_mine, fail_theirs);
	printf("success res mine %d, classic %d\n", success_mine, success_theirs);

	// write
	printf("my write\n");
	ssize_t mret = ft_write(1, "yessay ca write!\n", 18);
	printf("ret val = %lu\n", mret);
	printf("their write\n");
	ssize_t tret = write(1, "yessay ca write!\n", 18);
	printf("ret val = %lu\n", tret);

	// read
	char buf1[BUF_SIZE];
	char buf2[BUF_SIZE];
	printf("reading ...\n");
	mret = ft_read(1, buf1, 5);
	printf("my read \n%sret val = %lu\n", buf1, mret);
	printf("reading ...\n");
	tret = read(1, buf2, 5);
	printf("their read \n%sret val = %lu\n", buf2, tret);

	// strdup
	char str1[] = "test my strdup";
	char str2[] = "test    strdup";

	printf("mine 	%s\n", ft_strdup(str1));
	printf("theirs 	%s\n", strdup(str2));

	return 0;
}
