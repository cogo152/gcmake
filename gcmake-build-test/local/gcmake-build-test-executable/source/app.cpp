#include <gcmake/build-test-shared-library/public_shared.h>
#include <gcmake/build-test-shared-library/public_shared.hpp>

#include <iostream>

int main()
{
    int c_int = get_c_int();
    int cpp_int = get_cpp_int();

    int result = c_int + cpp_int;

    std::cout << "Executable result = " << result << std::endl;
}