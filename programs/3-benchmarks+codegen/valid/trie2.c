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
		__golite__struct_1* new_arr = malloc(s.__size * sizeof(__golite__struct_1));
		memcpy(new_arr, s.__contents, s.__size * sizeof(__golite__struct_1));
		s.__capacity *= 2;
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

int KEYS$0;
int SEARCHES$1;
int ROUNDS$2;
;
__golite__arr_int_9 __golite__unpack(int key$4) {
	__golite__arr_int_9 r$5;
__golite__arr_int_9_init(&r$5);
	{
		int i$6 = (9 - 1);
		while ((i$6 >= 0)) {
			int __golite__tmp_23 = (key$4 % 10);
			 __arr_index_int(r$5.data, i$6, 9)[i$6] = __golite__tmp_23;
			key$4/=10;
		__continue_lbl6:;
			i$6--;
		}
	}
	return r$5;
}

__golite_builtin__slice___golite__struct_1 __golite__trie_insert(__golite_builtin__slice___golite__struct_1 t$7, int key$8, string data$9) {
	int cur$10 = 0;
	{
		__golite__arr_int_9 key$11 = __golite__unpack(key$8);
		{
			int i$12 = 0;
			while ((i$12 < 9)) {
				int key$13 =  __arr_index_int(key$11.data, i$12, 9)[i$12];
				{
					if (( __arr_index_int((__golite_builtin__slice___golite__struct_1_index(t$7,cur$10)[cur$10]).chld.data, key$13, 10)[key$13] == 0)) {
						__golite__struct_1 nent$14;
__golite__struct_1_init(&nent$14);
						int slot$15 = __golite_builtin__slice___golite__struct_1_len(t$7);
						__golite_builtin__slice___golite__struct_1 __golite__tmp_19 = __golite_builtin__slice___golite__struct_1_append(&t$7, nent$14);
						t$7 = __golite__tmp_19;
						int __golite__tmp_17 = slot$15;
						 __arr_index_int((__golite_builtin__slice___golite__struct_1_index(t$7,cur$10)[cur$10]).chld.data, key$13, 10)[key$13] = __golite__tmp_17;
					}
				}
				int __golite__tmp_21 =  __arr_index_int((__golite_builtin__slice___golite__struct_1_index(t$7,cur$10)[cur$10]).chld.data, key$13, 10)[key$13];
				cur$10 = __golite__tmp_21;
			__continue_lbl5:;
				i$12++;
			}
		}
		string __golite__tmp_15 = data$9;
		(__golite_builtin__slice___golite__struct_1_index(t$7,cur$10)[cur$10]).data = __golite__tmp_15;
	}
	return t$7;
}

string __golite__trie_search(__golite_builtin__slice___golite__struct_1 t$16, int key$17) {
	int cur$18 = 0;
	{
		__golite__arr_int_9 key$19 = __golite__unpack(key$17);
		{
			int i$20 = 0;
			while ((i$20 < 9)) {
				int key$21 =  __arr_index_int(key$19.data, i$20, 9)[i$20];
				{
					if (( __arr_index_int((__golite_builtin__slice___golite__struct_1_index(t$16,cur$18)[cur$18]).chld.data, key$21, 10)[key$21] == 0)) {
						return "NOTFOUND";
					}
				}
				int __golite__tmp_13 =  __arr_index_int((__golite_builtin__slice___golite__struct_1_index(t$16,cur$18)[cur$18]).chld.data, key$21, 10)[key$21];
				cur$18 = __golite__tmp_13;
			__continue_lbl4:;
				i$20++;
			}
		}
		return (__golite_builtin__slice___golite__struct_1_index(t$16,cur$18)[cur$18]).data;
	}
}

void __golite__bench() {
	__golite_builtin__slice___golite__struct_1 t$22;
__golite_builtin__slice___golite__struct_1_init(&t$22);
	__golite__struct_1 root$23;
__golite__struct_1_init(&root$23);
	__golite_builtin__slice___golite__struct_1 __golite__tmp_11 = __golite_builtin__slice___golite__struct_1_append(&t$22, root$23);
	t$22 = __golite__tmp_11;
	{
		int i$24 = 0;
		while ((i$24 < KEYS$0)) {
			{
				if (0 || ((i$24 % 3) == 0)) {
					__golite_builtin__slice___golite__struct_1 __golite__tmp_5 = __golite__trie_insert(t$22, i$24, "elephant");
					t$22 = __golite__tmp_5;
				}
				else {
					if (0 || ((i$24 % 3) == 1)) {
						__golite_builtin__slice___golite__struct_1 __golite__tmp_7 = __golite__trie_insert(t$22, i$24, "marmot");
						t$22 = __golite__tmp_7;
					}
					else {
						if (0 || ((i$24 % 3) == 2)) {
							__golite_builtin__slice___golite__struct_1 __golite__tmp_9 = __golite__trie_insert(t$22, i$24, "panther");
							t$22 = __golite__tmp_9;
						}
						else {
						}
					}
				}
			}
		__continue_lbl3:;
			i$24++;
		}
	}
	{
		int i$25 = 0;
		int k$26 = 0;
		while ((i$25 < SEARCHES$1)) {
			printf("%s\n",__golite__trie_search(t$22, i$25));
		__continue_lbl2:;
			int __golite__tmp_2 = (i$25 + 1);
			int __golite__tmp_3 = (k$26 * 11);
			i$25 = __golite__tmp_2;
			k$26 = __golite__tmp_3;
		}
	}
}

void __golite__main() {
	{
		int i$27 = 0;
		while ((i$27 < ROUNDS$2)) {
			printf("%s\n","-------------------------");
			__golite__bench();
			printf("%s\n","");
		__continue_lbl1:;
			i$27++;
		}
	}
}

void init_globals() {
	KEYS$0 = 500000;
	SEARCHES$1 = 10;
	ROUNDS$2 = 15;
}

void init_funcs() {
	}

int main() {
	init_globals();
	init_funcs();
	__golite__main();
}
