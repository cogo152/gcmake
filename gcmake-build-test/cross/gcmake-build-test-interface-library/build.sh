#!/bin/bash

rm -rf build

cmake   --no-warn-unused-cli                        \
        -DOWN_TEST_ARM64:BOOL=TRUE                  \
        -S.                                         \
        -B build                                    \
        -G "Unix Makefiles"                         \

cmake   --build build                               \
        --target all test install package           \
        -j 14 --                                    \