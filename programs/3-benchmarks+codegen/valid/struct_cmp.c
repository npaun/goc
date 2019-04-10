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
	char* name;
	int age;
} __golite__struct_1;

bool __golite__struct_1_cmp(__golite__struct_1* p, __golite__struct_1* q) { 
	return (strcmp(p->name,q->name) == 0) && (p->age == q->age);
}

typedef struct {
	int x;
	int y;
	int z;
} __golite__struct_2;

bool __golite__struct_2_cmp(__golite__struct_2* p, __golite__struct_2* q) { 
	return (p->x == q->x) && (p->y == q->y) && (p->z == q->z);
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

typedef struct {
	__golite__arr___golite__struct_1_5 family;
	char* address;
} __golite__struct_3;

bool __golite__struct_3_cmp(__golite__struct_3* p, __golite__struct_3* q) { 
	return __golite__arr___golite__struct_1_5_cmp(&p->family,&q->family) && (strcmp(p->address,q->address) == 0);
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

;
;
;
void __golite__main() {
	__golite__struct_1 bob;
	__golite__struct_1 jack;
	char* __golite_tmp__12 = "Bob";
	bob.name = __golite_tmp__12;
	int __golite_tmp__10 = 20;
	bob.age = __golite_tmp__10;
	char* __golite_tmp__8 = "Jack";
	jack.name = __golite_tmp__8;
	int __golite_tmp__6 = 21;
	jack.age = __golite_tmp__6;
	printf("%s\n","Before assign:");
	printf("%s\n",struct_eq ? "true" : "false");
	__golite__struct_1 __golite_tmp__4 = bob;
	jack = __golite_tmp__4;
	printf("%s\n","After assign:");
	printf("%s\n",struct_eq ? "true" : "false");
	__golite__arr_int_100 x;
	__golite__arr_int_100 y;
	__golite__arr_int_100 __golite_tmp__2 = y;
	x = __golite_tmp__2;
}

int main() {
	__golite__main();
}
