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
	int age;
} __golite__struct_1;

bool __golite__struct_1_cmp(__golite__struct_1* p, __golite__struct_1* q) { 
	return (p->age == q->age);
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
	__golite__arr___golite__struct_1_20 parr2;
	printf("%s\n","Before any changes:");
	printf("%s\n",__golite__arr___golite__struct_1_20_cmp(&parr1,&parr2) ? "true" : "false");
	int __golite_tmp__2 = 3;
	 __arr_index___golite__struct_1(parr1.data, 2, 20)[2].age = __golite_tmp__2;
	printf("%s\n","After changes:");
	printf("%s\n",__golite__arr___golite__struct_1_20_cmp(&parr1,&parr2) ? "true" : "false");
	__golite__struct_1 bob =  __arr_index___golite__struct_1(parr1.data, 2, 20)[2];
}

int main() {
	__golite__main();
}
