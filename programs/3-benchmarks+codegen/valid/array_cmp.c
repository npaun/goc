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

void __golite_builtin__slice_init(__golite_builtin__slice* x, size_t el_size) {
	x->__size = 0;
	x->__capacity = 0;
	x->__el_size = el_size;
	x->__contents = NULL;
}

void* __golite_builtin__slice_index(__golite_builtin__slice* x, int index) {
	if(index >= x->__size) { fprintf(stderr, "Out of Bounds slice index"); exit(-1); }
	else return x->__contents;
}

__golite_builtin__slice __golite__append(__golite_builtin__slice _s, void* el) {
	__golite_builtin__slice s = _s;
	if(s.__size == s.__capacity) {
		void* new_arr = malloc(s.__size * s.__el_size);
		memcpy(new_arr, s.__contents, s.__size * s.__el_size);
		s.__capacity *= 2;
		s.__contents = new_arr;
	}
	memcpy(s.__contents + (s.__el_size * s.__size), el, s.__el_size);
	s.__size++;
	return s;
}

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
	unsigned int __size;
	unsigned int __capacity;
	int* __contents ;
} __golite_builtin__slice_int;

void __golite_builtin__slice_int_init(__golite_builtin__slice_int* x) {
	x->__size = 0;
	x->__capacity = 0;
	x->__contents = NULL;
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


// ---------- Array bounds checking helpers ----------
// Type: __golite__struct_1
static inline __attribute__((always_inline))
__golite__struct_1*  __arr_index___golite__struct_1(__golite__struct_1* arr, int i, int len) {
	if (i >= 0 && i < len) return arr;
	else {fprintf(stderr, "Out of Bounds\n"); exit(-1);}
}

;
void __golite__main() {
	int x;
int_init(&x);
	int y;
int_init(&y);
	int __golite_tmp__7 = 10;
	int __golite_tmp__8 = 20;
	x = __golite_tmp__7;
	y = __golite_tmp__8;
	__golite__arr___golite__struct_1_20 parr1;
__golite__arr___golite__struct_1_20_init(&parr1);
	__golite__arr___golite__struct_1_20 parr2;
__golite__arr___golite__struct_1_20_init(&parr2);
	printf("%s\n","Before any changes:");
	printf("%s\n",__golite__arr___golite__struct_1_20_cmp(&parr1,&parr2) ? "true" : "false");
	char* __golite_tmp__5 = "bob";
	 __arr_index___golite__struct_1(parr1.data, 2, 20)[2].name = __golite_tmp__5;
	printf("%s\n","After changes:");
	printf("%s\n",__golite__arr___golite__struct_1_20_cmp(&parr1,&parr2) ? "true" : "false");
	__golite_builtin__slice_int s;
__golite_builtin__slice_int_init(&s);
	__golite_builtin__slice_int __golite_tmp__3 = __golite__append(s, 1);
	s = __golite_tmp__2;
	__golite_builtin__slice___golite__struct_1 s2;
__golite_builtin__slice___golite__struct_1_init(&s2);
}

int main() {
	__golite__main();
}
