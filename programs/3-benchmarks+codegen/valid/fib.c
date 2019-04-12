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
		double* new_arr = malloc(s.__size * sizeof(double));
		memcpy(new_arr, s.__contents, s.__size * sizeof(double));
		s.__capacity *= 2;
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

int runs$0;
double fn$1;
double __golite__fib_rec(double n$2) {
	{
		if (0 || (n$2 == 0.)) {
			return n$2;
		}
		else {
			if (0 || (n$2 == 1.)) {
				return n$2;
			}
			else {
				{
					return (__golite__fib_rec((n$2 - 2.)) + __golite__fib_rec((n$2 - 1.)));
				}
			}
		}
	}
	return (-1.);
}

__golite_builtin__slice_double fib_memo_table$3;
void __golite__fib_memo_init() {
	__golite_builtin__slice_double new_tbl$4;
__golite_builtin__slice_double_init(&new_tbl$4);
	__golite_builtin__slice_double __golite__tmp_11 = __golite_builtin__slice_double_append(&new_tbl$4, 0.);
	new_tbl$4 = __golite__tmp_11;
	__golite_builtin__slice_double __golite__tmp_9 = __golite_builtin__slice_double_append(&new_tbl$4, 1.);
	new_tbl$4 = __golite__tmp_9;
	__golite_builtin__slice_double __golite__tmp_7 = new_tbl$4;
	fib_memo_table$3 = __golite__tmp_7;
}

double __golite__fib_memo(double n$5) {
	{
		int k$6 = (int)n$5;
		if ((k$6 < __golite_builtin__slice_double_len(fib_memo_table$3))) {
			return (__golite_builtin__slice_double_index(fib_memo_table$3,k$6)[k$6]);
		}
		else {
			{
				double res$7 = (__golite__fib_memo((n$5 - 2.)) + __golite__fib_memo((n$5 - 1.)));
				__golite_builtin__slice_double __golite__tmp_5 = __golite_builtin__slice_double_append(&fib_memo_table$3, res$7);
				fib_memo_table$3 = __golite__tmp_5;
				return res$7;
			}
		}
	}
	return (-1.);
}

double __golite__fib_iter(double n$8) {
	double f0$9 = 0.;
	double f1$10 = 1.;
	{
		n$8--;
		while ((n$8 > 0.)) {
			double ft$11 = (f0$9 + f1$10);
			double __golite__tmp_2 = f1$10;
			double __golite__tmp_3 = ft$11;
			f0$9 = __golite__tmp_2;
			f1$10 = __golite__tmp_3;
		__continue_lbl4:;
			n$8--;
		}
	}
	return f1$10;
}

void __golite__main() {
	printf("%s\n","Naive recursive");
	{
		int i$12 = 0;
		while ((i$12 < runs$0)) {
			printf("%.6e\n",__golite__fib_rec(fn$1));
		__continue_lbl3:;
			i$12++;
		}
	}
	printf("%s\n","Memoized recursive");
	{
		int i$13 = 0;
		while ((i$13 < runs$0)) {
			__golite__fib_memo_init();
			printf("%.6e\n",__golite__fib_memo(fn$1));
		__continue_lbl2:;
			i$13++;
		}
	}
	printf("%s\n","Iterative");
	{
		int i$14 = 0;
		while ((i$14 < runs$0)) {
			printf("%.6e\n",__golite__fib_iter(fn$1));
		__continue_lbl1:;
			i$14++;
		}
	}
}

void init_globals() {
	runs$0 = 4;
	fn$1 = 40.;
	__golite_builtin__slice_double_init(&fib_memo_table$3);
}

void init_funcs() {
	}

int main() {
	init_globals();
	init_funcs();
	__golite__main();
}
