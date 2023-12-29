/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils2_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hyunghki <hyunghki@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/17 17:28:20 by hyunghki          #+#    #+#             */
/*   Updated: 2023/12/15 19:36:55 by hyunghki         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "built_in_bonus.h"
#include "utils_bonus.h"
#include "str_bonus.h"

static void	ft_exit_print(t_bool is_forked, char *data)
{
	if (is_forked == E_FALSE)
		ft_putstr_fd("exit\n", 2);
	exit(ft_error(F_ERROR_EXIT, data, E_BUILT_IN_EXIT_FAIL));
}

int	ft_av_exit(char *data, t_bool is_forked)
{
	long long	res;
	int			sign;
	int			i;

	res = 0;
	i = 0;
	sign = -(data[i] == '-') + (data[i] != '-');
	i += (data[i] == '+' || data[i] == '-');
	while (data[i])
	{
		if (res == 922337203685477580 && data[i] == '8' && sign == -1)
			return (0);
		if (data[i] < '0' || data[i] > '9' || res < 0)
			ft_exit_print(is_forked, data);
		res = res * 10 + data[i] - '0';
		i++;
	}
	if (res < 0 || ((data[0] == '-' || data[0] == '+') && i == 1) || i == 0)
		ft_exit_print(is_forked, data);
	return (res * sign);
}
