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
void double_init(double* x) { *x = 0; }
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


// ---------- Array bounds checking helpers ----------
// Type: __golite__struct_1
static inline __attribute__((always_inline))
__golite__struct_1*  __arr_index___golite__struct_1(__golite__struct_1* arr, int i, int len) {
	if (i >= 0 && i < len) return arr;
	else {fprintf(stderr, "Out of Bounds\n"); exit(-1);}
}

;
char* __golite__f(int __golite__x) {
	int z;
int_init(&z);
	int y = x;
	return "wow";
}

void __golite__main() {
	int x;
int_init(&x);
	int y;
int_init(&y);
	int __golite__tmp_10 = 10;
	int __golite__tmp_11 = 20;
	int __golite__tmp_12 = 30;
	x = __golite__tmp_10;
;
	y = __golite__tmp_12;
	__golite__arr___golite__struct_1_20 parr1;
__golite__arr___golite__struct_1_20_init(&parr1);
	__golite__arr___golite__struct_1_20 parr2;
__golite__arr___golite__struct_1_20_init(&parr2);
	printf("%s\n","Before any changes:");
	printf("%s\n",__golite__arr___golite__struct_1_20_cmp(&parr1,&parr2) ? "true" : "false");
	char* __golite__tmp_8 = "bob";
	 __arr_index___golite__struct_1(parr1.data, 2, 20)[2].name = __golite__tmp_8;
	printf("%s\n","After changes:");
	printf("%s\n",__golite__arr___golite__struct_1_20_cmp(&parr1,&parr2) ? "true" : "false");
	__golite_builtin__slice_int s;
__golite_builtin__slice_int_init(&s);
	__golite_builtin__slice_int __golite__tmp_6 = __golite_builtin__slice_int_append(&s, 1);
	s = __golite__tmp_6;
	printf("%s %d\n","Indexing slice: ",(__golite_builtin__slice_int_index(s,0)[0]));
	__golite_builtin__slice___golite__struct_1 s2;
__golite_builtin__slice___golite__struct_1_init(&s2);
	__golite_builtin__slice___golite__struct_1 __golite__tmp_4 = __golite_builtin__slice___golite__struct_1_append(&s2,  __arr_index___golite__struct_1(parr1.data, 2, 20)[2]);
	s2 = __golite__tmp_4;
	printf("%s %s\n","Indexing person slice: ",(__golite_builtin__slice___golite__struct_1_index(s2,0)[0]).name);
	double f;
double_init(&f);
	double __golite__tmp_2 = 21.5;
	f = __golite__tmp_2;
	printf("%.6e\n",f);
}

int main() {
	__golite__main();
}
