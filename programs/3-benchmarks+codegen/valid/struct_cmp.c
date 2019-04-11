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
	char* name;
	int age;
} __golite__struct_1;

bool __golite__struct_1_cmp(__golite__struct_1* p, __golite__struct_1* q) { 
	return (strcmp(p->name,q->name) == 0) && (p->age == q->age);
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
	char* address;
} __golite__struct_3;

bool __golite__struct_3_cmp(__golite__struct_3* p, __golite__struct_3* q) { 
	return __golite__arr___golite__struct_1_5_cmp(&p->family,&q->family) && (strcmp(p->address,q->address) == 0);
}

void __golite__struct_3_init(__golite__struct_3* x) {
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
	__golite__struct_1 bob;
__golite__struct_1_init(&bob);
	__golite__struct_1 jack;
__golite__struct_1_init(&jack);
	char* __golite__tmp_12 = "Bob";
	bob.name = __golite__tmp_12;
	int __golite__tmp_10 = 20;
	bob.age = __golite__tmp_10;
	char* __golite__tmp_8 = "Jack";
	jack.name = __golite__tmp_8;
	int __golite__tmp_6 = 21;
	jack.age = __golite__tmp_6;
	printf("%s\n","Before assign:");
	printf("%s\n",__golite__struct_1_cmp(&bob,&jack) ? "true" : "false");
	__golite__struct_1 __golite__tmp_4 = bob;
	jack = __golite__tmp_4;
	printf("%s\n","After assign:");
	printf("%s\n",__golite__struct_1_cmp(&bob,&jack) ? "true" : "false");
	__golite__arr_int_100 x;
__golite__arr_int_100_init(&x);
	__golite__arr_int_100 y;
__golite__arr_int_100_init(&y);
	__golite__arr_int_100 __golite__tmp_2 = y;
	x = __golite__tmp_2;
}

int main() {
	__golite__main();
}
