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

void __golite__main() {
	int a$0 = 5;
	int b$1 = 6;
	int c$2 = 7;
	printf("%d\n",a$0);
	printf("%d\n",b$1);
	printf("%d\n",c$2);
	int a$3 = 8;
	int c$4 = 9;
	int d$5 = 10;
	printf("%d\n",a$3);
	printf("%d\n",c$4);
}

int main() {
	__golite__main();
}
