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
#include <stdio.h>

extern size_t		ft_strlen(const char *str);
extern void			ft_bzero(void *s, size_t n);

int		main(void)
{
	char	to_clean[] = "Il faut bzero() ça.\n";

	printf("%zu\n", ft_strlen(""));
	printf("%zu\n", ft_strlen("Hello, je suis une <String>"));
	printf("%zu\n", ft_strlen(NULL));
	write(1, (char*)to_clean, 22);
	ft_bzero(&to_clean, 22);
	write(1, (char*)to_clean, 22);
	return (0);
}
