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
} __golite__struct_3;

bool __golite__struct_3_cmp(__golite__struct_3* p, __golite__struct_3* q) { 
	return (p->age == q->age) && (p->st == q->st);
}

void __golite__struct_3_init(__golite__struct_3* x) {
	int_init(&x->age);
	string_init(&x->st);
}

typedef struct {
	int i;
	double f;
	__golite__struct_3 s2;
} __golite__struct_4;

bool __golite__struct_4_cmp(__golite__struct_4* p, __golite__struct_4* q) { 
	return (p->i == q->i) && (p->f == q->f) && __golite__struct_3_cmp(&p->s2,&q->s2);
}

void __golite__struct_4_init(__golite__struct_4* x) {
	int_init(&x->i);
	double_init(&x->f);
	__golite__struct_3_init(&x->s2);
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
} __golite__struct_7;

bool __golite__struct_7_cmp(__golite__struct_7* p, __golite__struct_7* q) { 
	return false && __golite__arr___golite_builtin__slice_int_2_cmp(&p->f2,&q->f2) && false;
}

void __golite__struct_7_init(__golite__struct_7* x) {
	__golite_builtin__slice___golite__arr_int_2_init(&x->f1);
	__golite__arr___golite_builtin__slice_int_2_init(&x->f2);
	__golite_builtin__slice_double_init(&x->s);
}


// ---------- Array bounds checking helpers ----------
// Type: int
static inline __attribute__((always_inline))
int*  __arr_index_int(int* arr, int i, int len) {
	if (i >= 0 && i < len) return arr;
	else {fprintf(stderr, "Out of Bounds\n"); exit(-1);}
}

// Type: double
static inline __attribute__((always_inline))
double*  __arr_index_double(double* arr, int i, int len) {
	if (i >= 0 && i < len) return arr;
	else {fprintf(stderr, "Out of Bounds\n"); exit(-1);}
}

int x$0;
double y$1;
string z$2;
;
__golite__struct_1 p$4;
__golite__arr_int_10 __golite__arr() {
	__golite__arr_int_10 x$5;
__golite__arr_int_10_init(&x$5);
	int __golite__tmp_30 = 20;
	 __arr_index_int(x$5.data, 1, 10)[1] = __golite__tmp_30;
	return x$5;
}

void __golite__struct_test() {
	;
}

void __golite__array_test() {
	__golite__arr_int_100 x$7;
__golite__arr_int_100_init(&x$7);
	__golite__arr_double_100 y$8;
__golite__arr_double_100_init(&y$8);
	__golite__arr_string_20 z$9;
__golite__arr_string_20_init(&z$9);
	__golite__arr_int_10 x2$10;
__golite__arr_int_10_init(&x2$10);
	__golite__arr___golite__struct_1_20 p$11;
__golite__arr___golite__struct_1_20_init(&p$11);
	;
	__golite__arr___golite__arr_int_10_30 a$13;
__golite__arr___golite__arr_int_10_30_init(&a$13);
}

int __golite__f(int a$14) {
	int x$15;
int_init(&x$15);
	int y$16;
int_init(&y$16);
	return 0;
}

void __golite__exp_test() {
	int x$17;
int_init(&x$17);
	int y$18;
int_init(&y$18);
	int z$19;
int_init(&z$19);
	int t$20 = (x$17 + y$18);
	int t2$21 = (-x$17);
	int t3$22 = __golite__f(x$17);
	int t4$23 = (int)x$17;
	int t5$24 = true;
	int t6$25 = false;
	int t7$26 = 101;
	double t8$27 = 1.1;
	string t9$28 = "string";
	char t10$29 = 'r';
}

void __golite__assign_test() {
	int x$30;
int_init(&x$30);
	int y$31;
int_init(&y$31);
	int __golite__tmp_28 = y$31;
	x$30 = __golite__tmp_28;
	int __golite__tmp_26 = (10 + y$31);
	x$30 = __golite__tmp_26;
	int __golite__tmp_22 = x$30;
	int __golite__tmp_23 = 10;
	int __golite__tmp_24 = 0;
	y$31 = __golite__tmp_22;
;
	x$30 = __golite__tmp_24;
	int __golite__tmp_18 = y$31;
	int __golite__tmp_19 = 100;
	int __golite__tmp_20 = 1;
	x$30 = __golite__tmp_18;
;
	y$31 = __golite__tmp_20;
}

void __golite__opassign_test() {
	int x$32;
int_init(&x$32);
	int y$33;
int_init(&y$33);
	x$32+=y$33;
	x$32>>=y$33;
	x$32*=y$33;
	y$33+=1;
}

int __golite__inctest() {
	int x$34 = 10;
	x$34++;
	x$34--;
	return x$34;
}

void __golite__iftest() {
	int x$35 = 10;
	int y$36 = 5;
	{
		if (true) {
			printf("%s\n","fun");
		}
	}
	{
		int z$37 = 15;
		if ((x$35 > z$37)) {
			int __golite__tmp_12 = x$35;
			y$36 = __golite__tmp_12;
		}
		else {
			string yy$38 = "swag";
			if (false) {
				printf("%s\n",yy$38);
			}
			else {
				int zz$39 = 15;
				int zzz$40 = 20;
				if ((y$36 == 5)) {
					int __golite__tmp_14 = z$37;
					y$36 = __golite__tmp_14;
				}
				else {
					{
						int __golite__tmp_16 = y$36;
						x$35 = __golite__tmp_16;
					}
				}
			}
		}
	}
}

void __golite__switchtest() {
	int x$41;
int_init(&x$41);
	{
		int y$42 = 5;
		if (0 || (x$41 == 3) || (x$41 == 2) || (x$41 == 1)) {
			__golite__iftest();
		}
		else {
			if (0 || (x$41 == 5) || (x$41 == 4)) {
				int __golite__tmp_10 = 10;
				y$42 = __golite__tmp_10;
			}
			else {
				{
					y$42+=10;
				}
			}
		}
	}
	string xx$43 = "foo";
	{
		string z$44 = "foo2";
		if (0 || (strcmp(xx$43,"swag") == 0) || (strcmp(xx$43,"bar") == 0) || (strcmp(xx$43,"foo") == 0)) {
			__golite__iftest();
		}
		else {
			if (0 || (strcmp(xx$43,"dawg") == 0) || (strcmp(xx$43,"hey") == 0)) {
				int __golite__tmp_8 = 10;
				x$41 = __golite__tmp_8;
			}
			else {
				{
					x$41+=10;
				}
			}
		}
	}
	{
		if (0 || (strcmp(xx$43,"foo") == 0)) {
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
	int x$45 = 0;
	int y$46 = 0;
	{
		while ((y$46 < 1000)) {
			y$46++;
		__continue_lbl2:;
		}
	}
	{
		int i$47 = 1;
		while ((i$47 < 1000)) {
			{
				if (((i$47 % 2) == 0)) {
					goto __continue_lbl1;
				}
			}
			y$46--;
		__continue_lbl1:;
			int __golite__tmp_6 = (i$47 + 1);
			i$47 = __golite__tmp_6;
		}
	}
}

void __golite__print_test() {
	int i$48 = 5;
	string s$49 = "string";
	int b$50 = true;
	double f$51 = 1.;
	char r$52 = 'r';
	printf("%d %s %s %.6e %d\n",i$48,s$49,b$50 ? "true" : "false",f$51,r$52);
}

void __golite__index_test() {
	__golite__arr_int_5 i$53;
__golite__arr_int_5_init(&i$53);
	int y$54 =  __arr_index_int(i$53.data, 3, 5)[3];
	__golite__arr_double_10 j$55;
__golite__arr_double_10_init(&j$55);
	double z$56 =  __arr_index_double(j$55.data, (4 + 3), 10)[(4 + 3)];
}

void __golite__len_cap_test() {
	__golite__arr_string_5 arr$57;
__golite__arr_string_5_init(&arr$57);
	printf("%d\n",5);
	printf("%d\n",5);
	__golite_builtin__slice_string slc$58;
__golite_builtin__slice_string_init(&slc$58);
	__golite_builtin__slice_string __golite__tmp_4 = __golite_builtin__slice_string_append(&slc$58, "foo");
	slc$58 = __golite__tmp_4;
	printf("%d\n",__golite_builtin__slice_string_len(slc$58));
	printf("%d\n",__golite_builtin__slice_string_cap(slc$58));
}

double __golite__shadow_test(int n$59) {
	{
		double n$60 = ((double)n$59 * (double)n$59);
		return n$60;
	}
}

void __golite__main() {
	printf("%s\n","Hello world!");
	__golite__struct_test();
	__golite__fortest();
	__golite__switchtest();
	double ting$65 = __golite__shadow_test(5);
	;
	;
	;
	__golite__arr_int_10 inta$69;
__golite__arr_int_10_init(&inta$69);
	int __golite__tmp_2 = 2;
	 __arr_index_int(inta$69.data, 1, 10)[1] = __golite__tmp_2;
	int i$70 = 100;
	string str$71 = __golite_num_to_string(i$70);
	char r$72 = 'r';
	string str2$73 = __golite_num_to_string(r$72);
	printf("%s %s\n","casted str from int =",str$71);
	printf("%s %s\n","casted str from rune =",str2$73);
}

void init_globals() {
	int_init(&x$0);
	y$1 = 2.1;
	z$2 = "wow";
	__golite__struct_1_init(&p$4);
}

void init_funcs() {
	{
		int x$61 = 10;
		__golite__struct_1 p$62;
__golite__struct_1_init(&p$62);
		string __golite__tmp_32 = "Bob";
		p$62.name = __golite__tmp_32;
		printf("%s\n","INIT 1");
		printf("%d %s\n",x$61,p$62.name);
	}
	{
		printf("%s\n","INIT 2");
		int x$63 = 10;
		int y$64 = 20;
		printf("%d %d\n",x$63,y$64);
	}
	{
		printf("%s\n","INIT 3");
	}
	{
		printf("%s\n","INIT 4");
	}
}

int main() {
	init_globals();
	init_funcs();
	__golite__main();
}
