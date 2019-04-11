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
	float data[256];
} __golite__arr_float_256;

bool __golite__arr_float_256_cmp(__golite__arr_float_256* p, __golite__arr_float_256* q) { 
	for(int i = 0; i < 256; i++) {
		if(!(p->data[i] == q->data[i])) return false;
	}
	return true;
}

void __golite__arr_float_256_init(__golite__arr_float_256* x) {
	for(int i = 0; i < 256; i++) {
		float_init(&x->data[i]);
	}
}
typedef struct {
	__golite__arr_float_256 data[256];
} __golite__arr___golite__arr_float_256_256;

bool __golite__arr___golite__arr_float_256_256_cmp(__golite__arr___golite__arr_float_256_256* p, __golite__arr___golite__arr_float_256_256* q) { 
	for(int i = 0; i < 256; i++) {
		if(!__golite__arr_float_256_cmp(&p->data[i],&q->data[i])) return false;
	}
	return true;
}

void __golite__arr___golite__arr_float_256_256_init(__golite__arr___golite__arr_float_256_256* x) {
	for(int i = 0; i < 256; i++) {
		__golite__arr_float_256_init(&x->data[i]);
	}
}

// ---------- Array bounds checking helpers ----------
// Type: float
static inline __attribute__((always_inline))
float*  __arr_index_float(float* arr, int i, int len) {
	if (i >= 0 && i < len) return arr;
	else {fprintf(stderr, "Out of Bounds\n"); exit(-1);}
}

// Type: __golite__arr_float_256
static inline __attribute__((always_inline))
__golite__arr_float_256*  __arr_index___golite__arr_float_256(__golite__arr_float_256* arr, int i, int len) {
	if (i >= 0 && i < len) return arr;
	else {fprintf(stderr, "Out of Bounds\n"); exit(-1);}
}

int CYCLES = 100;
;
__golite__arr___golite__arr_float_256_256 __golite__mmult(mat __golite__A, mat __golite__B) {
	int n = __golite__len(A);
	int m = __golite__len( __arr_index___golite__arr_float_256(A.data, 0, 256)[0]);
	__golite__len(B);
	int p = __golite__len( __arr_index___golite__arr_float_256(B.data, 0, 256)[0]);
	__golite__arr___golite__arr_float_256_256 C;
__golite__arr___golite__arr_float_256_256_init(&C);
	{
		int i = 0;
		while ((i < n)) {
			{
				int j = 0;
				while ((j < p)) {
					{
						int k = 0;
						while ((k < m)) {
							 __arr_index_float( __arr_index___golite__arr_float_256(C.data, i, 256)[i].data, j, 256)[j]+=( __arr_index_float( __arr_index___golite__arr_float_256(A.data, i, 256)[i].data, k, 256)[k] *  __arr_index_float( __arr_index___golite__arr_float_256(B.data, k, 256)[k].data, j, 256)[j]);
						__continue_lbl6:;
							k++;
						}
					}
				__continue_lbl5:;
					j++;
				}
			}
		__continue_lbl4:;
			i++;
		}
	}
	return C;
}

int seed = 3735928559;
int __golite__rand() {
	int __golite__tmp_4 = (((seed * 1103515245) + 12345) & ((1 << 31) - 1));
	seed = __golite__tmp_4;
	return seed;
}

__golite__arr___golite__arr_float_256_256 __golite__rand_matrix() {
	__golite__arr___golite__arr_float_256_256 M;
__golite__arr___golite__arr_float_256_256_init(&M);
	int n = __golite__len(M);
	{
		int i = 0;
		while ((i < n)) {
			{
				int j = 0;
				while ((j < n)) {
					float __golite__tmp_2 = ((float)__golite__rand() + (1e-06 * (float)__golite__rand()));
					 __arr_index_float( __arr_index___golite__arr_float_256(M.data, i, 256)[i].data, j, 256)[j] = __golite__tmp_2;
				__continue_lbl3:;
					j++;
				}
			}
		__continue_lbl2:;
			i++;
		}
	}
	return M;
}

void __golite__main() {
	{
		int i = 0;
		while ((i < CYCLES)) {
			__golite__mmult(__golite__rand_matrix(), __golite__rand_matrix());
			{
				if (((i % 10) == 0)) {
					printf("%s\n","+");
				}
			}
		__continue_lbl1:;
			i++;
		}
	}
}

int main() {
	__golite__main();
}
