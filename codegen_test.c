#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

typedef struct {
	unsigned int __size;
	unsigned int __capacity;
	size_t __el_size;
	 void* __contents ;
}__golite_builtin__slice;


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
	int __golite_tmp__26 = y;
	x = __golite_tmp__26;
	int __golite_tmp__24 = (10 + y);
	x = __golite_tmp__24;
	int __golite_tmp__20 = x;
	int __golite_tmp__21 = 10;
	int __golite_tmp__22 = 0;
	y = __golite_tmp__20;
;
	x = __golite_tmp__21;
	int __golite_tmp__16 = y;
	int __golite_tmp__17 = 100;
	int __golite_tmp__18 = 1;
	x = __golite_tmp__16;
;
	y = __golite_tmp__17;
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

void __golite__iftest() {
	int x = 10;
	int y = 5;
	{
		if (true) {
			printf("%s\n","fun");
		}
	}
	{
		int z = 15;
		if ((x > z)) {
			int __golite_tmp__10 = x;
			y = __golite_tmp__10;
		}
		else {
			char* yy = "swag";
			if (false) {
				printf("%s\n",yy);
			}
			else {
				int zz = 15;
				int zzz = 20;
				if ((y == 5)) {
					int __golite_tmp__12 = z;
					y = __golite_tmp__12;
				}
				else {
					{
						int __golite_tmp__14 = y;
						x = __golite_tmp__14;
					}
				}
			}
		}
	}
}

void __golite__switchtest() {
	int x;
	{
		int y = 5;
		int __golite__tmp6 = x;
		if (0 || __golite__tmp6 == 3 || __golite__tmp6 == 2 || __golite__tmp6 == 1) {
			__golite__iftest();
		}
		else {
			if (0 || __golite__tmp6 == 5 || __golite__tmp6 == 4) {
				int __golite_tmp__8 = 10;
				y = __golite_tmp__8;
			}
			else {
				{
					y+=10;
				}
			}
		}
	}
	char* xx = "foo";
	{
		char* z = "foo2";
		char* __golite__tmp3 = xx;
		if (0 || !strcmp(__golite__tmp3, "swag") || !strcmp(__golite__tmp3, "bar") || !strcmp(__golite__tmp3, "foo")) {
			__golite__iftest();
		}
		else {
			if (0 || !strcmp(__golite__tmp3, "dawg") || !strcmp(__golite__tmp3, "hey")) {
				int __golite_tmp__5 = 10;
				x = __golite_tmp__5;
			}
			else {
				{
					x+=10;
				}
			}
		}
	}
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
			{
				if (((i % 2) == 0)) {
					goto __continue_lbl1;
				}
			}
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
	__golite__print_test();
}

int main() {
	__golite__main();
}
