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
	string data[16];
} __golite__arr_string_16;

bool __golite__arr_string_16_cmp(__golite__arr_string_16* p, __golite__arr_string_16* q) { 
	for(int i = 0; i < 16; i++) {
		if(!(p->data[i] == q->data[i])) return false;
	}
	return true;
}

void __golite__arr_string_16_init(__golite__arr_string_16* x) {
	for(int i = 0; i < 16; i++) {
		string_init(&x->data[i]);
	}
}

// ---------- Array bounds checking helpers ----------
// Type: string
static inline __attribute__((always_inline))
string*  __arr_index_string(string* arr, int i, int len) {
	if (i >= 0 && i < len) return arr;
	else {fprintf(stderr, "Out of Bounds\n"); exit(-1);}
}

int __golite__var_CYCLES_0_1;
int __golite__var_p_1_2;
int __golite__var_q_2_3;
int __golite__var_M_3_4;
int __golite__var_x_4_5;
int __golite__digit() {
	int __golite__tmp_2 = ((__golite__var_x_4_5 * __golite__var_x_4_5) % __golite__var_M_3_4);
	__golite__var_x_4_5 = __golite__tmp_2;
	return (__golite__var_x_4_5 & 1);
}

int __golite__randint() {
	int __golite__var_num_5_6 = 0;
	{
		int __golite__var_i_6_7 = 0;
		while ((__golite__var_i_6_7 < 32)) {
			__golite__var_num_5_6|=(__golite__digit() << __golite__var_i_6_7);
		__continue_lbl2:;
			__golite__var_i_6_7++;
		}
	}
	return __golite__var_num_5_6;
}

__golite__arr_string_16 __golite__var_w_7_8;
string __golite__chr(int __golite__var_num_8_9, int __golite__var_idx_9_10) {
	return __golite_num_to_string((32 + (((__golite__var_num_8_9 >> __golite__var_idx_9_10) & 255) % 94)));
}

string __golite__to_password(int __golite__var_a_10_11, int __golite__var_b_11_12) {
	return str_add(str_add(str_add(str_add(str_add(str_add(str_add(__golite__chr(__golite__var_a_10_11, 24),__golite__chr(__golite__var_a_10_11, 16)),__golite__chr(__golite__var_a_10_11, 8)),__golite__chr(__golite__var_a_10_11, 0)),__golite__chr(__golite__var_b_11_12, 24)),__golite__chr(__golite__var_b_11_12, 16)),__golite__chr(__golite__var_b_11_12, 8)),__golite__chr(__golite__var_b_11_12, 0));
}

void __golite__main() {
	{
		int __golite__var_i_12_13 = 0;
		while ((__golite__var_i_12_13 < __golite__var_CYCLES_0_1)) {
			int __golite__var_a_13_14 = __golite__randint();
			int __golite__var_b_14_15 = __golite__randint();
			{
				if (((__golite__var_i_12_13 % 1000000) == 0)) {
					printf("%s %d %s %s %s\n","Your ",__golite__var_i_12_13,"th new password is ",__golite__to_password(__golite__var_a_13_14, __golite__var_b_14_15),". Yay....");
				}
			}
		__continue_lbl1:;
			__golite__var_i_12_13++;
		}
	}
}

void init_globals() {
	__golite__var_CYCLES_0_1 = 3844778;
	__golite__var_p_1_2 = 127601;
	__golite__var_q_2_3 = 87559;
	__golite__var_M_3_4 = (__golite__var_p_1_2 * __golite__var_q_2_3);
	__golite__var_x_4_5 = 44973;
	__golite__arr_string_16_init(&__golite__var_w_7_8);
}

void init_funcs() {
	{
		string __golite__tmp_19 = "aardvark";
		string __golite__tmp_20 = "backwater";
		string __golite__tmp_21 = "candidate";
		string __golite__tmp_22 = "decadence";
		 __arr_index_string(__golite__var_w_7_8.data, 0, 16)[0] = __golite__tmp_19;
		 __arr_index_string(__golite__var_w_7_8.data, 1, 16)[1] = __golite__tmp_20;
		 __arr_index_string(__golite__var_w_7_8.data, 2, 16)[2] = __golite__tmp_21;
		 __arr_index_string(__golite__var_w_7_8.data, 3, 16)[3] = __golite__tmp_22;
		string __golite__tmp_14 = "embezzle";
		string __golite__tmp_15 = "fascinate";
		string __golite__tmp_16 = "gadgetry";
		string __golite__tmp_17 = "hamburger";
		 __arr_index_string(__golite__var_w_7_8.data, 4, 16)[4] = __golite__tmp_14;
		 __arr_index_string(__golite__var_w_7_8.data, 5, 16)[5] = __golite__tmp_15;
		 __arr_index_string(__golite__var_w_7_8.data, 6, 16)[6] = __golite__tmp_16;
		 __arr_index_string(__golite__var_w_7_8.data, 7, 16)[7] = __golite__tmp_17;
		string __golite__tmp_9 = "indoors";
		string __golite__tmp_10 = "jawbone";
		string __golite__tmp_11 = "keyboard";
		string __golite__tmp_12 = "locale";
		 __arr_index_string(__golite__var_w_7_8.data, 8, 16)[8] = __golite__tmp_9;
		 __arr_index_string(__golite__var_w_7_8.data, 9, 16)[9] = __golite__tmp_10;
		 __arr_index_string(__golite__var_w_7_8.data, 10, 16)[10] = __golite__tmp_11;
		 __arr_index_string(__golite__var_w_7_8.data, 11, 16)[11] = __golite__tmp_12;
		string __golite__tmp_4 = "merit";
		string __golite__tmp_5 = "neptune";
		string __golite__tmp_6 = "obtuse";
		string __golite__tmp_7 = "payday";
		 __arr_index_string(__golite__var_w_7_8.data, 12, 16)[12] = __golite__tmp_4;
		 __arr_index_string(__golite__var_w_7_8.data, 13, 16)[13] = __golite__tmp_5;
		 __arr_index_string(__golite__var_w_7_8.data, 14, 16)[14] = __golite__tmp_6;
		 __arr_index_string(__golite__var_w_7_8.data, 15, 16)[15] = __golite__tmp_7;
	}
}

int main() {
	init_globals();
	init_funcs();
	__golite__main();
}
