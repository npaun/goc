#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

typedef char* string;

char* str_add(char* p, char* q) {
	int len = strlen(p) + strlen(q);
	char* res = (char*)malloc(len);
	strcat(res,p);
	return strcat(res,q);
}

string __golite_num_to_string(int x) {
	string s = malloc(1);
	*s = x;
}

void int_init(int* x) { *x = 0; }
void double_init(double* x) { *x = 0; }
void char_init(char* c) { *c = 0; }
void string_init(char** s) { *s = ""; }

typedef struct {
	unsigned int __size;
	unsigned int __capacity;
	double* __contents ;
} __golite_builtin__slice_double;

void __golite_builtin__slice_double_init(__golite_builtin__slice_double* x) {
	x->__size = 0;
	x->__capacity = 0;
	x->__contents = NULL;
}

__golite_builtin__slice_double __golite_builtin__slice_double_append(__golite_builtin__slice_double* _s, double el) {
	__golite_builtin__slice_double s = *_s;
	if(s.__size == s.__capacity) {
		if (s.__capacity == 0) s.__capacity = 1;
		else s.__capacity *= 2;
		double* new_arr = (double*)malloc((s.__capacity) * sizeof(double));
		if (s.__contents != NULL) memcpy(new_arr, s.__contents, s.__size * sizeof(double));
		s.__contents = new_arr;
	}
	s.__contents[s.__size++] = el;
	return s;
}

double* __golite_builtin__slice_double_index(__golite_builtin__slice_double s, int i) {
	if(i >= 0 && i < s.__size) return s.__contents;
	else { fprintf(stderr, "Out of Bounds index on slice\n"); exit(-1); }
}

int __golite_builtin__slice_double_len(__golite_builtin__slice_double s) {
	return s.__size;
}

int __golite_builtin__slice_double_cap(__golite_builtin__slice_double s) {
	return s.__capacity;
}

int runs_0;
double fn_1;
double __golite__fib_rec(double n_2) {
	{
		if (0 || (n_2 == 0.)) {
			return n_2;
		}
		else {
			if (0 || (n_2 == 1.)) {
				return n_2;
			}
			else {
				{
					return (__golite__fib_rec((n_2 - 2.)) + __golite__fib_rec((n_2 - 1.)));
				}
			}
		}
	}
	return (-1.);
}

__golite_builtin__slice_double fib_memo_table_3;
void __golite__fib_memo_init() {
	__golite_builtin__slice_double new_tbl_4;
__golite_builtin__slice_double_init(&new_tbl_4);
	__golite_builtin__slice_double __golite__tmp_11 = __golite_builtin__slice_double_append(&new_tbl_4, 0.);
	new_tbl_4 = __golite__tmp_11;
	__golite_builtin__slice_double __golite__tmp_9 = __golite_builtin__slice_double_append(&new_tbl_4, 1.);
	new_tbl_4 = __golite__tmp_9;
	__golite_builtin__slice_double __golite__tmp_7 = new_tbl_4;
	fib_memo_table_3 = __golite__tmp_7;
}

double __golite__fib_memo(double n_5) {
	{
		int k_6 = (int)n_5;
		if ((k_6 < __golite_builtin__slice_double_len(fib_memo_table_3))) {
			return (__golite_builtin__slice_double_index(fib_memo_table_3,k_6)[k_6]);
		}
		else {
			{
				double res_7 = (__golite__fib_memo((n_5 - 2.)) + __golite__fib_memo((n_5 - 1.)));
				__golite_builtin__slice_double __golite__tmp_5 = __golite_builtin__slice_double_append(&fib_memo_table_3, res_7);
				fib_memo_table_3 = __golite__tmp_5;
				return res_7;
			}
		}
	}
	return (-1.);
}

double __golite__fib_iter(double n_8) {
	double f0_9 = 0.;
	double f1_10 = 1.;
	{
		n_8--;
		while ((n_8 > 0.)) {
			double ft_11 = (f0_9 + f1_10);
			double __golite__tmp_2 = f1_10;
			double __golite__tmp_3 = ft_11;
			f0_9 = __golite__tmp_2;
			f1_10 = __golite__tmp_3;
		__continue_lbl4:;
			n_8--;
		}
	}
	return f1_10;
}

void __golite__main() {
	printf("%s\n","Naive recursive");
	{
		int i_12 = 0;
		while ((i_12 < runs_0)) {
			printf("%.6e\n",__golite__fib_rec(fn_1));
		__continue_lbl3:;
			i_12++;
		}
	}
	printf("%s\n","Memoized recursive");
	{
		int i_13 = 0;
		while ((i_13 < runs_0)) {
			__golite__fib_memo_init();
			printf("%.6e\n",__golite__fib_memo(fn_1));
		__continue_lbl2:;
			i_13++;
		}
	}
	printf("%s\n","Iterative");
	{
		int i_14 = 0;
		while ((i_14 < runs_0)) {
			printf("%.6e\n",__golite__fib_iter(fn_1));
		__continue_lbl1:;
			i_14++;
		}
	}
}

void init_globals() {
	runs_0 = 4;
	fn_1 = 40.;
	__golite_builtin__slice_double_init(&fib_memo_table_3);
}

void init_funcs() {
	}

int main() {
	init_globals();
	init_funcs();
	__golite__main();
}
