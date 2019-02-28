/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fhuang <fhuang@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/02/15 18:20:24 by fhuang            #+#    #+#             */
/*   Updated: 2019/02/28 14:43:15 by fhuang           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stddef.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>

extern size_t		ft_strlen(const char *str);
extern void			ft_bzero(void *s, size_t n);
extern void			*ft_memset(void *b, int c, size_t len);
extern void			*ft_memcpy(void *dst, void *src, size_t len);

extern char			*ft_strcpy(char *s1, const char *s2);
extern char			*ft_strdup(const char *s);
extern char			*ft_strnew(size_t size);
extern char			*ft_strcat(char *s1, const char *s2);
extern int			ft_puts(const char *str);
extern int			ft_puts_fd(int fd, const char *str);
extern int			ft_isupper(int c);
extern int			ft_islower(int c);
extern int			ft_isalpha(int c);
extern int			ft_isdigit(int c);
extern int			ft_isascii(int c);
extern int			ft_isalnum(int c);
extern int			ft_isprint(int c);
extern int			ft_toupper(int c);
extern int			ft_tolower(int c);

extern void			ft_cat(int fd);


static void		test_strlen(void)
{
	const char	str[] = "Hello, je suis une <String>.";
	puts("\033[0;33mft_strlen :\033[0;0m");
	printf("%-30s %zu\n", str, ft_strlen(str));
	printf("%-30s %zu\n", "-- empty string --", ft_strlen(""));
	printf("%-30s %zu\n", "-- null string --", ft_strlen(NULL));

}

static void		test_bzero(void)
{
	char	to_clean[] = "Il faut bzero() ça.";

	puts("\033[0;33mft_bzero :\033[0;0m");

	puts(to_clean);
	ft_bzero(&to_clean, 22);
	write(1, (char*)to_clean, 22);
}

static void		test_strcpy(void)
{
	const char	src1[] = "Rempli la string.!";
	const char	src2[] = "Deuxieme test.";
	char		*ret;

	ret = malloc(42);
	puts("\033[0;33mft_strcpy :\033[0;0m");
	ret = ft_strcpy(ret, src1);
	printf("%s\n", ret);
	ft_strcpy(ret, NULL);
	ft_strcpy(NULL, src1);
	ret = ft_strcpy(ret, src2);
	printf("%s\n", ret);
	free(ret);
}

static void		test_strcat(void)
{
	char		s1[75] = "Premiere phrase.";
	const char		s2[] = "Deuxieme phrase.";
	const char		s3[] = "Troisieme phrase.";
	char		*ret;

	puts("\033[0;33mft_strcat :\033[0;0m");
	ret = ft_strcat(s1, s2);
	printf("%s\n", ret);
	ret = ft_strcat(s1, s3);
	printf("%s\n", ret);
	ft_strcat(s1, NULL);
	ft_strcat(NULL, s2);
}

static void		test_puts(void)
{
	int		ret = 0;
	int		ret2 = 0;

	puts("\033[0;33mft_puts :\033[0;0m");
	if ((ret = ft_puts(NULL)) != (ret2 = puts(NULL)))
		printf("ERROR ft_puts(%s): %d %d\n", "(null)", ret, ret2);
	if ((ret = ft_puts("test_test")) != (ret2 = puts("test_test")))
		printf("ERROR ft_puts(%s): %d %d\n", "test_test", ret, ret2);
	if ((ret = ft_puts("test2\0n_test")) != (ret2 = puts("test2\0n_test")))
		printf("ERROR ft_puts(%s): %d %d\n", "test2\0n_test", ret, ret2);
	if ((ret = ft_puts("")) != (ret2 = puts("")))
		printf("ERROR ft_puts(%s): %d %d\n", "", ret, ret2);
}

static void		test_puts_fd(void)
{
	int		ret;
	char	s[] = "test, test\n";

	puts("\033[0;33mft_puts_fd :\033[0;0m");
	ret = ft_puts_fd(2, NULL);
	ret = ft_puts_fd(1, "essai.");
	ret = ft_puts_fd(1, s);
	ft_puts_fd(1, "");
}

static void		test_isupper(void)
{
	puts("\033[0;33mft_isupper :\033[0;0m");
	printf("%i\n", ft_isupper('A'));
	printf("%i\n", ft_isupper('P'));
	printf("%i\n", ft_isupper('Z'));
	printf("%i\n", ft_isupper(0x40));
	printf("%i\n", ft_isupper(0x5b));
}

static void		test_islower(void)
{
	puts("\033[0;33mft_islower :\033[0;0m");
	printf("%i\n", ft_islower('a'));
	printf("%i\n", ft_islower('p'));
	printf("%i\n", ft_islower('z'));
	printf("%i\n", ft_islower(0x60));
	printf("%i\n", ft_islower(0x7b));
}

static void		test_isalpha(void)
{
	puts("\033[0;33mft_isalpha :\033[0;0m");
	printf("%i\n", ft_isalpha('a'));
	printf("%i\n", ft_isalpha('Z'));
	printf("%i\n", ft_isalpha('E'));
	printf("%i\n", ft_isalpha('h'));
	printf("%i\n", ft_isalpha(0x60));
	printf("%i\n", ft_isalpha(0x0));
	printf("%i\n", ft_isalpha('-'));
}

static void		test_isdigit(void)
{
	puts("\033[0;33mft_isdigit :\033[0;0m");
	printf("%i\n", ft_isdigit('4'));
	printf("%i\n", ft_isdigit('0'));
	printf("%i\n", ft_isdigit('9'));
	printf("%i\n", ft_isdigit(10));
	printf("%i\n", ft_isdigit(0x5));
}

static void		test_isascii(void)
{
	puts("\033[0;33mft_isascii :\033[0;0m");
	printf("%i\n", ft_isascii('a'));
	printf("%i\n", ft_isascii(0x60));
	printf("%i\n", ft_isascii(0x7b));
	printf("%i\n", ft_isascii(0x80));
	printf("%i\n", ft_isascii(-1));
}

static void		test_isalnum(void)
{
	puts("\033[0;33mft_isalnum :\033[0;0m");
	printf("%i\n", ft_isalnum('a'));
	printf("%i\n", ft_isalnum('7'));
	printf("%i\n", ft_isalnum('0'));
	printf("%i\n", ft_isalnum(0x60));
	printf("%i\n", ft_isalnum(0x7b));
}

static void		test_isprint(void)
{
	puts("\033[0;33mft_isprint :\033[0;0m");
	printf("%i\n", ft_isprint(0x3e));
	printf("%i\n", ft_isprint(0x56));
	printf("%i\n", ft_isprint(0x4a));
	printf("%i\n", ft_isprint(0x01));
	printf("%i\n", ft_isprint(0x7f));
}

static void		test_toupper(void)
{
	puts("\033[0;33mft_toupper :\033[0;0m");
	printf("%c\n", ft_toupper('h'));
	printf("%c\n", ft_toupper('A'));
	printf("%c\n", ft_toupper('z'));
	printf("%c\n", ft_toupper(0x60));
	printf("%c\n", ft_toupper(0x7b));
}

static void		test_tolower(void)
{
	puts("\033[0;33mft_tolower :\033[0;0m");
	printf("%c\n", ft_tolower('H'));
	printf("%c\n", ft_tolower('a'));
	printf("%c\n", ft_tolower('Z'));
	printf("%c\n", ft_tolower(0x60));
	printf("%c\n", ft_tolower(0x7b));
}

static void		test_memset(void)
{
	void			*ret;
	void			*p;

	p = malloc(30);
	puts("\033[0;33mft_memset :\033[0;0m");
	printf("%p\n", (char*)p);
	ret = ft_memset(NULL, 'a', 30);
	ret = ft_memset(p, 'a', 30);
	printf("%p\n", (char*)ret);
	printf("%s\n", (char*)ret);
	ret = ft_memset(ret, '*', 9);
	printf("%s\n", (char*)ret);
	ret = ft_memset(ret, '6', 2);
	printf("%s\n", (char*)ret);
	free(p);
}

static void		test_memcpy(void)
{
	void		*ret;
	void		*p;
	const char		src[50] = "123456789abcdefghijklmn";

	ret = NULL;
	p = malloc(42);
	puts("\033[0;33mft_memcpy :\033[0;0m");
	ret = ft_memcpy(p, (void*)src, 12);
	printf("%s\n", (char*)ret);
	ret = ft_memcpy(p, (void*)src, 20);
	printf("%s\n", (char*)ret);
	free(p);
}

static void		test_strdup(void)
{
	char		*ret;

	puts("\033[0;33mft_strdup :\033[0;0m");
	ret = ft_strdup(NULL);
	printf("%p\n", ret);
	ret = ft_strdup("Hello. Ceci est un test");
	if (!ret)
		return ;
	printf("%s\n", ret);
	printf("%p\n", ret);
	free(ret);
}

static void		test_strnew(void)
{
	char		*ret;

	puts("\033[0;33mft_strnew :\033[0;0m");
	ret = ft_strnew(5);
	ret[2] = '2';
	write(1, ret, 5);
	free(ret);
}

static void		test_cat(char **av)
{
	const char filename[] = "./main.c";
	int		fd;

	puts("\033[0;33mft_cat :\n\033[0;0m");
	fd = open(filename, O_RDONLY);
	ft_cat(fd);
	close(fd);
	printf("file: %s | fd = %i\n", filename, fd);
	fd = open(av[0], O_RDONLY);
	ft_cat(fd);
	close(fd);
	printf("file: %s | fd = %i\n", av[0], fd);
	fd = -1;
	ft_cat(fd);
	printf("fd = %i\n",  fd);
}


int		main(int ac, char **av)
{
	test_strlen();
	test_bzero();
	test_strcpy();
	test_strcat();
	test_puts();
	test_puts_fd();
	test_isupper();
	test_islower();
	test_isalpha();
	test_isdigit();
	test_isascii();
	test_isalnum();
	test_isprint();
	test_toupper();
	test_tolower();
	test_memset();
	test_memcpy();
	test_strdup();
	test_strnew();
	test_cat(av);
	(void)ac;
	return (0);
}
