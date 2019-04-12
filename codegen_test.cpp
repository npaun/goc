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
typedef struct __golite_tag__1 __golite_tag__1;
typedef struct __golite_tag__2 __golite_tag__2;
typedef struct __golite_tag__3 __golite_tag__3;
struct __golite_tag__0 {
        std::string __golite__name;
        int __golite__age;
        std::array<std::string, 100> __golite__friend_names;
        __golite_tag__0() {
                __golite__name = "";
                __golite__age = 0;
                __golite__friend_names = {};
        }
        bool operator==(const __golite_tag__0 &s) const {
                return __golite__name == s.__golite__name && __golite__age == s.__golite__age && __golite__friend_names == s.__golite__friend_names;
        }
        bool operator!=(const __golite_tag__0 &s) const {
                return __golite__name != s.__golite__name || __golite__age != s.__golite__age || __golite__friend_names != s.__golite__friend_names;
        }
};
struct __golite_tag__1 {
        int __golite__age;
        std::string __golite__st;
        __golite_tag__1() {
                __golite__age = 0;
                __golite__st = "";
        }
        bool operator==(const __golite_tag__1 &s) const {
                return __golite__age == s.__golite__age && __golite__st == s.__golite__st;
        }
        bool operator!=(const __golite_tag__1 &s) const {
                return __golite__age != s.__golite__age || __golite__st != s.__golite__st;
        }
};
struct __golite_tag__2 {
        int __golite__i;
        double __golite__f;
        __golite_tag__1 __golite__s2;
        __golite_tag__2() {
                __golite__i = 0;
                __golite__f = 0.0;
                __golite__s2 = {};
        }
        bool operator==(const __golite_tag__2 &s) const {
                return __golite__i == s.__golite__i && __golite__f == s.__golite__f && __golite__s2 == s.__golite__s2;
        }
        bool operator!=(const __golite_tag__2 &s) const {
                return __golite__i != s.__golite__i || __golite__f != s.__golite__f || __golite__s2 != s.__golite__s2;
        }
};
struct __golite_tag__3 {
        __golite_builtin__slice<std::array<int, 2>> __golite__f1;
        std::array<__golite_builtin__slice<int>, 2> __golite__f2;
        __golite_builtin__slice<double> __golite__s;
        __golite_tag__3() {
                __golite__f1 = {};
                __golite__f2 = {};
                __golite__s = {};
        }
};

int __golite_tmp_x__0 = 0;
int __golite__x = __golite_tmp_x__0;

double __golite_tmp_y__1 = 2.100000;
double __golite__y = __golite_tmp_y__1;

std::string __golite_tmp_z__2 = std::string("wow");
std::string __golite__z = __golite_tmp_z__2;


__golite_tag__0 __golite_tmp_p__3 = {};
__golite_tag__0 __golite__p = __golite_tmp_p__3;

std::array<int, 10> __golite__arr()
{
        std::array<int, 10> __golite_tmp_x__4 = {};
        std::array<int, 10> __golite__x = __golite_tmp_x__4;

        int __golite_tmp__5 = 20;
        __golite__x.at(1) = __golite_tmp__5;

        return __golite__x;
}
void __golite__struct_test()
{

}
void __golite__array_test()
{
        std::array<int, 100> __golite_tmp_x__6 = {};
        std::array<int, 100> __golite__x = __golite_tmp_x__6;

        std::array<double, 100> __golite_tmp_y__7 = {};
        std::array<double, 100> __golite__y = __golite_tmp_y__7;

        std::array<std::string, 20> __golite_tmp_z__8 = {};
        std::array<std::string, 20> __golite__z = __golite_tmp_z__8;

        std::array<int, 10> __golite_tmp_x2__9 = {};
        std::array<int, 10> __golite__x2 = __golite_tmp_x2__9;

        std::array<__golite_tag__0, 20> __golite_tmp_p__10 = {};
        std::array<__golite_tag__0, 20> __golite__p = __golite_tmp_p__10;


        std::array<std::array<int, 10>, 30> __golite_tmp_a__11 = {};
        std::array<std::array<int, 10>, 30> __golite__a = __golite_tmp_a__11;

}
int __golite__f(int __golite__a)
{
        int __golite_tmp_x__12 = 0;
        int __golite_tmp_y__13 = 0;
        int __golite__x = __golite_tmp_x__12;
        int __golite__y = __golite_tmp_y__13;

        return 0;
}
void __golite__exp_test()
{
        int __golite_tmp_x__14 = 0;
        int __golite_tmp_y__15 = 0;
        int __golite_tmp_z__16 = 0;
        int __golite__x = __golite_tmp_x__14;
        int __golite__y = __golite_tmp_y__15;
        int __golite__z = __golite_tmp_z__16;

        int __golite_tmp_t__17 = (__golite__x + __golite__y);
        int __golite__t = __golite_tmp_t__17;

        int __golite_tmp_t2__18 = -(__golite__x);
        int __golite__t2 = __golite_tmp_t2__18;

        int __golite_tmp_t3__19 = ([&]() {  return __golite__f(__golite__x); })();
        int __golite__t3 = __golite_tmp_t3__19;

        int __golite_tmp_t4__20 = __golite__x;
        int __golite__t4 = __golite_tmp_t4__20;

        bool __golite_tmp_t5__21 = __golite__true;
        bool __golite__t5 = __golite_tmp_t5__21;

        bool __golite_tmp_t6__22 = __golite__false;
        bool __golite__t6 = __golite_tmp_t6__22;

        int __golite_tmp_t7__23 = 101;
        int __golite__t7 = __golite_tmp_t7__23;

        double __golite_tmp_t8__24 = 1.100000;
        double __golite__t8 = __golite_tmp_t8__24;

        std::string __golite_tmp_t9__25 = std::string("string");
        std::string __golite__t9 = __golite_tmp_t9__25;

        char __golite_tmp_t10__26 = 'r';
        char __golite__t10 = __golite_tmp_t10__26;

}
void __golite__assign_test()
{
        int __golite_tmp_x__27 = 0;
        int __golite_tmp_y__28 = 0;
        int __golite__x = __golite_tmp_x__27;
        int __golite__y = __golite_tmp_y__28;

        int __golite_tmp__29 = __golite__y;
        __golite__x = __golite_tmp__29;

        int __golite_tmp__30 = (10 + __golite__y);
        __golite__x = __golite_tmp__30;

        int __golite_tmp__31 = __golite__x;
        int __golite_tmp__32 = 10;
        int __golite_tmp__33 = 0;
        __golite__y = __golite_tmp__31;
        __golite__x = __golite_tmp__33;

        int __golite_tmp__34 = __golite__y;
        int __golite_tmp__35 = 100;
        int __golite_tmp__36 = 1;
        __golite__x = __golite_tmp__34;
        __golite__y = __golite_tmp__36;

}
void __golite__opassign_test()
{
        int __golite_tmp_x__37 = 0;
        int __golite_tmp_y__38 = 0;
        int __golite__x = __golite_tmp_x__37;
        int __golite__y = __golite_tmp_y__38;

        __golite__x += __golite__y;
        __golite__x >>= __golite__y;
        __golite__x *= __golite__y;
        __golite__y += 1;
}
int __golite__inctest()
{
        int __golite_tmp_x__39 = 10;
        int __golite__x = __golite_tmp_x__39;

        __golite__x++;
        __golite__x--;
        return __golite__x;
}
void __golite__iftest()
{
        int __golite_tmp_x__40 = 10;
        int __golite__x = __golite_tmp_x__40;

        int __golite_tmp_y__41 = 5;
        int __golite__y = __golite_tmp_y__41;

        if (__golite__true)
        {
                std::cout << std::string("fun") << std::endl;
        }
        {
                int __golite_tmp__42 = 15;
                int __golite__z = __golite_tmp__42;
                if ((__golite__x > __golite__z))
                {
                        int __golite_tmp__43 = __golite__x;
                        __golite__y = __golite_tmp__43;

                }
                else
                {
                        {
                                std::string __golite_tmp__44 = std::string("swag");
                                std::string __golite__yy = __golite_tmp__44;
                                if (__golite__false)
                                {
                                        std::cout << __golite__yy << std::endl;
                                }
                                else
                                {
                                        {
                                                int __golite_tmp__45 = 15;
                                                int __golite_tmp__46 = 20;
                                                int __golite__zz = __golite_tmp__45;
                                                int __golite__zzz = __golite_tmp__46;
                                                if ((__golite__y == 5))
                                                {
                                                        int __golite_tmp__47 = __golite__z;
                                                        __golite__y = __golite_tmp__47;

                                                }
                                                else
                                                {
                                                        int __golite_tmp__48 = __golite__y;
                                                        __golite__x = __golite_tmp__48;

                                                }
                                        }
                                }
                        }
                }
        }
}
void __golite__switchtest()
{
        int __golite_tmp_x__49 = 0;
        int __golite__x = __golite_tmp_x__49;

        {
                int __golite_tmp__50 = 5;
                int __golite__y = __golite_tmp__50;
                {
                        int __golite_tmp_switch__51 = __golite__x;
                        {
                                if (__golite_tmp_switch__51 == 1)
                                {
                                        goto __golite_tmp_body__53;
                                }
                        }
                        {
                                if (__golite_tmp_switch__51 == 2)
                                {
                                        goto __golite_tmp_body__53;
                                }
                        }
                        {
                                if (__golite_tmp_switch__51 == 3)
                                {
                                        goto __golite_tmp_body__53;
                                }
                        }
                        goto __golite_tmp_end__54;
__golite_tmp_body__53: ;
                        {
                                ([&]() {  return __golite__iftest(); })();
                        }
                        goto __golite_tmp_break__52;
__golite_tmp_end__54: ;
                        {
                                if (__golite_tmp_switch__51 == 4)
                                {
                                        goto __golite_tmp_body__55;
                                }
                        }
                        {
                                if (__golite_tmp_switch__51 == 5)
                                {
                                        goto __golite_tmp_body__55;
                                }
                        }
                        goto __golite_tmp_end__56;
__golite_tmp_body__55: ;
                        {
                                int __golite_tmp__57 = 10;
                                __golite__y = __golite_tmp__57;

                        }
                        goto __golite_tmp_break__52;
__golite_tmp_end__56: ;
                        __golite__y += 10;
                }
__golite_tmp_break__52: ;
        }
        std::string __golite_tmp_xx__58 = std::string("foo");
        std::string __golite__xx = __golite_tmp_xx__58;

        {
                std::string __golite_tmp__59 = std::string("foo2");
                std::string __golite__z = __golite_tmp__59;
                {
                        std::string __golite_tmp_switch__60 = __golite__xx;
                        {
                                if (__golite_tmp_switch__60 == std::string("foo"))
                                {
                                        goto __golite_tmp_body__62;
                                }
                        }
                        {
                                if (__golite_tmp_switch__60 == std::string("bar"))
                                {
                                        goto __golite_tmp_body__62;
                                }
                        }
                        {
                                if (__golite_tmp_switch__60 == std::string("swag"))
                                {
                                        goto __golite_tmp_body__62;
                                }
                        }
                        goto __golite_tmp_end__63;
__golite_tmp_body__62: ;
                        {
                                ([&]() {  return __golite__iftest(); })();
                        }
                        goto __golite_tmp_break__61;
__golite_tmp_end__63: ;
                        {
                                if (__golite_tmp_switch__60 == std::string("hey"))
                                {
                                        goto __golite_tmp_body__64;
                                }
                        }
                        {
                                if (__golite_tmp_switch__60 == std::string("dawg"))
                                {
                                        goto __golite_tmp_body__64;
                                }
                        }
                        goto __golite_tmp_end__65;
__golite_tmp_body__64: ;
                        {
                                int __golite_tmp__66 = 10;
                                __golite__x = __golite_tmp__66;

                        }
                        goto __golite_tmp_break__61;
__golite_tmp_end__65: ;
                        __golite__x += 10;
                }
__golite_tmp_break__61: ;
        }
        {
                {
                        bool __golite_tmp_switch__67 = true;
                        {
                                if (__golite_tmp_switch__67 == (__golite__xx == std::string("foo")))
                                {
                                        goto __golite_tmp_body__69;
                                }
                        }
                        goto __golite_tmp_end__70;
__golite_tmp_body__69: ;
                        {
                                ([&]() {  return __golite__iftest(); })();
                        }
                        goto __golite_tmp_break__68;
__golite_tmp_end__70: ;
                        ([&]() {  return __golite__iftest(); })();
                }
__golite_tmp_break__68: ;
        }
}
void __golite__fortest()
{
        int __golite_tmp_x__71 = 0;
        int __golite__x = __golite_tmp_x__71;

        int __golite_tmp_y__72 = 0;
        int __golite__y = __golite_tmp_y__72;

        bool __golite_tmp_loop__73 = (__golite__y < 1000);
        while (__golite_tmp_loop__73)
        {
                {
                        __golite__y++;
                }
__golite_tmp_continue__75: ;
                __golite_tmp_loop__73 = (__golite__y < 1000);
        }
__golite_tmp_break__74: ;
        {
                int __golite_tmp__76 = 1;
                int __golite__i = __golite_tmp__76;
                bool __golite_tmp_loop__77 = (__golite__i < 1000);
                while (__golite_tmp_loop__77)
                {
                        {
                                if (((__golite__i % 2) == 0))
                                {
                                        goto __golite_tmp_continue__79;
                                }
                                __golite__y--;
                        }
__golite_tmp_continue__79: ;
                        int __golite_tmp__80 = (__golite__i + 1);
                        __golite__i = __golite_tmp__80;

                        __golite_tmp_loop__77 = (__golite__i < 1000);
                }
__golite_tmp_break__78: ;
        }
}
void __golite__print_test()
{
        int __golite_tmp_i__81 = 5;
        int __golite__i = __golite_tmp_i__81;

        std::string __golite_tmp_s__82 = std::string("string");
        std::string __golite__s = __golite_tmp_s__82;

        bool __golite_tmp_b__83 = __golite__true;
        bool __golite__b = __golite_tmp_b__83;

        double __golite_tmp_f__84 = 1.000000;
        double __golite__f = __golite_tmp_f__84;

        char __golite_tmp_r__85 = 'r';
        char __golite__r = __golite_tmp_r__85;

        std::cout << __golite__i << " " << __golite__s << " " << std::boolalpha << __golite__b << std::noboolalpha << " " << std::scientific << std::showpos << __golite__f << std::noshowpos << " " << +(__golite__r) << std::endl;
}
void __golite__index_test()
{
        std::array<int, 5> __golite_tmp_i__86 = {};
        std::array<int, 5> __golite__i = __golite_tmp_i__86;

        int __golite_tmp__87 = __golite__i.at(3);
        int __golite__y = __golite_tmp__87;

        std::array<double, 10> __golite_tmp_j__88 = {};
        std::array<double, 10> __golite__j = __golite_tmp_j__88;

        double __golite_tmp__89 = __golite__j.at((4 + 3));
        double __golite__z = __golite_tmp__89;

}
void __golite__len_cap_test()
{
        std::array<std::string, 5> __golite_tmp_arr__90 = {};
        std::array<std::string, 5> __golite__arr = __golite_tmp_arr__90;

        std::cout << __golite__arr.size() << std::endl;
        std::cout << __golite__arr.size() << std::endl;
        __golite_builtin__slice<std::string> __golite_tmp_slc__91 = {};
        __golite_builtin__slice<std::string> __golite__slc = __golite_tmp_slc__91;

        __golite_builtin__slice<std::string> __golite_tmp__92 = __golite__slc.append(std::string("foo"));
        __golite__slc = __golite_tmp__92;

        std::cout << __golite__slc.size() << std::endl;
        std::cout << __golite__slc.capacity() << std::endl;
}
double __golite__shadow_test(int __golite__n)
{
        {
                double __golite_tmp_n__93 = ((double)(__golite__n) * (double)(__golite__n));
                double __golite__n = __golite_tmp_n__93;

                return __golite__n;
        }
}
void __golite_init__0()
{
        int __golite_tmp_x__94 = 10;
        int __golite__x = __golite_tmp_x__94;

        __golite_tag__0 __golite_tmp_p__95 = {};
        __golite_tag__0 __golite__p = __golite_tmp_p__95;

        std::string __golite_tmp__96 = std::string("Bob");
        __golite__p.__golite__name = __golite_tmp__96;

        std::cout << std::string("INIT 1") << std::endl;
        std::cout << __golite__x << " " << __golite__p.__golite__name << std::endl;
}
void __golite_init__1()
{
        std::cout << std::string("INIT 2") << std::endl;
        int __golite_tmp_x__97 = 10;
        int __golite_tmp_y__98 = 20;
        int __golite__x = __golite_tmp_x__97;
        int __golite__y = __golite_tmp_y__98;

        std::cout << __golite__x << " " << __golite__y << std::endl;
}
void __golite_init__2()
{
        std::cout << std::string("INIT 3") << std::endl;
}
void __golite_init__3()
{
        std::cout << std::string("INIT 4") << std::endl;
}
void __golite__main()
{
        std::cout << std::string("Hello world!") << std::endl;
        ([&]() {  return __golite__struct_test(); })();
        ([&]() {  return __golite__fortest(); })();
        ([&]() {  return __golite__switchtest(); })();
        double __golite_tmp_ting__99 = ([&]() {  return __golite__shadow_test(5); })();
        double __golite__ting = __golite_tmp_ting__99;




        std::array<int, 10> __golite_tmp_inta__100 = {};
        std::array<int, 10> __golite__inta = __golite_tmp_inta__100;

        int __golite_tmp__101 = 2;
        __golite__inta.at(1) = __golite_tmp__101;

        int __golite_tmp_i__102 = 100;
        int __golite__i = __golite_tmp_i__102;

        std::string __golite_tmp_str__103 = std::string(1, __golite__i);
        std::string __golite__str = __golite_tmp_str__103;

        char __golite_tmp_r__104 = 'r';
        char __golite__r = __golite_tmp_r__104;

        std::string __golite_tmp_str2__105 = std::string(1, __golite__r);
        std::string __golite__str2 = __golite_tmp_str2__105;

        std::cout << std::string("casted str from int =") << " " << __golite__str << std::endl;
        std::cout << std::string("casted str from rune =") << " " << __golite__str2 << std::endl;
}
}
int main() {
        GoLite::__golite_init__0();
        GoLite::__golite_init__1();
        GoLite::__golite_init__2();
        GoLite::__golite_init__3();
        GoLite::__golite__main();
}
