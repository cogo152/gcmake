#!/bin/bash

rm -rf build

cmake   --no-warn-unused-cli                        \
        -S.                                         \
        -B build                                    \
        -G "Unix Makefiles"                         \

cmake   --build build                               \
        --target all install package                \
        -j 14 --                                    \