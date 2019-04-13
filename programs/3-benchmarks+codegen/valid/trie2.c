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
	int data[10];
} __golite__arr_int_10;

bool __golite__arr_int_10_cmp(__golite__arr_int_10* p, __golite__arr_int_10* q) { 
	for(int i = 0; i < 10; i++) {
		if(!(p->data[i] == q->data[i])) return false;
	}
	return true;
}

void __golite__arr_int_10_init(__golite__arr_int_10* x) {
	for(int i = 0; i < 10; i++) {
		int_init(&x->data[i]);
	}
}
typedef struct {
	string data;
	__golite__arr_int_10 chld;
} __golite__struct_1;

bool __golite__struct_1_cmp(__golite__struct_1* p, __golite__struct_1* q) { 
	return (p->data == q->data) && __golite__arr_int_10_cmp(&p->chld,&q->chld);
}

void __golite__struct_1_init(__golite__struct_1* x) {
	string_init(&x->data);
	__golite__arr_int_10_init(&x->chld);
}

typedef struct {
	int data[9];
} __golite__arr_int_9;

bool __golite__arr_int_9_cmp(__golite__arr_int_9* p, __golite__arr_int_9* q) { 
	for(int i = 0; i < 9; i++) {
		if(!(p->data[i] == q->data[i])) return false;
	}
	return true;
}

void __golite__arr_int_9_init(__golite__arr_int_9* x) {
	for(int i = 0; i < 9; i++) {
		int_init(&x->data[i]);
	}
}
typedef struct {
	unsigned int __size;
	unsigned int __capacity;
	__golite__struct_1* __contents ;
} __golite_builtin__slice___golite__struct_1;

void __golite_builtin__slice___golite__struct_1_init(__golite_builtin__slice___golite__struct_1* x) {
	x->__size = 0;
	x->__capacity = 0;
	x->__contents = NULL;
}

__golite_builtin__slice___golite__struct_1 __golite_builtin__slice___golite__struct_1_append(__golite_builtin__slice___golite__struct_1* _s, __golite__struct_1 el) {
	__golite_builtin__slice___golite__struct_1 s = *_s;
	if(s.__size == s.__capacity) {
		if (s.__capacity == 0) s.__capacity = 1;
		else s.__capacity *= 2;
		__golite__struct_1* new_arr = (__golite__struct_1*)malloc((s.__capacity) * sizeof(__golite__struct_1));
		if (s.__contents != NULL) memcpy(new_arr, s.__contents, s.__size * sizeof(__golite__struct_1));
		s.__contents = new_arr;
	}
	s.__contents[s.__size++] = el;
	return s;
}

__golite__struct_1* __golite_builtin__slice___golite__struct_1_index(__golite_builtin__slice___golite__struct_1 s, int i) {
	if(i >= 0 && i < s.__size) return s.__contents;
	else { fprintf(stderr, "Out of Bounds index on slice\n"); exit(-1); }
}

int __golite_builtin__slice___golite__struct_1_len(__golite_builtin__slice___golite__struct_1 s) {
	return s.__size;
}

int __golite_builtin__slice___golite__struct_1_cap(__golite_builtin__slice___golite__struct_1 s) {
	return s.__capacity;
}


// ---------- Array bounds checking helpers ----------
// Type: int
static inline __attribute__((always_inline))
int*  __arr_index_int(int* arr, int i, int len) {
	if (i >= 0 && i < len) return arr;
	else {fprintf(stderr, "Out of Bounds\n"); exit(-1);}
}

int __golite__var_KEYS_0_1;
int __golite__var_SEARCHES_1_2;
int __golite__var_ROUNDS_2_3;
;
__golite__arr_int_9 __golite__unpack(int __golite__var_key_4_4) {
	__golite__arr_int_9 __golite__var_r_5_5;
__golite__arr_int_9_init(&__golite__var_r_5_5);
	{
		int __golite__var_i_6_6 = (9 - 1);
		while ((__golite__var_i_6_6 >= 0)) {
			int __golite__tmp_23 = (__golite__var_key_4_4 % 10);
			 __arr_index_int(__golite__var_r_5_5.data, __golite__var_i_6_6, 9)[__golite__var_i_6_6] = __golite__tmp_23;
			__golite__var_key_4_4/=10;
		__continue_lbl6:;
			__golite__var_i_6_6--;
		}
	}
	return __golite__var_r_5_5;
}

__golite_builtin__slice___golite__struct_1 __golite__trie_insert(__golite_builtin__slice___golite__struct_1 __golite__var_t_7_7, int __golite__var_key_8_8, string __golite__var_data_9_9) {
	int __golite__var_cur_10_10 = 0;
	{
		__golite__arr_int_9 __golite__var_key_11_11 = __golite__unpack(__golite__var_key_8_8);
		{
			int __golite__var_i_12_12 = 0;
			while ((__golite__var_i_12_12 < 9)) {
				int __golite__var_key_13_13 =  __arr_index_int(__golite__var_key_11_11.data, __golite__var_i_12_12, 9)[__golite__var_i_12_12];
				{
					if (( __arr_index_int((__golite_builtin__slice___golite__struct_1_index(__golite__var_t_7_7,__golite__var_cur_10_10)[__golite__var_cur_10_10]).chld.data, __golite__var_key_13_13, 10)[__golite__var_key_13_13] == 0)) {
						__golite__struct_1 __golite__var_nent_14_14;
__golite__struct_1_init(&__golite__var_nent_14_14);
						int __golite__var_slot_15_15 = __golite_builtin__slice___golite__struct_1_len(__golite__var_t_7_7);
						__golite_builtin__slice___golite__struct_1 __golite__tmp_19 = __golite_builtin__slice___golite__struct_1_append(&__golite__var_t_7_7, __golite__var_nent_14_14);
						__golite__var_t_7_7 = __golite__tmp_19;
						int __golite__tmp_17 = __golite__var_slot_15_15;
						 __arr_index_int((__golite_builtin__slice___golite__struct_1_index(__golite__var_t_7_7,__golite__var_cur_10_10)[__golite__var_cur_10_10]).chld.data, __golite__var_key_13_13, 10)[__golite__var_key_13_13] = __golite__tmp_17;
					}
				}
				int __golite__tmp_21 =  __arr_index_int((__golite_builtin__slice___golite__struct_1_index(__golite__var_t_7_7,__golite__var_cur_10_10)[__golite__var_cur_10_10]).chld.data, __golite__var_key_13_13, 10)[__golite__var_key_13_13];
				__golite__var_cur_10_10 = __golite__tmp_21;
			__continue_lbl5:;
				__golite__var_i_12_12++;
			}
		}
		string __golite__tmp_15 = __golite__var_data_9_9;
		(__golite_builtin__slice___golite__struct_1_index(__golite__var_t_7_7,__golite__var_cur_10_10)[__golite__var_cur_10_10]).data = __golite__tmp_15;
	}
	return __golite__var_t_7_7;
}

string __golite__trie_search(__golite_builtin__slice___golite__struct_1 __golite__var_t_16_16, int __golite__var_key_17_17) {
	int __golite__var_cur_18_18 = 0;
	{
		__golite__arr_int_9 __golite__var_key_19_19 = __golite__unpack(__golite__var_key_17_17);
		{
			int __golite__var_i_20_20 = 0;
			while ((__golite__var_i_20_20 < 9)) {
				int __golite__var_key_21_21 =  __arr_index_int(__golite__var_key_19_19.data, __golite__var_i_20_20, 9)[__golite__var_i_20_20];
				{
					if (( __arr_index_int((__golite_builtin__slice___golite__struct_1_index(__golite__var_t_16_16,__golite__var_cur_18_18)[__golite__var_cur_18_18]).chld.data, __golite__var_key_21_21, 10)[__golite__var_key_21_21] == 0)) {
						return "NOTFOUND";
					}
				}
				int __golite__tmp_13 =  __arr_index_int((__golite_builtin__slice___golite__struct_1_index(__golite__var_t_16_16,__golite__var_cur_18_18)[__golite__var_cur_18_18]).chld.data, __golite__var_key_21_21, 10)[__golite__var_key_21_21];
				__golite__var_cur_18_18 = __golite__tmp_13;
			__continue_lbl4:;
				__golite__var_i_20_20++;
			}
		}
		return (__golite_builtin__slice___golite__struct_1_index(__golite__var_t_16_16,__golite__var_cur_18_18)[__golite__var_cur_18_18]).data;
	}
}

void __golite__bench() {
	__golite_builtin__slice___golite__struct_1 __golite__var_t_22_22;
__golite_builtin__slice___golite__struct_1_init(&__golite__var_t_22_22);
	__golite__struct_1 __golite__var_root_23_23;
__golite__struct_1_init(&__golite__var_root_23_23);
	__golite_builtin__slice___golite__struct_1 __golite__tmp_11 = __golite_builtin__slice___golite__struct_1_append(&__golite__var_t_22_22, __golite__var_root_23_23);
	__golite__var_t_22_22 = __golite__tmp_11;
	{
		int __golite__var_i_24_24 = 0;
		while ((__golite__var_i_24_24 < __golite__var_KEYS_0_1)) {
			{
				if (0 || ((__golite__var_i_24_24 % 3) == 0)) {
					__golite_builtin__slice___golite__struct_1 __golite__tmp_5 = __golite__trie_insert(__golite__var_t_22_22, __golite__var_i_24_24, "elephant");
					__golite__var_t_22_22 = __golite__tmp_5;
				}
				else {
					if (0 || ((__golite__var_i_24_24 % 3) == 1)) {
						__golite_builtin__slice___golite__struct_1 __golite__tmp_7 = __golite__trie_insert(__golite__var_t_22_22, __golite__var_i_24_24, "marmot");
						__golite__var_t_22_22 = __golite__tmp_7;
					}
					else {
						if (0 || ((__golite__var_i_24_24 % 3) == 2)) {
							__golite_builtin__slice___golite__struct_1 __golite__tmp_9 = __golite__trie_insert(__golite__var_t_22_22, __golite__var_i_24_24, "panther");
							__golite__var_t_22_22 = __golite__tmp_9;
						}
						else {
						}
					}
				}
			}
		__continue_lbl3:;
			__golite__var_i_24_24++;
		}
	}
	{
		int __golite__var_i_25_25 = 0;
		int __golite__var_k_26_26 = 0;
		while ((__golite__var_i_25_25 < __golite__var_SEARCHES_1_2)) {
			printf("%s\n",__golite__trie_search(__golite__var_t_22_22, __golite__var_i_25_25));
		__continue_lbl2:;
			int __golite__tmp_2 = (__golite__var_i_25_25 + 1);
			int __golite__tmp_3 = (__golite__var_k_26_26 * 11);
			__golite__var_i_25_25 = __golite__tmp_2;
			__golite__var_k_26_26 = __golite__tmp_3;
		}
	}
}

void __golite__main() {
	{
		int __golite__var_i_27_27 = 0;
		while ((__golite__var_i_27_27 < __golite__var_ROUNDS_2_3)) {
			printf("%s\n","-------------------------");
			__golite__bench();
			printf("%s\n","");
		__continue_lbl1:;
			__golite__var_i_27_27++;
		}
	}
}

void init_globals() {
	__golite__var_KEYS_0_1 = 500000;
	__golite__var_SEARCHES_1_2 = 10;
	__golite__var_ROUNDS_2_3 = 15;
}

void init_funcs() {
	}

int main() {
	init_globals();
	init_funcs();
	__golite__main();
}
