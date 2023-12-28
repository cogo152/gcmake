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

dpkg-deb -R build/package/gcmake-build-test-executable_1.0.6_arm64.deb build/package-extract

qemu-aarch64 -L /usr/aarch64-linux-gnu/ build/gcmake-build-test-executable_exec
