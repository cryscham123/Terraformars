/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   files_bonus.h                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hyunghki <hyunghki@student.42seoul.kr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/01 02:30:19 by hyunghki          #+#    #+#             */
/*   Updated: 2023/12/15 19:37:56 by hyunghki         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FILES_BONUS_H
# define FILES_BONUS_H

# include <fcntl.h>
# include <unistd.h>
# include <sys/stat.h>
# include <sys/stat.h>
# include "cmd_bonus.h"

# define HEREDOC_MAX_FILE_NAME 4294967295
# define F_HEREDOC_PREFIX "/tmp"

typedef enum e_dup
{
	E_DUP,
	E_DUP2,
}	t_dup;

int		ft_open(int target_fd[2], int fd[2], char *s, int info);
void	ft_close(int fd[2], int origin_fd[2]);
void	ft_dup(int *fd, int *old_fd, t_dup dup_info);
void	ft_pipe(int fd[2]);
int		ft_redirection(int target_fd[2], int fd[2], t_lst *redir, t_lst *ev);
t_lst	*ft_heredoc(char *del, t_lst *ev);

#endif
