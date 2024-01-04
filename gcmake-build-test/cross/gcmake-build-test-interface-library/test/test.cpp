#include <gctest/core/test.hpp>

#include <gcmake/build-test-interface-library/interface.h>
#include <gcmake/build-test-interface-library/interface.hpp>

#include "private.h"
#include "private.hpp"

extern const int c_int;
extern const int cpp_int = 2;

GCTEST_CASE(test_1)
{
    gctest_case_config_default(test_1);

    gctest_case_now
    {
        assert_equal(get_c_int_interface() + get_private_c_int(), 2);
    }
};

GCTEST_CASE(test_2)
{
    gctest_case_config_default(test_2);

    gctest_case_now
    {
        assert_equal(interface::get_cpp_int() + get_private_cpp_int(), 4);
    }
};