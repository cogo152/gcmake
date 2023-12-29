#include <gctest/core/test.hpp>

#include "private.h"
#include "private.hpp"

extern const int c_int;
extern const int cpp_int = 2;

GCTEST_CASE(test_1)
{
    gctest_case_config_default(test_1);

    gctest_case_now
    {
        assert_equal(get_private_c_int(), 1);
    }
};

GCTEST_CASE(test_2)
{
    gctest_case_config_default(test_2);

    gctest_case_now
    {
        assert_equal(get_private_cpp_int(), 2);
    }
};