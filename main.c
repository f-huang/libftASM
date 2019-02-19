/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fhuang <fhuang@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/02/15 18:20:24 by fhuang            #+#    #+#             */
/*   Updated: 2019/02/18 16:04:06 by fhuang           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stddef.h>
#include <unistd.h>
#include <stdio.h>

extern size_t		ft_strlen(const char *str);
extern void			ft_bzero(void *s, size_t n);
extern char			*ft_strcpy(char *s1, const char *s2);
extern char*		ft_strcat(char *s1, const char *s2);
extern int			ft_puts(const char *str);
extern int			ft_isupper(int c);
extern int			ft_islower(int c);
extern int			ft_isalpha(int c);
extern int			ft_isdigit(int c);
extern int			ft_isascii(int c);
extern int			ft_isalnum(int c);
extern int			ft_isprint(int c);

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
	void	*p;

	puts("\033[0;33mft_bzero :\033[0;0m");

	puts(to_clean);
	ft_bzero(&to_clean, 22);
	write(1, (char*)to_clean, 22);
	ft_bzero(NULL, 20);
	ft_bzero(p, 0);
}

static void		test_strcpy(void)
{
	char		dst[50];
	const char	src1[] = "Rempli la string.!";
	const char	src2[] = "Deuxieme test.";
	char		*ret;

	puts("\033[0;33mft_strcpy :\033[0;0m");
	ret = ft_strcpy(dst, src1);
	printf("%s\n", ret);
	ft_strcpy(dst, NULL);
	ft_strcpy(NULL, src1);
	ret = ft_strcpy(ret, src2);
	printf("%s\n", ret);
}

static void		test_strcat(void)
{
	char		s1[55] = "Premiere phrase123456.";
	char		s2[55] = "Deuxieme phrase.";
	char		*ret;
	size_t		n;

	puts("\033[0;33mft_strcat :\033[0;0m");
	ret = ft_strcat(s1, s2);
	printf("%s\n", ret);
	ft_strcat(s1, NULL);
	ft_strcat(NULL, s2);
}

static void		test_puts(void)
{
	puts("\033[0;33mft_puts :\033[0;0m");
	ft_puts(NULL);
	ft_puts("test, test");
	ft_puts("");
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

int		main(void)
{
	test_strlen();
	test_bzero();
	test_strcpy();
	test_strcat();
	test_puts();
	test_isupper();
	test_islower();
	test_isalpha();
	test_isdigit();
	test_isascii();
	test_isalnum();
	test_isprint();
	return (0);
}
