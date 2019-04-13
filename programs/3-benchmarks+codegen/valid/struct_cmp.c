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
	string name;
	int age;
} __golite__struct_1;

bool __golite__struct_1_cmp(__golite__struct_1* p, __golite__struct_1* q) { 
	return (p->name == q->name) && (p->age == q->age);
}

void __golite__struct_1_init(__golite__struct_1* x) {
	string_init(&x->name);
	int_init(&x->age);
}

typedef struct {
	int x;
	int y;
	int z;
} __golite__struct_2;

bool __golite__struct_2_cmp(__golite__struct_2* p, __golite__struct_2* q) { 
	return (p->x == q->x) && (p->y == q->y) && (p->z == q->z);
}

void __golite__struct_2_init(__golite__struct_2* x) {
	int_init(&x->x);
	int_init(&x->y);
	int_init(&x->z);
}

typedef struct {
	__golite__struct_1 data[5];
} __golite__arr___golite__struct_1_5;

bool __golite__arr___golite__struct_1_5_cmp(__golite__arr___golite__struct_1_5* p, __golite__arr___golite__struct_1_5* q) { 
	for(int i = 0; i < 5; i++) {
		if(!__golite__struct_1_cmp(&p->data[i],&q->data[i])) return false;
	}
	return true;
}

void __golite__arr___golite__struct_1_5_init(__golite__arr___golite__struct_1_5* x) {
	for(int i = 0; i < 5; i++) {
		__golite__struct_1_init(&x->data[i]);
	}
}
typedef struct {
	__golite__arr___golite__struct_1_5 family;
	string address;
} __golite__struct_5;

bool __golite__struct_5_cmp(__golite__struct_5* p, __golite__struct_5* q) { 
	return __golite__arr___golite__struct_1_5_cmp(&p->family,&q->family) && (p->address == q->address);
}

void __golite__struct_5_init(__golite__struct_5* x) {
	__golite__arr___golite__struct_1_5_init(&x->family);
	string_init(&x->address);
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
;
;
;
void __golite__main() {
	__golite__struct_1 __golite__var_bob_3_1;
__golite__struct_1_init(&__golite__var_bob_3_1);
	__golite__struct_1 __golite__var_jack_4_2;
__golite__struct_1_init(&__golite__var_jack_4_2);
	string __golite__tmp_12 = "Bob";
	__golite__var_bob_3_1.name = __golite__tmp_12;
	int __golite__tmp_10 = 20;
	__golite__var_bob_3_1.age = __golite__tmp_10;
	string __golite__tmp_8 = "Jack";
	__golite__var_jack_4_2.name = __golite__tmp_8;
	int __golite__tmp_6 = 21;
	__golite__var_jack_4_2.age = __golite__tmp_6;
	printf("%s\n","Before assign:");
	printf("%s\n",__golite__struct_1_cmp(&__golite__var_bob_3_1,&__golite__var_jack_4_2) ? "true" : "false");
	__golite__struct_1 __golite__tmp_4 = __golite__var_bob_3_1;
	__golite__var_jack_4_2 = __golite__tmp_4;
	printf("%s\n","After assign:");
	printf("%s\n",__golite__struct_1_cmp(&__golite__var_bob_3_1,&__golite__var_jack_4_2) ? "true" : "false");
	__golite__arr_int_100 __golite__var_x_5_3;
__golite__arr_int_100_init(&__golite__var_x_5_3);
	__golite__arr_int_100 __golite__var_y_6_4;
__golite__arr_int_100_init(&__golite__var_y_6_4);
	__golite__arr_int_100 __golite__tmp_2 = __golite__var_y_6_4;
	__golite__var_x_5_3 = __golite__tmp_2;
}

void init_globals() {
}

void init_funcs() {
	}

int main() {
	init_globals();
	init_funcs();
	__golite__main();
}
