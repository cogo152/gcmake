#!/bin/bash

./gcmake-build.sh

./gcmake-build-test-local-static-library.sh

./gcmake-build-test-local-shared-library.sh

./gcmake-build-test-local-interface-library.sh

./gcmake-build-test-local-executable.sh

./gcmake-build-test-cross-static-library.sh

./gcmake-build-test-cross-shared-library.sh

./gcmake-build-test-cross-interface-library.sh

./gcmake-build-test-cross-executable.sh

./gcmake-build-test-multi-test.sh