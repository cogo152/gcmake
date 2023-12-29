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

dpkg-deb -R build/package/gcmake-build-test-shared-library_1.0.7_amd64.deb build/package-extract
