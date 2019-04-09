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
	string name;
	int age;
} struct_1;

typedef struct {
	int age;
	string st;
} struct_2;

typedef struct {
	int i;
	float64 f;
	struct_2 s2;
} struct_3;

int x;
float y = 2.1;
char* z = "wow";
;
void __golite__struct_test() {
	;
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
	int __golite_tmp__24 = y;
	x = __golite_tmp__24;
	int __golite_tmp__22 = (10 + y);
	x = __golite_tmp__22;
	int __golite_tmp__18 = x;
	int __golite_tmp__19 = 10;
	int __golite_tmp__20 = 0;
	y = __golite_tmp__18;
;
	x = __golite_tmp__19;
	int __golite_tmp__14 = y;
	int __golite_tmp__15 = 100;
	int __golite_tmp__16 = 1;
	x = __golite_tmp__14;
;
	y = __golite_tmp__15;
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
			int __golite_tmp__8 = x;
			y = __golite_tmp__8;
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
					int __golite_tmp__10 = z;
					y = __golite_tmp__10;
				}
				else {
					{
						int __golite_tmp__12 = y;
						x = __golite_tmp__12;
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
		if (0 || x==3 || x==2 || x==1) {
			__golite__iftest();
		}
		else {
			if (0 || x==5 || x==4) {
				int __golite_tmp__6 = 10;
				y = __golite_tmp__6;
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
		if (0 || xx=="swag" || xx=="bar" || xx=="foo") {
			__golite__iftest();
		}
		else {
			if (0 || xx=="dawg" || xx=="hey") {
				int __golite_tmp__4 = 10;
				x = __golite_tmp__4;
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

void __golite__main() {
	printf("%s\n","Hello world!");
	__golite__print_test();
}

int main() {
	__golite__main();
}
