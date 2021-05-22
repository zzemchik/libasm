/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rnancee <rnancee@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/13 15:03:49 by rnancee           #+#    #+#             */
/*   Updated: 2021/05/19 00:00:26 by rnancee          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <stdio.h>
# include <stdlib.h>

typedef struct s_list
{
	void			*data;
	struct s_list	*next;
}				t_list;

int		ft_strlen(char *str);
int		ft_write(int fd, char *str, int count);
int		ft_read(int fd, char *str, int count);
char	*ft_strcpy(char *dst, char *src);
int		ft_strcmp(char *srt1, char *str2);
char	*ft_strdup(char *str);
int		ft_list_size(t_list *lst);
int		ft_atoi_base(char *str, char *base);
void	ft_lstadd_front(t_list **lst, t_list *nnew);
void	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());
int		ft_atoi_base(char *str, char *base);
#endif