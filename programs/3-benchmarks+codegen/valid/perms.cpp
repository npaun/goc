#include <iostream>
#include <string>
#include <array>

bool __golite__true = true;
bool __golite__false = false;

namespace GoLite {
template <typename T>
struct __golite_builtin__slice {
        unsigned int __size = 0;
        unsigned int __capacity = 0;
        T *__contents = NULL;
        __golite_builtin__slice<T> append(T element) {
                return __append<__golite_builtin__slice<T>>(element);
        }

        template<class C>
        C __append(T element) {
                C ret;
                ret.__size = __size;
                ret.__capacity = __capacity;
                ret.__contents = __contents;
                if (ret.__contents == NULL || ret.__size + 1 > ret.__capacity) {
                        ret.__contents = new T[(ret.__capacity + 1) * 2];
                        ret.__capacity = (ret.__capacity + 1) * 2;
                        std::copy(__contents, __contents + __size, ret.__contents);
                }
                ret.__contents[__size] = element;
                ret.__size++;
                return ret;
        }

        T& at(unsigned int index) {
                if (index >= __size) {
                        std::cerr << "Error: index " << index << " greater than size of slice (" << __size << ")" << std::endl;
                        std::exit(EXIT_FAILURE);
                }
                return __contents[index];
        }

        int size() {
                return __size;
        }

        int capacity() {
                return __capacity;
        }
};


int __golite_tmp_MAX_SIZE__0 = 10;
int __golite__MAX_SIZE = __golite_tmp_MAX_SIZE__0;

int __golite_tmp_count__1 = 0;
int __golite__count = __golite_tmp_count__1;

void __golite__generate_perms(__golite_builtin__slice<int> __golite__acc, __golite_builtin__slice<int> __golite__selection, int __golite__start)
{
        __golite__count++;
        if ((__golite__start == (__golite__selection.size() - 1)))
        {
                return;
        }
        int __golite_tmp__2 = __golite__selection.size();
        int __golite__l = __golite_tmp__2;

        {
                int __golite_tmp__3 = __golite__start;
                int __golite__i = __golite_tmp__3;
                bool __golite_tmp_loop__4 = (__golite__i < __golite__l);
                while (__golite_tmp_loop__4)
                {
                        {
                                int __golite_tmp_cur__7 = __golite__selection.at(__golite__i);
                                int __golite__cur = __golite_tmp_cur__7;

                                __golite_builtin__slice<int> __golite_tmp_new_slice__8 = {};
                                __golite_builtin__slice<int> __golite__new_slice = __golite_tmp_new_slice__8;

                                {
                                        int __golite_tmp__9 = 0;
                                        int __golite__j = __golite_tmp__9;
                                        bool __golite_tmp_loop__10 = (__golite__j < __golite__acc.size());
                                        while (__golite_tmp_loop__10)
                                        {
                                                {
                                                        __golite_builtin__slice<int> __golite_tmp__13 = __golite__new_slice.append(__golite__acc.at(__golite__j));
                                                        __golite__new_slice = __golite_tmp__13;

                                                }
__golite_tmp_continue__12: ;
                                                __golite__j++;
                                                __golite_tmp_loop__10 = (__golite__j < __golite__acc.size());
                                        }
__golite_tmp_break__11: ;
                                }
                                __golite_builtin__slice<int> __golite_tmp__14 = __golite__new_slice.append(__golite__cur);
                                __golite__new_slice = __golite_tmp__14;

                                if (((__golite__count % 1000000) == 0))
                                {
                                        std::cout << std::string("Next 1000000th perm generated = ");
                                        {
                                                int __golite_tmp__15 = 0;
                                                int __golite__j = __golite_tmp__15;
                                                bool __golite_tmp_loop__16 = (__golite__j < __golite__new_slice.size());
                                                while (__golite_tmp_loop__16)
                                                {
                                                        {
                                                                std::cout << __golite__new_slice.at(__golite__j);
                                                        }
__golite_tmp_continue__18: ;
                                                        __golite__j++;
                                                        __golite_tmp_loop__16 = (__golite__j < __golite__new_slice.size());
                                                }
__golite_tmp_break__17: ;
                                        }
                                        std::cout << std::string("\n");
                                }
                                int __golite_tmp__19 = __golite__selection.at(__golite__start);
                                int __golite_tmp__20 = __golite__selection.at(__golite__i);
                                __golite__selection.at(__golite__i) = __golite_tmp__19;
                                __golite__selection.at(__golite__start) = __golite_tmp__20;

                                ([&]() {  return __golite__generate_perms(__golite__new_slice, __golite__selection, (__golite__start + 1)); })();
                                int __golite_tmp__21 = __golite__selection.at(__golite__start);
                                int __golite_tmp__22 = __golite__selection.at(__golite__i);
                                __golite__selection.at(__golite__i) = __golite_tmp__21;
                                __golite__selection.at(__golite__start) = __golite_tmp__22;

                        }
__golite_tmp_continue__6: ;
                        __golite__i++;
                        __golite_tmp_loop__4 = (__golite__i < __golite__l);
                }
__golite_tmp_break__5: ;
        }
}
void __golite__main()
{
        __golite_builtin__slice<int> __golite_tmp_s__23 = {};
        __golite_builtin__slice<int> __golite__s = __golite_tmp_s__23;

        {
                int __golite_tmp__24 = 0;
                int __golite__i = __golite_tmp__24;
                bool __golite_tmp_loop__25 = (__golite__i < __golite__MAX_SIZE);
                while (__golite_tmp_loop__25)
                {
                        {
                                __golite_builtin__slice<int> __golite_tmp__28 = __golite__s.append(__golite__i);
                                __golite__s = __golite_tmp__28;

                        }
__golite_tmp_continue__27: ;
                        __golite__i++;
                        __golite_tmp_loop__25 = (__golite__i < __golite__MAX_SIZE);
                }
__golite_tmp_break__26: ;
        }
        __golite_builtin__slice<int> __golite_tmp_init__29 = {};
        __golite_builtin__slice<int> __golite__init = __golite_tmp_init__29;

        ([&]() {  return __golite__generate_perms(__golite__init, __golite__s, 0); })();
}
}
int main() {
        GoLite::__golite__main();
}
