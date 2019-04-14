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


int __golite_tmp_CYCLES__0 = 3844778;
int __golite__CYCLES = __golite_tmp_CYCLES__0;

int __golite_tmp_p__1 = 15485863;
int __golite_tmp_q__2 = 17144489;
int __golite__p = __golite_tmp_p__1;
int __golite__q = __golite_tmp_q__2;

int __golite_tmp_M__3 = (__golite__p * __golite__q);
int __golite__M = __golite_tmp_M__3;

int __golite_tmp_x__4 = 809397;
int __golite__x = __golite_tmp_x__4;

int __golite__digit()
{
        int __golite_tmp__5 = ((__golite__x * __golite__x) % __golite__M);
        __golite__x = __golite_tmp__5;

        return (__golite__x & 1);
}
int __golite__randint()
{
        int __golite_tmp__6 = 0;
        int __golite__num = __golite_tmp__6;

        {
                int __golite_tmp__7 = 0;
                int __golite__i = __golite_tmp__7;
                bool __golite_tmp_loop__8 = (__golite__i < 32);
                while (__golite_tmp_loop__8)
                {
                        {
                                __golite__num |= (([&]() {  return __golite__digit(); })() << __golite__i);
                        }
__golite_tmp_continue__10: ;
                        __golite__i++;
                        __golite_tmp_loop__8 = (__golite__i < 32);
                }
__golite_tmp_break__9: ;
        }
        return __golite__num;
}
std::array<std::string, 16> __golite_tmp_w__11 = {};
std::array<std::string, 16> __golite__w = __golite_tmp_w__11;

void __golite_init__0()
{
        std::string __golite_tmp__12 = std::string("aardvark");
        std::string __golite_tmp__13 = std::string("backwater");
        std::string __golite_tmp__14 = std::string("candidate");
        std::string __golite_tmp__15 = std::string("decadence");
        __golite__w.at(0) = __golite_tmp__12;
        __golite__w.at(1) = __golite_tmp__13;
        __golite__w.at(2) = __golite_tmp__14;
        __golite__w.at(3) = __golite_tmp__15;

        std::string __golite_tmp__16 = std::string("embezzle");
        std::string __golite_tmp__17 = std::string("fascinate");
        std::string __golite_tmp__18 = std::string("gadgetry");
        std::string __golite_tmp__19 = std::string("hamburger");
        __golite__w.at(4) = __golite_tmp__16;
        __golite__w.at(5) = __golite_tmp__17;
        __golite__w.at(6) = __golite_tmp__18;
        __golite__w.at(7) = __golite_tmp__19;

        std::string __golite_tmp__20 = std::string("indoors");
        std::string __golite_tmp__21 = std::string("jawbone");
        std::string __golite_tmp__22 = std::string("keyboard");
        std::string __golite_tmp__23 = std::string("locale");
        __golite__w.at(8) = __golite_tmp__20;
        __golite__w.at(9) = __golite_tmp__21;
        __golite__w.at(10) = __golite_tmp__22;
        __golite__w.at(11) = __golite_tmp__23;

        std::string __golite_tmp__24 = std::string("merit");
        std::string __golite_tmp__25 = std::string("neptune");
        std::string __golite_tmp__26 = std::string("obtuse");
        std::string __golite_tmp__27 = std::string("payday");
        __golite__w.at(12) = __golite_tmp__24;
        __golite__w.at(13) = __golite_tmp__25;
        __golite__w.at(14) = __golite_tmp__26;
        __golite__w.at(15) = __golite_tmp__27;

}
std::string __golite__chr(int __golite__num, int __golite__idx)
{
        return std::string(1, (32 + (((__golite__num >> __golite__idx) & 255) % 94)));
}
std::string __golite__to_password(int __golite__a, int __golite__b)
{
        return (((((((([&]() {  return __golite__chr(__golite__a, 24); })() + ([&]() {  return __golite__chr(__golite__a, 16); })()) + ([&]() {  return __golite__chr(__golite__a, 8); })())
+ ([&]() {  return __golite__chr(__golite__a, 0); })()) + ([&]() {  return __golite__chr(__golite__b, 24); })()) + ([&]() {  return __golite__chr(__golite__b, 16); })()) + ([&]() {  return
__golite__chr(__golite__b, 8); })()) + ([&]() {  return __golite__chr(__golite__b, 0); })());
}
void __golite__main()
{
        {
                int __golite_tmp__28 = 0;
                int __golite__i = __golite_tmp__28;
                bool __golite_tmp_loop__29 = (__golite__i < __golite__CYCLES);
                while (__golite_tmp_loop__29)
                {
                        {
                                int __golite_tmp_call__32 = ([&]() {  return __golite__randint(); })();
                                int __golite_tmp_call__33 = ([&]() {  return __golite__randint(); })();
                                int __golite_tmp__34 = __golite_tmp_call__32;
                                int __golite_tmp__35 = __golite_tmp_call__33;
                                int __golite__a = __golite_tmp__34;
                                int __golite__b = __golite_tmp__35;

                                if (((__golite__i % 1000000) == 0))
                                {
                                        std::string __golite_tmp_call__36 = ([&]() {  return __golite__to_password(__golite__a, __golite__b); })();
                                        std::cout << std::string("Your ") << " " << __golite__i << " " << std::string("th new password is ") << " " << __golite_tmp_call__36 << " " << std::string(". Yay....") << std::endl;
                                }
                        }
__golite_tmp_continue__31: ;
                        __golite__i++;
                        __golite_tmp_loop__29 = (__golite__i < __golite__CYCLES);
                }
__golite_tmp_break__30: ;
        }
}
}
int main() {
        GoLite::__golite_init__0();
        GoLite::__golite__main();
}
