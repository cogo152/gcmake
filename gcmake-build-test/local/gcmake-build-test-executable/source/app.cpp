#include <gcmake/build-test-static-library/public_static.h>
#include <gcmake/build-test-static-library/public_static.hpp>

#include <gcmake/build-test-shared-library/public_shared.h>
#include <gcmake/build-test-shared-library/public_shared.hpp>

#include <gcmake/build-test-interface-library/interface.h>
#include <gcmake/build-test-interface-library/interface.hpp>

#include "private.h"
#include "private.hpp"

#include <iostream>

int main()
{
    int c_int = get_c_int_static() + get_c_int_shared() + get_c_int_interface() + get_private_c_int();
    int cpp_int = staticc::get_cpp_int() + shared::get_cpp_int() + interface::get_cpp_int() + get_private_cpp_int();

    int result = c_int + cpp_int;

    std::cout << "Executable result = " << result << std::endl;
}