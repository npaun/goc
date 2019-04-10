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

// ---------- Array bounds checking helpers ----------
// Type: __golite__struct_1
static inline __attribute__((always_inline))
__golite__struct_1*  __arr_index___golite__struct_1(__golite__struct_1* arr, int i, int len) {
	if (i >= 0 && i < len) return arr;
	else {fprintf(stderr, "Out of Bounds\n"); exit(-1);}
}

;
void __golite__main() {
	__golite__arr___golite__struct_1_20 parr1;
__golite__arr___golite__struct_1_20_init(&parr1);
	__golite__arr___golite__struct_1_20 parr2;
__golite__arr___golite__struct_1_20_init(&parr2);
	printf("%s\n","Before any changes:");
	printf("%s\n",__golite__arr___golite__struct_1_20_cmp(&parr1,&parr2) ? "true" : "false");
	char* __golite_tmp__2 = "bob";
	 __arr_index___golite__struct_1(parr1.data, 2, 20)[2].name = __golite_tmp__2;
	printf("%s\n","After changes:");
	printf("%s\n",__golite__arr___golite__struct_1_20_cmp(&parr1,&parr2) ? "true" : "false");
	__golite__struct_1 bob =  __arr_index___golite__struct_1(parr1.data, 2, 20)[2];
	int x;
int_init(&x);
	int y;
int_init(&y);
	float f;
float_init(&f);
	int b;
int_init(&b);
	char* s;
string_init(&s);
	char r;
char_init(&r);
	printf("%d %d %.6e %s %s %d\n",x,y,f,b ? "true" : "false",s,r);
}

int main() {
	__golite__main();
}
