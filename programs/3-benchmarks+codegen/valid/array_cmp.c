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
// Type: __golite__struct_1
static inline __attribute__((always_inline))
__golite__struct_1*  __arr_index___golite__struct_1(__golite__struct_1* arr, int i, int len) {
	if (i >= 0 && i < len) return arr;
	else {fprintf(stderr, "Out of Bounds\n"); exit(-1);}
}

;
string __golite__f(int x$1, double f$2) {
	int z$3;
int_init(&z$3);
	int y$4 = x$1;
	return "wow";
}

void __golite__main() {
	int x$5;
int_init(&x$5);
	int y$6;
int_init(&y$6);
	int __golite__tmp_10 = 10;
	int __golite__tmp_11 = 20;
	int __golite__tmp_12 = 30;
	x$5 = __golite__tmp_10;
;
	y$6 = __golite__tmp_12;
	__golite__arr___golite__struct_1_20 parr1$7;
__golite__arr___golite__struct_1_20_init(&parr1$7);
	__golite__arr___golite__struct_1_20 parr2$8;
__golite__arr___golite__struct_1_20_init(&parr2$8);
	printf("%s\n","Before any changes:");
	printf("%s\n",__golite__arr___golite__struct_1_20_cmp(&parr1$7,&parr2$8) ? "true" : "false");
	string __golite__tmp_8 = "bob";
	 __arr_index___golite__struct_1(parr1$7.data, 2, 20)[2].name = __golite__tmp_8;
	printf("%s\n","After changes:");
	printf("%s\n",__golite__arr___golite__struct_1_20_cmp(&parr1$7,&parr2$8) ? "true" : "false");
	__golite_builtin__slice_int s$9;
__golite_builtin__slice_int_init(&s$9);
	__golite_builtin__slice_int __golite__tmp_6 = __golite_builtin__slice_int_append(&s$9, 1);
	s$9 = __golite__tmp_6;
	printf("%s %d\n","Indexing slice: ",(__golite_builtin__slice_int_index(s$9,0)[0]));
	__golite_builtin__slice___golite__struct_1 s2$10;
__golite_builtin__slice___golite__struct_1_init(&s2$10);
	__golite_builtin__slice___golite__struct_1 __golite__tmp_4 = __golite_builtin__slice___golite__struct_1_append(&s2$10,  __arr_index___golite__struct_1(parr1$7.data, 2, 20)[2]);
	s2$10 = __golite__tmp_4;
	printf("%s %s\n","Indexing person slice: ",(__golite_builtin__slice___golite__struct_1_index(s2$10,0)[0]).name);
	double f$11;
double_init(&f$11);
	double __golite__tmp_2 = 21.5;
	f$11 = __golite__tmp_2;
	printf("%.6e\n",f$11);
}

void init_globals() {
}

int main() {
	init_globals();
	__golite__main();
}
