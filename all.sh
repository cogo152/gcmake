#!/bin/bash

./gcmake-build.sh

./gcmake-build-test-local-shared-library.sh

./gcmake-build-test-local-executable.sh

./gcmake-build-test-cross-shared-library.sh

./gcmake-build-test-cross-executable.sh