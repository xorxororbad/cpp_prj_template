#!/usr/bin/env bash

export CC="clang";
export CXX="clang++";

export BUILD_PATH="${PROJECT_CODE}/.build/";
export EXT_BUILD_PATH="${PROJECT_CODE}/.build_ext/";
export DEPLOY_PATH="${PROJECT_CODE}/.deploy/";

mkdir -p "${BUILD_PATH}";
mkdir -p "${EXT_BUILD_PATH}";
mkdir -p "${DEPLOY_PATH}";

