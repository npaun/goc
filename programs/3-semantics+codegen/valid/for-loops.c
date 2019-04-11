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

void __golite__main() {
	{
		int i = 0;
		int a = 0;
		while ((i < 10)) {
			printf("%d\n",a);
			a+=1;
		__continue_lbl2:;
			i++;
		}
	}
	{
		while (1) {
			break;
		__continue_lbl1:;
		}
	}
}

int main() {
	__golite__main();
}
