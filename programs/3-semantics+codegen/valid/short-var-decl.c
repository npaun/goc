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

string __golite_num_to_string(int x) {
	string s = malloc(1);
	*s = x;
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
	int a$0 = 8;
	int c$2 = 9;
	int d$3 = 10;
	printf("%d\n",a$0);
	printf("%d\n",c$2);
}

void init_globals() {
}

void init_funcs() {
	}

int main() {
	init_globals();
	init_funcs();
	__golite__main();
}
