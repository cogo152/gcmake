#include <gctest/core/gctest.hpp>

#include "public_shared.h"
#include "public_shared.hpp"

extern const int c_int;
extern const int cpp_int = 2;

using namespace gctest::assertion;

FUNCTION_TEST(test_public_c, 1)
{
    assert_equal(get_c_int(), 1);
}

FUNCTION_TEST(test_private_c, 2)
{
    assert_equal(1, c_int);
}

FUNCTION_TEST(test_public_cpp, 3)
{
    assert_equal(2, get_cpp_int());
}

FUNCTION_TEST(test_private_cpp, 4)
{
    assert_equal(2, cpp_int);
}