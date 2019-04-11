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
	string data[100];
} __golite__arr_string_100;

bool __golite__arr_string_100_cmp(__golite__arr_string_100* p, __golite__arr_string_100* q) { 
	for(int i = 0; i < 100; i++) {
		if(!(p->data[i] == q->data[i])) return false;
	}
	return true;
}

void __golite__arr_string_100_init(__golite__arr_string_100* x) {
	for(int i = 0; i < 100; i++) {
		string_init(&x->data[i]);
	}
}
typedef struct {
	string name;
	int age;
	__golite__arr_string_100 friend_names;
} __golite__struct_1;

bool __golite__struct_1_cmp(__golite__struct_1* p, __golite__struct_1* q) { 
	return (p->name == q->name) && (p->age == q->age) && __golite__arr_string_100_cmp(&p->friend_names,&q->friend_names);
}

void __golite__struct_1_init(__golite__struct_1* x) {
	string_init(&x->name);
	int_init(&x->age);
	__golite__arr_string_100_init(&x->friend_names);
}

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
	int age;
	string st;
} __golite__struct_2;

bool __golite__struct_2_cmp(__golite__struct_2* p, __golite__struct_2* q) { 
	return (p->age == q->age) && (p->st == q->st);
}

void __golite__struct_2_init(__golite__struct_2* x) {
	int_init(&x->age);
	string_init(&x->st);
}

typedef struct {
	int i;
	double f;
	__golite__struct_2 s2;
} __golite__struct_3;

bool __golite__struct_3_cmp(__golite__struct_3* p, __golite__struct_3* q) { 
	return (p->i == q->i) && (p->f == q->f) && __golite__struct_2_cmp(&p->s2,&q->s2);
}

void __golite__struct_3_init(__golite__struct_3* x) {
	int_init(&x->i);
	double_init(&x->f);
	__golite__struct_2_init(&x->s2);
}

typedef struct {
	int data[100];
} __golite__arr_int_100;

bool __golite__arr_int_100_cmp(__golite__arr_int_100* p, __golite__arr_int_100* q) { 
	for(int i = 0; i < 100; i++) {
		if(!(p->data[i] == q->data[i])) return false;
	}
	return true;
}

void __golite__arr_int_100_init(__golite__arr_int_100* x) {
	for(int i = 0; i < 100; i++) {
		int_init(&x->data[i]);
	}
}
typedef struct {
	double data[100];
} __golite__arr_double_100;

bool __golite__arr_double_100_cmp(__golite__arr_double_100* p, __golite__arr_double_100* q) { 
	for(int i = 0; i < 100; i++) {
		if(!(p->data[i] == q->data[i])) return false;
	}
	return true;
}

void __golite__arr_double_100_init(__golite__arr_double_100* x) {
	for(int i = 0; i < 100; i++) {
		double_init(&x->data[i]);
	}
}
typedef struct {
	string data[20];
} __golite__arr_string_20;

bool __golite__arr_string_20_cmp(__golite__arr_string_20* p, __golite__arr_string_20* q) { 
	for(int i = 0; i < 20; i++) {
		if(!(p->data[i] == q->data[i])) return false;
	}
	return true;
}

void __golite__arr_string_20_init(__golite__arr_string_20* x) {
	for(int i = 0; i < 20; i++) {
		string_init(&x->data[i]);
	}
}
typedef struct {
	__golite__struct_1 data[20];
} __golite__arr___golite__struct_1_20;

bool __golite__arr___golite__struct_1_20_cmp(__golite__arr___golite__struct_1_20* p, __golite__arr___golite__struct_1_20* q) { 
	for(int i = 0; i < 20; i++) {
		if(!__golite__struct_1_cmp(&p->data[i],&q->data[i])) return false;
	}
	return true;
}

void __golite__arr___golite__struct_1_20_init(__golite__arr___golite__struct_1_20* x) {
	for(int i = 0; i < 20; i++) {
		__golite__struct_1_init(&x->data[i]);
	}
}
typedef struct {
	__golite__arr_int_10 data[30];
} __golite__arr___golite__arr_int_10_30;

bool __golite__arr___golite__arr_int_10_30_cmp(__golite__arr___golite__arr_int_10_30* p, __golite__arr___golite__arr_int_10_30* q) { 
	for(int i = 0; i < 30; i++) {
		if(!__golite__arr_int_10_cmp(&p->data[i],&q->data[i])) return false;
	}
	return true;
}

void __golite__arr___golite__arr_int_10_30_init(__golite__arr___golite__arr_int_10_30* x) {
	for(int i = 0; i < 30; i++) {
		__golite__arr_int_10_init(&x->data[i]);
	}
}
typedef struct {
	int data[5];
} __golite__arr_int_5;

bool __golite__arr_int_5_cmp(__golite__arr_int_5* p, __golite__arr_int_5* q) { 
	for(int i = 0; i < 5; i++) {
		if(!(p->data[i] == q->data[i])) return false;
	}
	return true;
}

void __golite__arr_int_5_init(__golite__arr_int_5* x) {
	for(int i = 0; i < 5; i++) {
		int_init(&x->data[i]);
	}
}
typedef struct {
	double data[10];
} __golite__arr_double_10;

bool __golite__arr_double_10_cmp(__golite__arr_double_10* p, __golite__arr_double_10* q) { 
	for(int i = 0; i < 10; i++) {
		if(!(p->data[i] == q->data[i])) return false;
	}
	return true;
}

void __golite__arr_double_10_init(__golite__arr_double_10* x) {
	for(int i = 0; i < 10; i++) {
		double_init(&x->data[i]);
	}
}
typedef struct {
	string data[5];
} __golite__arr_string_5;

bool __golite__arr_string_5_cmp(__golite__arr_string_5* p, __golite__arr_string_5* q) { 
	for(int i = 0; i < 5; i++) {
		if(!(p->data[i] == q->data[i])) return false;
	}
	return true;
}

void __golite__arr_string_5_init(__golite__arr_string_5* x) {
	for(int i = 0; i < 5; i++) {
		string_init(&x->data[i]);
	}
}
typedef struct {
	unsigned int __size;
	unsigned int __capacity;
	string* __contents ;
} __golite_builtin__slice_string;

void __golite_builtin__slice_string_init(__golite_builtin__slice_string* x) {
	x->__size = 0;
	x->__capacity = 0;
	x->__contents = NULL;
}

__golite_builtin__slice_string __golite_builtin__slice_string_append(__golite_builtin__slice_string* _s, string el) {
	__golite_builtin__slice_string s = *_s;
	if(s.__size == s.__capacity) {
		string* new_arr = malloc(s.__size * sizeof(string));
		memcpy(new_arr, s.__contents, s.__size * sizeof(string));
		s.__capacity *= 2;
		s.__contents = new_arr;
	}
	s.__contents[s.__size++] = el;
	return s;
}

string* __golite_builtin__slice_string_index(__golite_builtin__slice_string s, int i) {
	if(i >= 0 && i < s.__size) return s.__contents;
	else { fprintf(stderr, "Out of Bounds index on slice\n"); exit(-1); }
}

int __golite_builtin__slice_string_len(__golite_builtin__slice_string s) {
	return s.__size;
}

int __golite_builtin__slice_string_cap(__golite_builtin__slice_string s) {
	return s.__capacity;
}

typedef struct {
	int data[2];
} __golite__arr_int_2;

bool __golite__arr_int_2_cmp(__golite__arr_int_2* p, __golite__arr_int_2* q) { 
	for(int i = 0; i < 2; i++) {
		if(!(p->data[i] == q->data[i])) return false;
	}
	return true;
}

void __golite__arr_int_2_init(__golite__arr_int_2* x) {
	for(int i = 0; i < 2; i++) {
		int_init(&x->data[i]);
	}
}
typedef struct {
	unsigned int __size;
	unsigned int __capacity;
	__golite__arr_int_2* __contents ;
} __golite_builtin__slice___golite__arr_int_2;

void __golite_builtin__slice___golite__arr_int_2_init(__golite_builtin__slice___golite__arr_int_2* x) {
	x->__size = 0;
	x->__capacity = 0;
	x->__contents = NULL;
}

__golite_builtin__slice___golite__arr_int_2 __golite_builtin__slice___golite__arr_int_2_append(__golite_builtin__slice___golite__arr_int_2* _s, __golite__arr_int_2 el) {
	__golite_builtin__slice___golite__arr_int_2 s = *_s;
	if(s.__size == s.__capacity) {
		__golite__arr_int_2* new_arr = malloc(s.__size * sizeof(__golite__arr_int_2));
		memcpy(new_arr, s.__contents, s.__size * sizeof(__golite__arr_int_2));
		s.__capacity *= 2;
		s.__contents = new_arr;
	}
	s.__contents[s.__size++] = el;
	return s;
}

__golite__arr_int_2* __golite_builtin__slice___golite__arr_int_2_index(__golite_builtin__slice___golite__arr_int_2 s, int i) {
	if(i >= 0 && i < s.__size) return s.__contents;
	else { fprintf(stderr, "Out of Bounds index on slice\n"); exit(-1); }
}

int __golite_builtin__slice___golite__arr_int_2_len(__golite_builtin__slice___golite__arr_int_2 s) {
	return s.__size;
}

int __golite_builtin__slice___golite__arr_int_2_cap(__golite_builtin__slice___golite__arr_int_2 s) {
	return s.__capacity;
}

typedef struct {
	unsigned int __size;
	unsigned int __capacity;
	int* __contents ;
} __golite_builtin__slice_int;

void __golite_builtin__slice_int_init(__golite_builtin__slice_int* x) {
	x->__size = 0;
	x->__capacity = 0;
	x->__contents = NULL;
}

__golite_builtin__slice_int __golite_builtin__slice_int_append(__golite_builtin__slice_int* _s, int el) {
	__golite_builtin__slice_int s = *_s;
	if(s.__size == s.__capacity) {
		int* new_arr = malloc(s.__size * sizeof(int));
		memcpy(new_arr, s.__contents, s.__size * sizeof(int));
		s.__capacity *= 2;
		s.__contents = new_arr;
	}
	s.__contents[s.__size++] = el;
	return s;
}

int* __golite_builtin__slice_int_index(__golite_builtin__slice_int s, int i) {
	if(i >= 0 && i < s.__size) return s.__contents;
	else { fprintf(stderr, "Out of Bounds index on slice\n"); exit(-1); }
}

int __golite_builtin__slice_int_len(__golite_builtin__slice_int s) {
	return s.__size;
}

int __golite_builtin__slice_int_cap(__golite_builtin__slice_int s) {
	return s.__capacity;
}

typedef struct {
	__golite_builtin__slice_int data[2];
} __golite__arr___golite_builtin__slice_int_2;

bool __golite__arr___golite_builtin__slice_int_2_cmp(__golite__arr___golite_builtin__slice_int_2* p, __golite__arr___golite_builtin__slice_int_2* q) { 
	for(int i = 0; i < 2; i++) {
		if(!false) return false;
	}
	return true;
}

void __golite__arr___golite_builtin__slice_int_2_init(__golite__arr___golite_builtin__slice_int_2* x) {
	for(int i = 0; i < 2; i++) {
		__golite_builtin__slice_int_init(&x->data[i]);
	}
}
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

typedef struct {
	__golite_builtin__slice___golite__arr_int_2 f1;
	__golite__arr___golite_builtin__slice_int_2 f2;
	__golite_builtin__slice_double s;
} __golite__struct_5;

bool __golite__struct_5_cmp(__golite__struct_5* p, __golite__struct_5* q) { 
	return false && __golite__arr___golite_builtin__slice_int_2_cmp(&p->f2,&q->f2) && false;
}

void __golite__struct_5_init(__golite__struct_5* x) {
	__golite_builtin__slice___golite__arr_int_2_init(&x->f1);
	__golite__arr___golite_builtin__slice_int_2_init(&x->f2);
	__golite_builtin__slice_double_init(&x->s);
}


// ---------- Array bounds checking helpers ----------
// Type: double
static inline __attribute__((always_inline))
double*  __arr_index_double(double* arr, int i, int len) {
	if (i >= 0 && i < len) return arr;
	else {fprintf(stderr, "Out of Bounds\n"); exit(-1);}
}

// Type: int
static inline __attribute__((always_inline))
int*  __arr_index_int(int* arr, int i, int len) {
	if (i >= 0 && i < len) return arr;
	else {fprintf(stderr, "Out of Bounds\n"); exit(-1);}
}

int __golite__var_x_1;
int_init(&__golite__var_x_1);
double __golite__var_y_2 = 2.1;
string __golite__var_z_3 = "wow";
;
__golite__arr_int_10 __golite__arr() {
	__golite__arr_int_10 __golite__var_x_4;
__golite__arr_int_10_init(&__golite__var_x_4);
	int __golite__tmp_28 = 20;
	 __arr_index_int(__golite__var_x_4.data, 1, 10)[1] = __golite__tmp_28;
	return __golite__var_x_4;
}

void __golite__struct_test() {
	;
}

void __golite__array_test() {
	__golite__arr_int_100 __golite__var_x_5;
__golite__arr_int_100_init(&__golite__var_x_5);
	__golite__arr_double_100 __golite__var_y_6;
__golite__arr_double_100_init(&__golite__var_y_6);
	__golite__arr_string_20 __golite__var_z_7;
__golite__arr_string_20_init(&__golite__var_z_7);
	__golite__arr_int_10 __golite__var_x2_8;
__golite__arr_int_10_init(&__golite__var_x2_8);
	__golite__arr___golite__struct_1_20 __golite__var_p_9;
__golite__arr___golite__struct_1_20_init(&__golite__var_p_9);
	;
	__golite__arr___golite__arr_int_10_30 __golite__var_a_10;
__golite__arr___golite__arr_int_10_30_init(&__golite__var_a_10);
}

int __golite__f(int __golite__var_a_11) {
	int __golite__var_x_12;
int_init(&__golite__var_x_12);
	int __golite__var_y_13;
int_init(&__golite__var_y_13);
	return 0;
}

void __golite__exp_test() {
	int __golite__var_x_14;
int_init(&__golite__var_x_14);
	int __golite__var_y_15;
int_init(&__golite__var_y_15);
	int __golite__var_z_16;
int_init(&__golite__var_z_16);
	int __golite__var_t_17 = (__golite__var_x_14 + __golite__var_y_15);
	int __golite__var_t2_18 = (-__golite__var_x_14);
	int __golite__var_t3_19 = __golite__f(__golite__var_x_14);
	int __golite__var_t4_20 = (int)__golite__var_x_14;
	int __golite__var_t5_21 = true;
	int __golite__var_t6_22 = false;
	int __golite__var_t7_23 = 101;
	double __golite__var_t8_24 = 1.1;
	string __golite__var_t9_25 = "string";
	char __golite__var_t10_26 = 'r';
}

void __golite__assign_test() {
	int __golite__var_x_27;
int_init(&__golite__var_x_27);
	int __golite__var_y_28;
int_init(&__golite__var_y_28);
	int __golite__tmp_26 = __golite__var_y_28;
	__golite__var_x_27 = __golite__tmp_26;
	int __golite__tmp_24 = (10 + __golite__var_y_28);
	__golite__var_x_27 = __golite__tmp_24;
	int __golite__tmp_20 = __golite__var_x_27;
	int __golite__tmp_21 = 10;
	int __golite__tmp_22 = 0;
	__golite__var_y_28 = __golite__tmp_20;
;
	__golite__var_x_27 = __golite__tmp_22;
	int __golite__tmp_16 = __golite__var_y_28;
	int __golite__tmp_17 = 100;
	int __golite__tmp_18 = 1;
	__golite__var_x_27 = __golite__tmp_16;
;
	__golite__var_y_28 = __golite__tmp_18;
}

void __golite__opassign_test() {
	int __golite__var_x_29;
int_init(&__golite__var_x_29);
	int __golite__var_y_30;
int_init(&__golite__var_y_30);
	__golite__var_x_29+=__golite__var_y_30;
	__golite__var_x_29>>=__golite__var_y_30;
	__golite__var_x_29*=__golite__var_y_30;
	__golite__var_y_30+=1;
}

int __golite__inctest() {
	int __golite__var_x_31 = 10;
	__golite__var_x_31++;
	__golite__var_x_31--;
	return __golite__var_x_31;
}

void __golite__iftest() {
	int __golite__var_x_32 = 10;
	int __golite__var_y_33 = 5;
	{
		if (true) {
			printf("%s\n","fun");
		}
	}
	{
		int __golite__var_z_34 = 15;
		if ((__golite__var_x_32 > __golite__var_z_34)) {
			int __golite__tmp_10 = __golite__var_x_32;
			__golite__var_y_33 = __golite__tmp_10;
		}
		else {
			string __golite__var_yy_35 = "swag";
			if (false) {
				printf("%s\n",__golite__var_yy_35);
			}
			else {
				int __golite__var_zz_36 = 15;
				int __golite__var_zzz_37 = 20;
				if ((__golite__var_y_33 == 5)) {
					int __golite__tmp_12 = __golite__var_z_34;
					__golite__var_y_33 = __golite__tmp_12;
				}
				else {
					{
						int __golite__tmp_14 = __golite__var_y_33;
						__golite__var_x_32 = __golite__tmp_14;
					}
				}
			}
		}
	}
}

void __golite__switchtest() {
	int __golite__var_x_38;
int_init(&__golite__var_x_38);
	{
		int __golite__var_y_39 = 5;
		if (0 || (__golite__var_x_38 == 3) || (__golite__var_x_38 == 2) || (__golite__var_x_38 == 1)) {
			__golite__iftest();
		}
		else {
			if (0 || (__golite__var_x_38 == 5) || (__golite__var_x_38 == 4)) {
				int __golite__tmp_8 = 10;
				__golite__var_y_39 = __golite__tmp_8;
			}
			else {
				{
					__golite__var_y_39+=10;
				}
			}
		}
	}
	string __golite__var_xx_40 = "foo";
	{
		string __golite__var_z_41 = "foo2";
		if (0 || (strcmp(__golite__var_xx_40,"swag") == 0) || (strcmp(__golite__var_xx_40,"bar") == 0) || (strcmp(__golite__var_xx_40,"foo") == 0)) {
			__golite__iftest();
		}
		else {
			if (0 || (strcmp(__golite__var_xx_40,"dawg") == 0) || (strcmp(__golite__var_xx_40,"hey") == 0)) {
				int __golite__tmp_6 = 10;
				__golite__var_x_38 = __golite__tmp_6;
			}
			else {
				{
					__golite__var_x_38+=10;
				}
			}
		}
	}
	{
		if (0 || (strcmp(__golite__var_xx_40,"foo") == 0)) {
			__golite__iftest();
		}
		else {
			{
				__golite__iftest();
			}
		}
	}
}

void __golite__fortest() {
	int __golite__var_x_42 = 0;
	int __golite__var_y_43 = 0;
	{
		while ((__golite__var_y_43 < 1000)) {
			__golite__var_y_43++;
		__continue_lbl2:;
		}
	}
	{
		int __golite__var_i_44 = 1;
		while ((__golite__var_i_44 < 1000)) {
			{
				if (((__golite__var_i_44 % 2) == 0)) {
					goto __continue_lbl1;
				}
			}
			__golite__var_y_43--;
		__continue_lbl1:;
			int __golite__tmp_4 = (__golite__var_i_44 + 1);
			__golite__var_i_44 = __golite__tmp_4;
		}
	}
}

void __golite__print_test() {
	int __golite__var_i_45 = 5;
	string __golite__var_s_46 = "string";
	int __golite__var_b_47 = true;
	double __golite__var_f_48 = 1.;
	char __golite__var_r_49 = 'r';
	printf("%d %s %s %.6e %d\n",__golite__var_i_45,__golite__var_s_46,__golite__var_b_47 ? "true" : "false",__golite__var_f_48,__golite__var_r_49);
}

void __golite__index_test() {
	__golite__arr_int_5 __golite__var_i_50;
__golite__arr_int_5_init(&__golite__var_i_50);
	int __golite__var_y_51 =  __arr_index_int(__golite__var_i_50.data, 3, 5)[3];
	__golite__arr_double_10 __golite__var_j_52;
__golite__arr_double_10_init(&__golite__var_j_52);
	double __golite__var_z_53 =  __arr_index_double(__golite__var_j_52.data, (4 + 3), 10)[(4 + 3)];
}

void __golite__len_cap_test() {
	__golite__arr_string_5 __golite__var_arr_54;
__golite__arr_string_5_init(&__golite__var_arr_54);
	printf("%d\n",5);
	printf("%d\n",5);
	__golite_builtin__slice_string __golite__var_slc_55;
__golite_builtin__slice_string_init(&__golite__var_slc_55);
	__golite_builtin__slice_string __golite__tmp_2 = __golite_builtin__slice_string_append(&__golite__var_slc_55, "foo");
	__golite__var_slc_55 = __golite__tmp_2;
	printf("%d\n",__golite_builtin__slice_string_len(__golite__var_slc_55));
	printf("%d\n",__golite_builtin__slice_string_cap(__golite__var_slc_55));
}

double __golite__shadow_test(int __golite__var_n_56) {
	{
		double __golite__var_n_57 = ((double)__golite__var_n_56 * (double)__golite__var_n_56);
		return __golite__var_n_57;
	}
}

void __golite__main() {
	printf("%s\n","Hello world!");
	__golite__struct_test();
	__golite__fortest();
	__golite__switchtest();
	double __golite__var_ting_58 = __golite__shadow_test(5);
	;
	;
	;
}

int main() {
	__golite__main();
}
