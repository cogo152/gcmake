#!/bin/bash

rm -rf build

cmake   --no-warn-unused-cli                        \
        -DCMAKE_BUILD_TYPE:STRING=Release           \
        -S.                                         \
        -B build                                    \
        -G "Unix Makefiles"                         \

cmake   --build build                               \
        --config Release                            \
        --target all install package                \
        -j 14 --                                    \

dpkg-deb -R build/package/gcmake-build-test-executable_1.1.0_amd64.deb build/package-extract

./build/gcmake-build-test-executable_exec
