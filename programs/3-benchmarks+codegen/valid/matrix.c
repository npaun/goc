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
	double data[256];
} __golite__arr_double_256;

bool __golite__arr_double_256_cmp(__golite__arr_double_256* p, __golite__arr_double_256* q) { 
	for(int i = 0; i < 256; i++) {
		if(!(p->data[i] == q->data[i])) return false;
	}
	return true;
}

void __golite__arr_double_256_init(__golite__arr_double_256* x) {
	for(int i = 0; i < 256; i++) {
		double_init(&x->data[i]);
	}
}
typedef struct {
	__golite__arr_double_256 data[256];
} __golite__arr___golite__arr_double_256_256;

bool __golite__arr___golite__arr_double_256_256_cmp(__golite__arr___golite__arr_double_256_256* p, __golite__arr___golite__arr_double_256_256* q) { 
	for(int i = 0; i < 256; i++) {
		if(!__golite__arr_double_256_cmp(&p->data[i],&q->data[i])) return false;
	}
	return true;
}

void __golite__arr___golite__arr_double_256_256_init(__golite__arr___golite__arr_double_256_256* x) {
	for(int i = 0; i < 256; i++) {
		__golite__arr_double_256_init(&x->data[i]);
	}
}

// ---------- Array bounds checking helpers ----------
// Type: double
static inline __attribute__((always_inline))
double*  __arr_index_double(double* arr, int i, int len) {
	if (i >= 0 && i < len) return arr;
	else {fprintf(stderr, "Out of Bounds\n"); exit(-1);}
}

// Type: __golite__arr_double_256
static inline __attribute__((always_inline))
__golite__arr_double_256*  __arr_index___golite__arr_double_256(__golite__arr_double_256* arr, int i, int len) {
	if (i >= 0 && i < len) return arr;
	else {fprintf(stderr, "Out of Bounds\n"); exit(-1);}
}

int CYCLES$0;
;
__golite__arr___golite__arr_double_256_256 __golite__mmult(__golite__arr___golite__arr_double_256_256 A$2, __golite__arr___golite__arr_double_256_256 B$3) {
	int n$4 = 256;
	int m$5 = 256;
	256;
	int p$6 = 256;
	__golite__arr___golite__arr_double_256_256 C$7;
__golite__arr___golite__arr_double_256_256_init(&C$7);
	{
		int i$8 = 0;
		while ((i$8 < n$4)) {
			{
				int j$9 = 0;
				while ((j$9 < p$6)) {
					{
						int k$10 = 0;
						while ((k$10 < m$5)) {
							 __arr_index_double( __arr_index___golite__arr_double_256(C$7.data, i$8, 256)[i$8].data, j$9, 256)[j$9]+=( __arr_index_double( __arr_index___golite__arr_double_256(A$2.data, i$8, 256)[i$8].data, k$10, 256)[k$10] *  __arr_index_double( __arr_index___golite__arr_double_256(B$3.data, k$10, 256)[k$10].data, j$9, 256)[j$9]);
						__continue_lbl6:;
							k$10++;
						}
					}
				__continue_lbl5:;
					j$9++;
				}
			}
		__continue_lbl4:;
			i$8++;
		}
	}
	return C$7;
}

int seed$11;
int __golite__rand() {
	int __golite__tmp_4 = (((seed$11 * 1103515245) + 12345) & ((1 << 31) - 1));
	seed$11 = __golite__tmp_4;
	return seed$11;
}

__golite__arr___golite__arr_double_256_256 __golite__rand_matrix() {
	__golite__arr___golite__arr_double_256_256 M$12;
__golite__arr___golite__arr_double_256_256_init(&M$12);
	int n$13 = 256;
	{
		int i$14 = 0;
		while ((i$14 < n$13)) {
			{
				int j$15 = 0;
				while ((j$15 < n$13)) {
					double __golite__tmp_2 = ((double)__golite__rand() + (1e-06 * (double)__golite__rand()));
					 __arr_index_double( __arr_index___golite__arr_double_256(M$12.data, i$14, 256)[i$14].data, j$15, 256)[j$15] = __golite__tmp_2;
				__continue_lbl3:;
					j$15++;
				}
			}
		__continue_lbl2:;
			i$14++;
		}
	}
	return M$12;
}

void __golite__main() {
	{
		int i$16 = 0;
		while ((i$16 < CYCLES$0)) {
			__golite__mmult(__golite__rand_matrix(), __golite__rand_matrix());
			{
				if (((i$16 % 10) == 0)) {
					printf("%s\n","+");
				}
			}
		__continue_lbl1:;
			i$16++;
		}
	}
}

void init_globals() {
	CYCLES$0 = 100;
	seed$11 = 3735928559;
}

void init_funcs() {
	}

int main() {
	init_globals();
	init_funcs();
	__golite__main();
}
