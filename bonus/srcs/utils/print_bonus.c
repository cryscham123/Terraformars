/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   print_bonus.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hyunghki <hyunghki@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/17 17:28:20 by hyunghki          #+#    #+#             */
/*   Updated: 2023/12/15 19:30:39 by hyunghki         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "utils_bonus.h"
#include "str_bonus.h"

extern int	g_status;

void	ft_putstr_fd(char *s, int fd)
{
	if (s == NULL)
		return ;
	while (*s)
	{
		if (write(fd, s, 1) < 0)
			exit(E_EXIT_FAILURE);
		s++;
	}
}

int	ft_error(char *msg, char *hint, int exit_status)
{
	char	*tmp_1;
	char	*tmp_2;
	char	*total_1;
	char	*total_2;

	total_1 = ft_append("\e[91mError: \e[0m", msg, '\0');
	if (hint != NULL)
	{
		tmp_1 = ft_append("\'", hint, '\0');
		tmp_2 = ft_append(tmp_1, "\'\n", '\0');
		total_2 = ft_append(total_1, tmp_2, '\0');
		free(tmp_1);
		free(tmp_2);
	}
	else
		total_2 = ft_append(total_1, "\n", '\0');
	ft_putstr_fd(total_2, 2);
	free(total_1);
	free(total_2);
	g_status = exit_status;
	return (exit_status);
}
