/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rnancee <rnancee@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/13 15:04:18 by rnancee           #+#    #+#             */
/*   Updated: 2021/05/19 13:51:13 by rnancee          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

int		ft_atoi_base_error(char *base)
{
	int	i;
	int	j;

	i = 0;
	while (base[i])
	{
		j = 0;
		while (base[j])
		{
			if (base[i] == base[j] && i != j)
				return (0);
			j++;
		}
		if (base[i] == ' ' || base[i] == '\f' || base[i] == '\n' ||
				base[i] == '\r' || base[i] == '\t' || base[i] == '\v' ||
				base[i] == '-' || base[i] == '+')
			return (0);
		i++;
	}
	return (i);
}

int		ft_atoi_base_test(char str, char *base)
{
	int i;

	i = -1;
	while (base[++i])
		if (str == base[i])
			return (i);
	return (-1);
}

int		ft_atoi_base_search(char *str, int *i)
{
	int mult;

	mult = 1;
	while (str[*i] == ' ' || str[*i] == '\f' || str[*i] == '\n' ||
		str[*i] == '\r' || str[*i] == '\t' || str[*i] == '\v')
		*i += 1;
	while (str[*i] == '-' || str[*i] == '+')
	{
		if (str[*i] == '-')
			mult *= -1;
		*i += 1;
	}
	return (mult);
}

int		ft_atoi_base1(char *str, char *base)
{
	int		i;
	int		mult;
	int		nb;
	int		tmp;
	int		len;

	nb = 0;
	i = 0;
	len = ft_atoi_base_error(base);
	if (len >= 2)
	{
		mult = ft_atoi_base_search(str, &i);
		tmp = ft_atoi_base_test(str[i], base);
		while (tmp != -1)
		{
			nb = (nb * len) + tmp;
			i++;
			tmp = ft_atoi_base_test(str[i], base);
		}
		return (nb *= mult);
	}
	return (0);
}


int qwe(void *a, void *b)
{
	if (*(int *)a == *(int *)b)
		return (1);
	return 0;
}

int qwe1(void *a, void *b)
{
	if (*(int *)a > *(int *)b)
		return (1);
	return 0;
}

void	ft_list_sort1(t_list **begin_list, int (*cmp)())
{
	t_list	*ptr;
	t_list	*ptr2;
	t_list	*next;

	ptr = *begin_list;
	while (ptr)
	{
		ptr2 = ptr;
		while (ptr2->next)
		{
			if ((*cmp)(ptr->data, ptr2->next->data) > 0)
			{
				next = ptr->data;
				ptr->data = ptr->next->data;
				ptr->next->data = next;
			}
			ptr2 = ptr2->next;
		}
		ptr = ptr->next;
	}
}


void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)())
{
	t_list *root;
	t_list *node;
	t_list *next;

	root = *begin_list;
	node = *begin_list;
	while (root)
	{
		next = (*root).next;
		if ((cmp)(root->data, data_ref) == 0)
		{
			if (root == *begin_list)
			{
				*begin_list = next;
			}
			node->next = next;
			free(root);
		}
		node = root;
		root = next;
	}
}

int main()
{

	char str[100];
	char *d;
	char *s;
	t_list *list;
	t_list *list1;
	t_list *list2;
	d = malloc(4);
	d[0] = '1';
	d[1] = '2';
	d[2] = '3';
	d[3] = 0;

	list = malloc(sizeof(t_list));
	list->data = ft_strdup(d);
	list->next = malloc(sizeof(t_list));
	list->next->data = ft_strdup("hjhjk");
	list->next->next = 0;
	// while (list)
	// {
	// 	printf("%s\n", list->data);
	// 	list = list->next;
	// }

	list1 = malloc(sizeof(t_list));
	list1->data = ft_strdup(d);
	list1->next = malloc(sizeof(t_list));
	list1->next->data = ft_strdup("hjhjk");
	list1->next->next = 0;
	printf(" - |%d|", ft_strcmp("truc", "truc"));
	printf(" - |%d|", ft_strcmp("abc", "ab"));
	printf(" - |%d|\n", ft_strcmp("ab", "abc"));
	printf("%d\n", ft_strlen("sdf"));
	ft_read(1, str, 1);
	ft_write(1, str, 1);
	ft_write(1, "\n", 1);
	printf("%s\n", ft_strcpy(str, "sdfdf"));

	list2 = malloc(sizeof(t_list));
	list2->next = malloc(sizeof(t_list));
	list2->next->next = malloc(sizeof(t_list));
	list2->data = malloc(sizeof(int));
	list2->next->data = malloc(sizeof(int));
	list2->next->next->data = malloc(sizeof(int));
	*(int *)(list2->data) = 7;
	*(int *)(list2->next->data) = 2;
	*(int *)(list2->next->next->data) = 1;
	list2->next->next->next = 0;
	printf("%d\n", ft_strlen(""));	
	ft_write(1, "str99999\n", 5);
	printf("\n%d\n", ft_strcmp("hj", "c"));
	s = ft_strdup(d);
	printf("%s\n", s);
	printf("%d\n", ft_list_size(list));
	ft_lstadd_front(&list, list1);
	while (list)
	{
		printf("%s\n", list->data);
		list = list->next;
	}
	
	int *e;
	e = malloc(sizeof(int));
	*e = 7;
	ft_list_sort(&list2, qwe1);
	ft_remove_if(&list2, e, qwe);
	while (list2)
	{
		printf("%d\n", *(int *)list2->data);
		list2 = list2->next;
	}
	
	printf("%d\n", ft_atoi_base("1234", "0123456789"));
	printf("%d\n", ft_atoi_base("1234", "1234567890"));

}







