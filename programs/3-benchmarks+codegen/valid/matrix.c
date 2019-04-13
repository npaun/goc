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

int __golite__var_CYCLES_0_1;
;
__golite__arr___golite__arr_double_256_256 __golite__mmult(__golite__arr___golite__arr_double_256_256 __golite__var_A_2_2, __golite__arr___golite__arr_double_256_256 __golite__var_B_3_3) {
	int __golite__var_n_4_4 = 256;
	int __golite__var_m_5_5 = 256;
	256;
	int __golite__var_p_6_6 = 256;
	__golite__arr___golite__arr_double_256_256 __golite__var_C_7_7;
__golite__arr___golite__arr_double_256_256_init(&__golite__var_C_7_7);
	{
		int __golite__var_i_8_8 = 0;
		while ((__golite__var_i_8_8 < __golite__var_n_4_4)) {
			{
				int __golite__var_j_9_9 = 0;
				while ((__golite__var_j_9_9 < __golite__var_p_6_6)) {
					{
						int __golite__var_k_10_10 = 0;
						while ((__golite__var_k_10_10 < __golite__var_m_5_5)) {
							 __arr_index_double( __arr_index___golite__arr_double_256(__golite__var_C_7_7.data, __golite__var_i_8_8, 256)[__golite__var_i_8_8].data, __golite__var_j_9_9, 256)[__golite__var_j_9_9]+=( __arr_index_double( __arr_index___golite__arr_double_256(__golite__var_A_2_2.data, __golite__var_i_8_8, 256)[__golite__var_i_8_8].data, __golite__var_k_10_10, 256)[__golite__var_k_10_10] *  __arr_index_double( __arr_index___golite__arr_double_256(__golite__var_B_3_3.data, __golite__var_k_10_10, 256)[__golite__var_k_10_10].data, __golite__var_j_9_9, 256)[__golite__var_j_9_9]);
						__continue_lbl6:;
							__golite__var_k_10_10++;
						}
					}
				__continue_lbl5:;
					__golite__var_j_9_9++;
				}
			}
		__continue_lbl4:;
			__golite__var_i_8_8++;
		}
	}
	return __golite__var_C_7_7;
}

int __golite__var_seed_11_11;
int __golite__rand() {
	int __golite__tmp_4 = (((__golite__var_seed_11_11 * 1140671485) + 1140671485) & (1 << 24));
	__golite__var_seed_11_11 = __golite__tmp_4;
	return __golite__var_seed_11_11;
}

__golite__arr___golite__arr_double_256_256 __golite__rand_matrix() {
	__golite__arr___golite__arr_double_256_256 __golite__var_M_12_12;
__golite__arr___golite__arr_double_256_256_init(&__golite__var_M_12_12);
	int __golite__var_n_13_13 = 256;
	{
		int __golite__var_i_14_14 = 0;
		while ((__golite__var_i_14_14 < __golite__var_n_13_13)) {
			{
				int __golite__var_j_15_15 = 0;
				while ((__golite__var_j_15_15 < __golite__var_n_13_13)) {
					double __golite__tmp_2 = ((double)__golite__rand() + (1e-06 * (double)__golite__rand()));
					 __arr_index_double( __arr_index___golite__arr_double_256(__golite__var_M_12_12.data, __golite__var_i_14_14, 256)[__golite__var_i_14_14].data, __golite__var_j_15_15, 256)[__golite__var_j_15_15] = __golite__tmp_2;
				__continue_lbl3:;
					__golite__var_j_15_15++;
				}
			}
		__continue_lbl2:;
			__golite__var_i_14_14++;
		}
	}
	return __golite__var_M_12_12;
}

void __golite__main() {
	{
		int __golite__var_i_16_16 = 0;
		while ((__golite__var_i_16_16 < __golite__var_CYCLES_0_1)) {
			__golite__mmult(__golite__rand_matrix(), __golite__rand_matrix());
			{
				if (((__golite__var_i_16_16 % 10) == 0)) {
					printf("%s\n","+");
				}
			}
		__continue_lbl1:;
			__golite__var_i_16_16++;
		}
	}
}

void init_globals() {
	__golite__var_CYCLES_0_1 = 100;
	__golite__var_seed_11_11 = 3735928559;
}

void init_funcs() {
	}

int main() {
	init_globals();
	init_funcs();
	__golite__main();
}
