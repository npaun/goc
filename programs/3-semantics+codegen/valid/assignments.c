#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

char* str_add(char* p, char* q) {
	int len = strlen(p) + strlen(q);
	char* res = (char*)malloc(len);
	strcat(res,p);
	return strcat(res,q);
}

void int_init(int* x) { *x = 0; }
void float_init(float* x) { *x = 0; }
void char_init(char* c) { *c = 0; }
void string_init(char** s) { *s = ""; }

typedef struct {
	unsigned int __size;
	unsigned int __capacity;
	float* __contents ;
} __golite_builtin__slice_float;

void __golite_builtin__slice_float_init(__golite_builtin__slice_float* x) {
	x->__size = 0;
	x->__capacity = 0;
	x->__contents = NULL;
}

__golite_builtin__slice_float __golite_builtin__slice_float_append(__golite_builtin__slice_float* _s, float el) {
	__golite_builtin__slice_float s = *_s;
	if(s.__size == s.__capacity) {
		float* new_arr = malloc(s.__size * sizeof(float));
		memcpy(new_arr, s.__contents, s.__size * sizeof(float));
		s.__capacity *= 2;
		s.__contents = new_arr;
	}
	s.__contents[s.__size++] = el;
	return s;
}

float* __golite_builtin__slice_float_index(__golite_builtin__slice_float s, int i) {
	if(i >= 0 && i < s.__size) return s.__contents;
	else { fprintf(stderr, "Out of Bounds index on slice\n"); exit(-1); }
}

int global = 10;
int __golite__sideEffect() {
	int __golite__tmp_11 = 69;
	global = __golite__tmp_11;
	return 5;
}

__golite_builtin__slice_float __golite__addressableSlice() {
	__golite_builtin__slice_float a;
__golite_builtin__slice_float_init(&a);
	__golite_builtin__slice_float __golite__tmp_9 = __golite_builtin__slice_float_append(&a, 42.);
	a = __golite__tmp_9;
	return a;
}

void __golite__main() {
	int a = 5;
	int b = 5;
	a+=b;
	printf("%d\n",a);
	int c;
int_init(&c);
	int d;
int_init(&d);
	int __golite__tmp_6 = 10;
	int __golite__tmp_7 = 15;
	c = __golite__tmp_6;
	d = __golite__tmp_7;
	printf("%d\n",c);
	printf("%d\n",d);
	printf("%d\n",global);
	int __golite__tmp_4 = __golite__sideEffect();
;
	printf("%d\n",global);
	float __golite__tmp_2 = 42.1;
	(__golite_builtin__slice_float_index(__golite__addressableSlice(),0)[0]) = __golite__tmp_2;
}

int main() {
	__golite__main();
}
