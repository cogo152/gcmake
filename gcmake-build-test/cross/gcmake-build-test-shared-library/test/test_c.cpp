#include <gctest/core/gctest.hpp>

#include "public_shared.h"
#include "public_shared.hpp"

extern const int c_int;
extern const int cpp_int = 2;

using namespace gctest::assertion;

GCTEST_CASE(test_1)
{
    gctest_case_config(test_1, 1);

    gctest_case_now
    {
        assert_equal(get_c_int(), 1);
    }
};

GCTEST_CASE(test_2)
{
    gctest_case_config(test_2, 2);

    gctest_case_now
    {
        assert_equal(c_int, 1);
    }
};

GCTEST_CASE(test_3)
{
    gctest_case_config(test_3, 3);

    gctest_case_now
    {
        assert_equal(get_cpp_int(), 2);
    }
};

GCTEST_CASE(test_4)
{
    gctest_case_config(test_4, 4);

    gctest_case_now
    {
        assert_equal(cpp_int, 2);
    }
};