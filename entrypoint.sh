#!/usr/bin/env sh

WORKING_DIRECTORY="${INPUT_WORKING_DIRECTORY:-./}"
cd "${WORKING_DIRECTORY}";

bazel "$@"
