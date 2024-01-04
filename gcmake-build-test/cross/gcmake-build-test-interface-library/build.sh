#!/bin/bash

rm -rf build

cmake   --no-warn-unused-cli                        \
        -DCMAKE_BUILD_TYPE:STRING=Release           \
        -S.                                         \
        -B build                                    \
        -G "Unix Makefiles"                         \

cmake   --build build                               \
        --config Release                            \
        --target all test install package           \
        -j 14 --                                    \