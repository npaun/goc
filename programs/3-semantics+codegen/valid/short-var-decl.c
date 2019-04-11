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
	int a = 5;
	int b = 6;
	int c = 7;
	printf("%d\n",a);
	printf("%d\n",b);
	printf("%d\n",c);
	int a = 8;
	int c = 9;
	int d = 10;
	printf("%d\n",a);
	printf("%d\n",c);
}

int main() {
	__golite__main();
}
