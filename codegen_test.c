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
	int __golite_tmp__20 = y;
	x = __golite_tmp__20;
	int __golite_tmp__18 = (10 + y);
	x = __golite_tmp__18;
	int __golite_tmp__14 = x;
	int __golite_tmp__15 = 10;
	int __golite_tmp__16 = 0;
	y = __golite_tmp__14;
;
	x = __golite_tmp__15;
	int __golite_tmp__10 = y;
	int __golite_tmp__11 = 100;
	int __golite_tmp__12 = 1;
	x = __golite_tmp__10;
;
	y = __golite_tmp__11;
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
		int z = 15;
		if ((x > z)) {
			int __golite_tmp__4 = x;
			y = __golite_tmp__4;
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
					int __golite_tmp__6 = z;
					y = __golite_tmp__6;
				}
				else {
					{
						int __golite_tmp__8 = y;
						x = __golite_tmp__8;
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
				int __golite_tmp__2 = 10;
				y = __golite_tmp__2;
			}
			else {
				{
					y+=10;
				}
			}
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
