#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

typedef struct {
	unsigned int __size;
	unsigned int __capacity;
	size_t __el_size;
	 void* __contents ;
} __golite_builtin__slice;

typedef struct {
	char* data[100];
} __golite__arr_string_100;

bool __golite__arr_string_100_cmp(__golite__arr_string_100* p, __golite__arr_string_100* q) { 
	for(int i = 0; i < 100; i++) {
		if(!(strcmp(p->data[i],q->data[i]) == 0)) return false;
	}
	return true;
}

typedef struct {
	char* name;
	int age;
	__golite__arr_string_100 friend_names;
} __golite__struct_1;

bool __golite__struct_1_cmp(__golite__struct_1* p, __golite__struct_1* q) { 
	return (strcmp(p->name,q->name) == 0) && (p->age == q->age) && __golite__arr_string_100_cmp(&p->friend_names,&q->friend_names);
}

typedef struct {
	int age;
	char* st;
} __golite__struct_2;

bool __golite__struct_2_cmp(__golite__struct_2* p, __golite__struct_2* q) { 
	return (p->age == q->age) && (strcmp(p->st,q->st) == 0);
}

typedef struct {
	int i;
	float f;
	__golite__struct_2 s2;
} __golite__struct_3;

bool __golite__struct_3_cmp(__golite__struct_3* p, __golite__struct_3* q) { 
	return (p->i == q->i) && (p->f == q->f) && __golite__struct_2_cmp(&p->s2,&q->s2);
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

typedef struct {
	float data[100];
} __golite__arr_float_100;

bool __golite__arr_float_100_cmp(__golite__arr_float_100* p, __golite__arr_float_100* q) { 
	for(int i = 0; i < 100; i++) {
		if(!(p->data[i] == q->data[i])) return false;
	}
	return true;
}

typedef struct {
	char* data[20];
} __golite__arr_string_20;

bool __golite__arr_string_20_cmp(__golite__arr_string_20* p, __golite__arr_string_20* q) { 
	for(int i = 0; i < 20; i++) {
		if(!(strcmp(p->data[i],q->data[i]) == 0)) return false;
	}
	return true;
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

typedef struct {
	__golite__struct_1 data[20];
} __golite__arr___golite__struct_1_20;

bool __golite__arr___golite__struct_1_20_cmp(__golite__arr___golite__struct_1_20* p, __golite__arr___golite__struct_1_20* q) { 
	for(int i = 0; i < 20; i++) {
		if(!__golite__struct_1_cmp(&p->data[i],&q->data[i])) return false;
	}
	return true;
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


// ---------- Array bounds checking helpers ----------
// Type: float64
static inline __attribute__((always_inline))
float64 __arr_index_float64(float64 arg[], int index) {
	if (index >= 0 && index < (sizeof(arg /* TODO - this is wrong */)/sizeof(arg[0]))) return arg[index];
	else /* TODO error message */ exit(1);
}

// Type: int
static inline __attribute__((always_inline))
int __arr_index_int(int arg[], int index) {
	if (index >= 0 && index < (sizeof(arg /* TODO - this is wrong */)/sizeof(arg[0]))) return arg[index];
	else /* TODO error message */ exit(1);
}

int x;
float y = 2.1;
char* z = "wow";
;
void __golite__struct_test() {
	;
}

void __golite__array_test() {
	__golite__arr_int_100 x;
	__golite__arr_float_100 y;
	__golite__arr_string_20 z;
	__golite__arr_int_10 x2;
	__golite__arr___golite__struct_1_20 p;
	;
	__golite__arr___golite__arr_int_10_30 a;
}

int __golite__f(int __golite__a) {
	int x;
	int y;
	return 0;
}

void __golite__exp_test() {
	int x;
	int y;
	int z;
	int t = (x + y);
	int t2 = (-x);
	int t3 = __golite__f(x);
	int t4 = (int)x;
	int t5 = true;
	int t6 = false;
	int t7 = 101;
	float t8 = 1.1;
	char* t9 = "string";
	char t10 = 'r';
}

void __golite__assign_test() {
	int x;
	int y;
	int __golite_tmp__14 = y;
	x = __golite_tmp__14;
	int __golite_tmp__12 = (10 + y);
	x = __golite_tmp__12;
	int __golite_tmp__8 = x;
	int __golite_tmp__9 = 10;
	int __golite_tmp__10 = 0;
	y = __golite_tmp__8;
;
	x = __golite_tmp__9;
	int __golite_tmp__4 = y;
	int __golite_tmp__5 = 100;
	int __golite_tmp__6 = 1;
	x = __golite_tmp__4;
;
	y = __golite_tmp__5;
}

void __golite__opassign_test() {
	int x;
	int y;
	x+=y;
	x>>=y;
	x*=y;
	y+=1;
}

int __golite__inctest() {
	int x = 10;
	x++;
	x--;
	return x;
}

void __golite__fortest() {
	int x = 0;
	{
		while (1) {
			x++;
		__continue_lbl3:;
		}
	}
	int y = 0;
	{
		while ((y < 1000)) {
			y++;
		__continue_lbl2:;
		}
	}
	{
		int i = 1;
		while ((i < 1000)) {
			y--;
		__continue_lbl1:;
			int __golite_tmp__2 = (i + 1);
			i = __golite_tmp__2;
		}
	}
}

void __golite__print_test() {
	int i = 5;
	char* s = "string";
	int b = true;
	float f = 1.;
	char r = 'r';
	printf("%d %s %s %.6e %d\n",i,s,b ? "true" : "false",f,r);
}

void __golite__index_test() {
	int[5] i;
	int y =  __arr_index_int(i, 3);
	float64[10] j;
	float z =  __arr_index_float64(j, (4 + 3));
}

void __golite__main() {
	printf("%s\n","Hello world!");
}

int main() {
	__golite__main();
}
