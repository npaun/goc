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
	{
		int __golite__var_i_0_1 = 0;
		int __golite__var_a_1_2 = 0;
		while ((__golite__var_i_0_1 < 10)) {
			printf("%d\n",__golite__var_a_1_2);
			__golite__var_a_1_2+=1;
		__continue_lbl2:;
			__golite__var_i_0_1++;
		}
	}
	{
		while (1) {
			break;
		__continue_lbl1:;
		}
	}
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
