#!/bin/bash

rm -rf build

cmake   --no-warn-unused-cli                        \
        -S.                                         \
        -B build                                    \
        -G "Unix Makefiles"                         \

cmake   --build build                               \
        --target install package                    \
        -j 14 --                                    \

dpkg-deb -R build/package/gcmake-build_1.1.3_all.deb build/package-extract