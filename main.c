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
// extern size_t		ft_strcat(char *s1, const char *s2);

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
	const char	s2[] = "Deuxieme phrase.";
	char		*ret;
	size_t		n;

	puts("\033[0;33mft_strcat :\033[0;0m");
	ret = ft_strcat(s1, s2);
	printf("%s\n", ret);
	ft_strcat(s1, NULL);
	ft_strcat(NULL, s2);
}

int		main(void)
{
	test_strlen();
	test_bzero();
	test_strcpy();
	test_strcat();
	return (0);
}
