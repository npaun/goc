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

int __golite__var_global_1 = 10;
int __golite__sideEffect() {
	int __golite__tmp_11 = 69;
	__golite__var_global_1 = __golite__tmp_11;
	return 5;
}

__golite_builtin__slice_double __golite__addressableSlice() {
	__golite_builtin__slice_double __golite__var_a_2;
__golite_builtin__slice_double_init(&__golite__var_a_2);
	__golite_builtin__slice_double __golite__tmp_9 = __golite_builtin__slice_double_append(&__golite__var_a_2, 42.);
	__golite__var_a_2 = __golite__tmp_9;
	return __golite__var_a_2;
}

void __golite__main() {
	int __golite__var_a_3 = 5;
	int __golite__var_b_4 = 5;
	__golite__var_a_3+=__golite__var_b_4;
	printf("%d\n",__golite__var_a_3);
	int __golite__var_c_5;
int_init(&__golite__var_c_5);
	int __golite__var_d_6;
int_init(&__golite__var_d_6);
	int __golite__tmp_6 = 10;
	int __golite__tmp_7 = 15;
	__golite__var_c_5 = __golite__tmp_6;
	__golite__var_d_6 = __golite__tmp_7;
	printf("%d\n",__golite__var_c_5);
	printf("%d\n",__golite__var_d_6);
	printf("%d\n",__golite__var_global_1);
	int __golite__tmp_4 = __golite__sideEffect();
;
	printf("%d\n",__golite__var_global_1);
	double __golite__tmp_2 = 42.1;
	(__golite_builtin__slice_double_index(__golite__addressableSlice(),0)[0]) = __golite__tmp_2;
}

int main() {
	__golite__main();
}
