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

int global$0;
int __golite__sideEffect() {
	int __golite__tmp_11 = 69;
	global$0 = __golite__tmp_11;
	return 5;
}

__golite_builtin__slice_double __golite__addressableSlice() {
	__golite_builtin__slice_double a$1;
__golite_builtin__slice_double_init(&a$1);
	__golite_builtin__slice_double __golite__tmp_9 = __golite_builtin__slice_double_append(&a$1, 42.);
	a$1 = __golite__tmp_9;
	return a$1;
}

void __golite__main() {
	int a$2 = 5;
	int b$3 = 5;
	a$2+=b$3;
	printf("%d\n",a$2);
	int c$4;
int_init(&c$4);
	int d$5;
int_init(&d$5);
	int __golite__tmp_6 = 10;
	int __golite__tmp_7 = 15;
	c$4 = __golite__tmp_6;
	d$5 = __golite__tmp_7;
	printf("%d\n",c$4);
	printf("%d\n",d$5);
	printf("%d\n",global$0);
	int __golite__tmp_4 = __golite__sideEffect();
;
	printf("%d\n",global$0);
	double __golite__tmp_2 = 42.1;
	(__golite_builtin__slice_double_index(__golite__addressableSlice(),0)[0]) = __golite__tmp_2;
}

void init_globals() {
	global$0 = 10;
}

int main() {
	init_globals();
	__golite__main();
}
