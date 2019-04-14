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

typedef struct __golite_tag__0 __golite_tag__0;
struct __golite_tag__0 {
        std::string __golite__data;
        std::array<int, 10> __golite__chld;
        __golite_tag__0() {
                __golite__data = "";
                __golite__chld = {};
        }
        bool operator==(const __golite_tag__0 &s) const {
                return __golite__data == s.__golite__data && __golite__chld == s.__golite__chld;
        }
        bool operator!=(const __golite_tag__0 &s) const {
                return __golite__data != s.__golite__data || __golite__chld != s.__golite__chld;
        }
};

int __golite_tmp_KEYS__0 = 500000;
int __golite_tmp_SEARCHES__1 = 10;
int __golite_tmp_ROUNDS__2 = 15;
int __golite__KEYS = __golite_tmp_KEYS__0;
int __golite__SEARCHES = __golite_tmp_SEARCHES__1;
int __golite__ROUNDS = __golite_tmp_ROUNDS__2;


std::array<int, 9> __golite__unpack(int __golite__key)
{
        std::array<int, 9> __golite_tmp_r__3 = {};
        std::array<int, 9> __golite__r = __golite_tmp_r__3;

        {
                int __golite_tmp__4 = (__golite__r.size() - 1);
                int __golite__i = __golite_tmp__4;
                bool __golite_tmp_loop__5 = (__golite__i >= 0);
                while (__golite_tmp_loop__5)
                {
                        {
                                int __golite_tmp__8 = (__golite__key % 10);
                                __golite__r.at(__golite__i) = __golite_tmp__8;

                                __golite__key /= 10;
                        }
__golite_tmp_continue__7: ;
                        __golite__i--;
                        __golite_tmp_loop__5 = (__golite__i >= 0);
                }
__golite_tmp_break__6: ;
        }
        return __golite__r;
}
__golite_builtin__slice<__golite_tag__0> __golite__trie_insert(__golite_builtin__slice<__golite_tag__0> __golite__t, int __golite__key, std::string __golite__data)
{
        int __golite_tmp__9 = 0;
        int __golite__cur = __golite_tmp__9;

        {
                std::array<int, 9> __golite_tmp_call__10 = ([&]() {  return __golite__unpack(__golite__key); })();
                std::array<int, 9> __golite_tmp__11 = __golite_tmp_call__10;
                std::array<int, 9> __golite__key = __golite_tmp__11;

                {
                        int __golite_tmp__12 = 0;
                        int __golite__i = __golite_tmp__12;
                        bool __golite_tmp_loop__13 = (__golite__i < __golite__key.size());
                        while (__golite_tmp_loop__13)
                        {
                                {
                                        int __golite_tmp__16 = __golite__key.at(__golite__i);
                                        int __golite__key = __golite_tmp__16;

                                        if ((__golite__t.at(__golite__cur).__golite__chld.at(__golite__key) == 0))
                                        {
                                                __golite_tag__0 __golite_tmp_nent__17 = {};
                                                __golite_tag__0 __golite__nent = __golite_tmp_nent__17;

                                                int __golite_tmp__18 = __golite__t.size();
                                                int __golite__slot = __golite_tmp__18;

                                                __golite_builtin__slice<__golite_tag__0> __golite_tmp__19 = __golite__t.append(__golite__nent);
                                                __golite__t = __golite_tmp__19;

                                                int __golite_tmp__20 = __golite__slot;
                                                __golite__t.at(__golite__cur).__golite__chld.at(__golite__key) = __golite_tmp__20;

                                        }
                                        int __golite_tmp__21 = __golite__t.at(__golite__cur).__golite__chld.at(__golite__key);
                                        __golite__cur = __golite_tmp__21;

                                }
__golite_tmp_continue__15: ;
                                __golite__i++;
                                __golite_tmp_loop__13 = (__golite__i < __golite__key.size());
                        }
__golite_tmp_break__14: ;
                }
                std::string __golite_tmp__22 = __golite__data;
                __golite__t.at(__golite__cur).__golite__data = __golite_tmp__22;

        }
        return __golite__t;
}
std::string __golite__trie_search(__golite_builtin__slice<__golite_tag__0> __golite__t, int __golite__key)
{
        int __golite_tmp__23 = 0;
        int __golite__cur = __golite_tmp__23;

        {
                std::array<int, 9> __golite_tmp_call__24 = ([&]() {  return __golite__unpack(__golite__key); })();
                std::array<int, 9> __golite_tmp__25 = __golite_tmp_call__24;
                std::array<int, 9> __golite__key = __golite_tmp__25;

                {
                        int __golite_tmp__26 = 0;
                        int __golite__i = __golite_tmp__26;
                        bool __golite_tmp_loop__27 = (__golite__i < __golite__key.size());
                        while (__golite_tmp_loop__27)
                        {
                                {
                                        int __golite_tmp__30 = __golite__key.at(__golite__i);
                                        int __golite__key = __golite_tmp__30;

                                        if ((__golite__t.at(__golite__cur).__golite__chld.at(__golite__key) == 0))
                                        {
                                                return std::string("NOTFOUND");
                                        }
                                        int __golite_tmp__31 = __golite__t.at(__golite__cur).__golite__chld.at(__golite__key);
                                        __golite__cur = __golite_tmp__31;

                                }
__golite_tmp_continue__29: ;
                                __golite__i++;
                                __golite_tmp_loop__27 = (__golite__i < __golite__key.size());
                        }
__golite_tmp_break__28: ;
                }
                return __golite__t.at(__golite__cur).__golite__data;
        }
}
void __golite__bench()
{
        __golite_builtin__slice<__golite_tag__0> __golite_tmp_t__32 = {};
        __golite_builtin__slice<__golite_tag__0> __golite__t = __golite_tmp_t__32;

        __golite_tag__0 __golite_tmp_root__33 = {};
        __golite_tag__0 __golite__root = __golite_tmp_root__33;

        __golite_builtin__slice<__golite_tag__0> __golite_tmp__34 = __golite__t.append(__golite__root);
        __golite__t = __golite_tmp__34;

        {
                int __golite_tmp__35 = 0;
                int __golite__i = __golite_tmp__35;
                bool __golite_tmp_loop__36 = (__golite__i < __golite__KEYS);
                while (__golite_tmp_loop__36)
                {
                        {
                                {
                                        {
                                                int __golite_tmp_switch__39 = (__golite__i % 3);
                                                {
                                                        if (__golite_tmp_switch__39 == 0)
                                                        {
                                                                goto __golite_tmp_body__41;
                                                        }
                                                }
                                                goto __golite_tmp_end__42;
__golite_tmp_body__41: ;
                                                {
                                                        __golite_builtin__slice<__golite_tag__0> __golite_tmp_call__43 = ([&]() {  return __golite__trie_insert(__golite__t, __golite__i, std::string("elephant")); })();
                                                        __golite_builtin__slice<__golite_tag__0> __golite_tmp__44 = __golite_tmp_call__43;
                                                        __golite__t = __golite_tmp__44;

                                                }
                                                goto __golite_tmp_break__40;
__golite_tmp_end__42: ;
                                                {
                                                        if (__golite_tmp_switch__39 == 1)
                                                        {
                                                                goto __golite_tmp_body__45;
                                                        }
                                                }
                                                goto __golite_tmp_end__46;
__golite_tmp_body__45: ;
                                                {
                                                        __golite_builtin__slice<__golite_tag__0> __golite_tmp_call__47 = ([&]() {  return __golite__trie_insert(__golite__t, __golite__i, std::string("marmot")); })();
                                                        __golite_builtin__slice<__golite_tag__0> __golite_tmp__48 = __golite_tmp_call__47;
                                                        __golite__t = __golite_tmp__48;

                                                }
                                                goto __golite_tmp_break__40;
__golite_tmp_end__46: ;
                                                {
                                                        if (__golite_tmp_switch__39 == 2)
                                                        {
                                                                goto __golite_tmp_body__49;
                                                        }
                                                }
                                                goto __golite_tmp_end__50;
__golite_tmp_body__49: ;
                                                {
                                                        __golite_builtin__slice<__golite_tag__0> __golite_tmp_call__51 = ([&]() {  return __golite__trie_insert(__golite__t, __golite__i, std::string("panther")); })();
                                                        __golite_builtin__slice<__golite_tag__0> __golite_tmp__52 = __golite_tmp_call__51;
                                                        __golite__t = __golite_tmp__52;

                                                }
                                                goto __golite_tmp_break__40;
__golite_tmp_end__50: ;
                                        }
__golite_tmp_break__40: ;
                                }
                        }
__golite_tmp_continue__38: ;
                        __golite__i++;
                        __golite_tmp_loop__36 = (__golite__i < __golite__KEYS);
                }
__golite_tmp_break__37: ;
        }
        {
                int __golite_tmp__53 = 0;
                int __golite_tmp__54 = 0;
                int __golite__i = __golite_tmp__53;
                int __golite__k = __golite_tmp__54;
                bool __golite_tmp_loop__55 = (__golite__i < __golite__SEARCHES);
                while (__golite_tmp_loop__55)
                {
                        {
                                std::string __golite_tmp_call__58 = ([&]() {  return __golite__trie_search(__golite__t, __golite__i); })();
                                std::cout << __golite_tmp_call__58 << std::endl;
                        }
__golite_tmp_continue__57: ;
                        int __golite_tmp__59 = (__golite__i + 1);
                        int __golite_tmp__60 = (__golite__k * 11);
                        __golite__i = __golite_tmp__59;
                        __golite__k = __golite_tmp__60;

                        __golite_tmp_loop__55 = (__golite__i < __golite__SEARCHES);
                }
__golite_tmp_break__56: ;
        }
}
void __golite__main()
{
        {
                int __golite_tmp__61 = 0;
                int __golite__i = __golite_tmp__61;
                bool __golite_tmp_loop__62 = (__golite__i < __golite__ROUNDS);
                while (__golite_tmp_loop__62)
                {
                        {
                                std::cout << std::string("-------------------------") << std::endl;
                                ([&]() {  return __golite__bench(); })();
                                std::cout << std::string("") << std::endl;
                        }
__golite_tmp_continue__64: ;
                        __golite__i++;
                        __golite_tmp_loop__62 = (__golite__i < __golite__ROUNDS);
                }
__golite_tmp_break__63: ;
        }
}
}
int main() {
        GoLite::__golite__main();
}
