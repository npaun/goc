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
	int __golite__var_a_0_1 = 5;
	int __golite__var_b_1_2 = 6;
	int __golite__var_c_2_3 = 7;
	printf("%d\n",__golite__var_a_0_1);
	printf("%d\n",__golite__var_b_1_2);
	printf("%d\n",__golite__var_c_2_3);
	int __golite__var_a_0_4 = 8;
	int __golite__var_c_2_5 = 9;
	int __golite__var_d_3_6 = 10;
	printf("%d\n",__golite__var_a_0_4);
	printf("%d\n",__golite__var_c_2_5);
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
