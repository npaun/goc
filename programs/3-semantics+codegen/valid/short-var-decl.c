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
	int __golite__var_a_1 = 5;
	int __golite__var_b_2 = 6;
	int __golite__var_c_3 = 7;
	printf("%d\n",__golite__var_a_1);
	printf("%d\n",__golite__var_b_2);
	printf("%d\n",__golite__var_c_3);
	int __golite__var_a_4 = 8;
	int __golite__var_c_5 = 9;
	int __golite__var_d_6 = 10;
	printf("%d\n",__golite__var_a_4);
	printf("%d\n",__golite__var_c_5);
}

int main() {
	__golite__main();
}
